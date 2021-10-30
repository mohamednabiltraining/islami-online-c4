import 'package:flutter/material.dart';
import 'package:islami_online_c4/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami',
      routes: {HomeScreen.routeName: (buildContext) => HomeScreen()},
      initialRoute: HomeScreen.routeName,
    );
  }
}

class MyThemeData {
  static final primaryColor = Color.fromRGBO(182, 129, 53, 1.0);
  static final selectedIconColor = Color.fromRGBO(1, 1, 1, 1);
  static final unSelectedIconColor = Color.fromRGBO(236, 230, 230, 1.0);
}
