import 'package:flutter/material.dart';
import 'package:flutter_expenses/pages/home/home.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Expenses',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'OpenSans',
      ),
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.pink,
        fontFamily: 'OpenSans',
      ),
      home: Home(),
    );
  }
}
