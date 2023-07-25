import 'dart:async'; // import timer widget
import 'package:flutter/material.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const MainScreen()))); //page linked with MainScreen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png', height: 180, width: 180),
          const SizedBox(height: 20),
          Text(
            'BMI Calculator',
            style: TextStyle(
              fontSize: 30,
              color: Theme.of(context).highlightColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ));
  }
}
