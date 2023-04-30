import 'package:flutter/material.dart';
import 'package:flutter_app/themes/dark.theme.dart';
import 'package:rive/rive.dart';

import 'login.page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  Future delay(context) async {
    await Future.delayed(
        const Duration(
          milliseconds: 10000,
        ), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
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
                SizedBox(
                  height: 50,
                ),
                FlutterLogo(
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
