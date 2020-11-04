import 'package:flutter/material.dart';
import 'component/header/header.dart';
import 'component/body/main_menu.dart';
import './util/palette.dart';

void main() => runApp(MainScreen());

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "GAJUGA.",
        theme: ThemeData(primaryColor: pale, canvasColor: Colors.transparent),
        themeMode: ThemeMode.light,
        home: CustomHeader(
          body: mainBody(),
        ));
  }
}

Widget mainBody() {
  return ListView(
    children: [
      TotalMenuWidget(),
      //  totalMenu(),
      FavoriteMenuWidget()
    ],
  );
}
