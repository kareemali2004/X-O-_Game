import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:xo/screens/game_screen.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController player1 = TextEditingController();

  TextEditingController player2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Container(
            height: 280,
            width: 280,
            child: Center(
              child: Lottie.asset('assets/animation_lm1tqt8n.json'),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: TextFormField(
                    controller: player1,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "player1 name is requried";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Player X Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            15.0), // Adjust the radius as needed
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: TextFormField(
                    controller: player2,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "player2 name is requried";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Player O Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            15.0), // Adjust the radius as needed
                      ),
                    ),
                  ),
                ),
              ],
            )),
        const SizedBox(
          height: 30,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.red, // Background color of the container
          ),
          child: TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GameScreen(
                      player1: player1.text,
                      player2: player2.text,
                    );
                  }));
                }
              },
              child: const Text(
                'Start Game',
                style: TextStyle(color: Colors.white),
              )),
        )
      ]),
    );
  }
}
