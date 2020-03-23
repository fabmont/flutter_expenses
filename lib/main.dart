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
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.blueAccent,
        fontFamily: 'OpenSans',
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      ),
      home: Home(),
    );
  }
}
