import 'package:flutter/material.dart';
import 'package:flutter_app/pages/tabs.page.dart';
import 'package:flutter_app/themes/dark.theme.dart';
import 'package:flutter_app/themes/light.theme.dart';
import 'package:flutter_app/themes/purple.theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App Firebase',
      debugShowCheckedModeBanner: false,
      theme: darkPurpleTheme(),
      home: DefaultTabController(
        length: 2,
        child: TabsPage(),
      ),
    );
  }
}
