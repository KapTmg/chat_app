import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minimalmessenger/firebase_options.dart';
import 'package:minimalmessenger/services/auth/auth_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.grey.shade300,
          primary: Colors.grey.shade400,
          secondary: Colors.grey.shade200,
          tertiary: Colors.white,
          inversePrimary: Colors.grey.shade900,
        ),
      ),
    );
  }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
}



