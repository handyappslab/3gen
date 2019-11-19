import 'package:flutter/material.dart';

import './pages/accountSetup.dart';
import './pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Color primaryColor = Color(0xff2e3c55);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3GEN',
      theme: ThemeData(
        primaryColor: Color(0xff2e3c55),
        canvasColor: Colors.white,
        hintColor: primaryColor,
      ),
      home: AccountSetup(),
      routes: {
        "/home": (_) => Home()
      },
    );
  }
}
