import 'dart:async';

import 'package:flutter/material.dart';

import '../Login Screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routename = 'splash-screen';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routename);
    });
    return Scaffold(
      body: Image.asset(
        'assets/images/Splash_Screen.png',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
