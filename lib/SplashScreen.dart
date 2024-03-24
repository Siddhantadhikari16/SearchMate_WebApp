import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  void dispose() {
    // Enable all system overlays
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.cyanAccent, Colors.blue],
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              ),
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  height: 100,
                  width: 100,
                  child: Image.asset(
                      'Assets/Images/output-onlinegiftools (1).gif',
                      fit: BoxFit.fill),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
