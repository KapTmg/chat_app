import 'package:flutter/material.dart';
import 'package:minimalmessenger/componenets/user_tile.dart';
import 'package:minimalmessenger/pages/chat_page.dart';
import 'package:minimalmessenger/services/auth/auth_service.dart';
import 'package:minimalmessenger/componenets/my_drawer.dart';
import 'package:minimalmessenger/services/chat/chat_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});


  //chat and auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void logout() {
    //get auth service
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
        actions: [
          //logout
          IconButton(onPressed: logout, icon: const Icon(Icons.logout))
        ],
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return const Text("Error");
        }

        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }

        //return list view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //display all users except current user
    if (userData['email'] != _authService.getCurrentUser()!.email) {
      return UserTile(
        onTap: () {
          //tapped on a user -> go to chat page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
                receiverID: userData['uid'],
              ),
            ),
          );
        },
        text: userData["email"],
      );
    } else {
      return Container();
    }
  }

  
}
