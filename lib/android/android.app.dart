import 'package:flutter/material.dart';

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Contatos"),
        ),
        body: Container(),
        floatingActionButton: FloatingActionButton(
          elevation: 8.0,
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
