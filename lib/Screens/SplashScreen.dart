import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vplay/Screens/HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Adding 3 seconds of delay
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Center(
              child: SizedBox(
                width: 80,
                height: 80,
                child: Image.asset("assets/images/VPlay.png"),
              ),
            ),
            const Spacer(flex: 2),
            const Text(
              "VPlay Video Player",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
