
import 'package:flutter/material.dart';
import 'package:minimalmessenger/services/auth/auth_service.dart';
import 'package:minimalmessenger/componenets/my_button.dart';
import 'package:minimalmessenger/componenets/my_text_field.dart';

class LoginPage extends StatelessWidget {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final void Function()? onTap;

   LoginPage({
    super.key,
    required this.onTap,
  });

  void login(BuildContext context) async{
    final authService = AuthService();

    //try login
    try{
      await authService.signInWithEmailPassword(emailController.text, passwordController.text);
    }

    //catch any errors
    catch(e){
      showDialog(context: context, builder: (context) => const AlertDialog(
      ),);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Icon(
                    Icons.messenger_outline,
                    size: 36,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Welcome Back! You've been missed",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obsecureText: false,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obsecureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                    onTap: () => login( context),
                    text: 'Log in',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Not a member ?"),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: const Text(
                          "Register now",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
