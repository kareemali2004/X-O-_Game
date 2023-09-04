import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:xo/screens/second_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return SecondScreen();
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(child: Lottie.asset('assets/animation_lm1tqt8n.json')),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tic ",
              style: TextStyle(
                  color: Colors.red, fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              "Tac ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Toe",
              style: TextStyle(
                  color: Colors.red, fontSize: 40, fontWeight: FontWeight.bold),
            )
          ],
        )
      ]),
    );
  }
}
