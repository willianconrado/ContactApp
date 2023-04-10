import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.page.dart';
import 'themes/purple.theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App Firebase',
      debugShowCheckedModeBanner: false,
      theme: darkPurpleTheme(),
      home: DefaultTabController(
        length: 2,
        child: HomePage(),
      ),
    );
  }
}
