import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ui_teach_news/constant/const.dart';
import 'package:ui_teach_news/screen/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: AnimatedSplashScreen(
          nextScreen: const Home(),
          backgroundColor: titleColor,
          splash: Image.asset(
            "assets/image/icon.png",
            width: 300,
            height: 300,
          ),
          splashTransition: SplashTransition.slideTransition,
        ),
      ),
    );
  }
}
