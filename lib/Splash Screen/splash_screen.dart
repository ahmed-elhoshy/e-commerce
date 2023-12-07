import 'dart:async';

import 'package:e_commerce/UI/Home/home_screen/home_screen_view.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routename = 'splash-screen';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      // Navigator.of(context).pushReplacementNamed(LoginScreen.routename);
      Navigator.of(context).pushReplacementNamed(HomeScreenView.routename);
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
