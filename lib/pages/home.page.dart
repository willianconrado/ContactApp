import 'package:flutter/material.dart';
import 'package:flutter_app/pages/config.dart';
import 'package:flutter_app/pages/login.page.dart';
import 'package:flutter_app/pages/signup.page.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.person_add), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),), );
          },), 
          IconButton(icon: Icon(Icons.settings), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Configs(),), );
          },),],
        backgroundColor: Theme.of(context).primaryColor,
        shadowColor: Colors.black12,
      ),
    );
  }
}
