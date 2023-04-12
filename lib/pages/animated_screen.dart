import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'tabs.page.dart';

class AnimatedScreen extends StatelessWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  Future delay(context) async {
    await Future.delayed(
        const Duration(
          milliseconds: 3000,
        ), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    delay(context);

    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 60,
          ),
          Container(
            width: double.infinity,
            height: 300,
          //  child: FlareActor(
          //    "assets/work.png",
          //    alignment: Alignment.center,
          //    fit: BoxFit.contain,
          //    isPaused: false,
          //   // animation: 'toemater',
          //  ),
          ),
          const Text(
            "Bem-vindo ao meu app!",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
