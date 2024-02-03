import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:charity/ui/user/features/authentication/screens/choise_screen/choise_screen.dart';
import 'package:flutter/material.dart';
import '../../../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChoiseScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              Assets.imagesFirist,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Center(
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  // Add a text color
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('CHARITY'),
                  ],
                  isRepeatingAnimation: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
