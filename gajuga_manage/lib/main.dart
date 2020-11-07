import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/main_menu.dart';
import 'package:gajuga_manage/component/body/menu_manage.dart';
import 'package:gajuga_manage/component/header/header_menu.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/component/header/header.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GAJUGA.",
      theme: ThemeData(
        primaryColor: pale,
        canvasColor: Colors.transparent,
      ),
      themeMode: ThemeMode.light,
      home: CustomHeader(
        body: mainBody(),
      ),
    );
  }
}

Widget mainBody() {
  return Column(
    children: [
      HeaderMenu(),
      SizedBox(height: 20),
      MenuManage(),
      // TotalMenuWidget(),
      //  totalMenu(),
      // FavoriteMenuWidget()
    ],
  );
}
