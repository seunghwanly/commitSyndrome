import 'package:flutter/material.dart';
import 'component/header/custom_header.dart';
import 'component/body/main_menu.dart';

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
        home: CustomHeader(
          body: mainBody(),
        ));
  }
}

Widget mainBody() {
  return ListView(
    children: [totalMenu(), favoriteMenu()],
  );
}
