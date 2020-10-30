import 'package:flutter/material.dart';
import 'header.dart';

void main() => runApp(MainScreen());

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GAJUGA.",
      theme: ThemeData(
        primaryColor: Color.fromRGBO(234, 230, 218, 1.0),
      ),
      themeMode: ThemeMode.light,
      home: Header(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromRGBO(234, 230, 218, 1.0),
          child: Center(
            child: Text('main screen'.toUpperCase()),
          ),
        ),
      ),
    );
  }
}
