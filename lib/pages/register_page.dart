

import 'package:flutter/material.dart';
import 'package:minimalmessenger/services/auth/auth_service.dart';

import '../componenets/my_button.dart';
import '../componenets/my_text_field.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final passwordConfirmController = TextEditingController();

    void register(BuildContext context) {
      //get auth service
      final _auth = AuthService();

      //if password match -> create user

      if (passwordController.text == passwordConfirmController.text) {
        try {
          _auth.signUpWithEmailPassword(
              emailController.text, passwordController.text);
        } catch (e) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            ),
          );
        }
      }

      //password do not match -> show error to the user

      else{
        showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text("Password don't match!"),
            ),
          );
        }
    }

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
                    "Let's create an account",
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
                    height: 12,
                  ),
                  MyTextField(
                    controller: passwordConfirmController,
                    hintText: 'Confirm Password',
                    obsecureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                    onTap: () => register(context),
                    text: 'Sign up',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an accout? "),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: const Text(
                          "Login",
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
