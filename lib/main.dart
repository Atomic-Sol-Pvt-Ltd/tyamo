import 'package:flutter/material.dart';
// import 'package:tyamo/views/auth/forgot_password.dart';
import 'package:tyamo/views/profile/profile_setup.dart';
// import 'package:tyamo/views/auth/register.dart';

void main() {
  runApp(const Tyamo());
}

class Tyamo extends StatelessWidget {
  const Tyamo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tyamo',
      color: Colors.white,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ProfileSetup(),
    );
  }
}
