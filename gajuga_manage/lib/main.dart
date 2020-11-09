import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/menu/menu_manage.dart';
import 'package:gajuga_manage/component/body/staff/staff_manage.dart';
import 'package:gajuga_manage/component/body/staff/staff_profile.dart';
import 'package:gajuga_manage/component/body/stock/stock_manage.dart';
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
      // TODO: 탭에 따라 아래쪽 화면만 바꿔줘야 함
      // MenuManage(),
      // StaffManage(),
      //StaffProfile(),
      StockManage()
    ],
  );
}
