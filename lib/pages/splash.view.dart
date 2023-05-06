import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'login.page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  Future delay(context) async {
    await Future.delayed(
        const Duration(
          milliseconds: 7000,
        ), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    delay(context);

    return Scaffold(
      body: Center(
        child: Stack(alignment: Alignment.centerLeft, children: [
          const RiveAnimation.asset(
            'assets/perrito.riv',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Bem-vindo ao Contact App",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const FlutterLogo(
                  size: 150,
                  style: FlutterLogoStyle.horizontal,
                  textColor: Colors.blue,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
