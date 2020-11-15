import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gajuga_manage/component/body/chef_page.dart';
import 'package:gajuga_manage/component/body/menu/menu_manage.dart';
import 'package:gajuga_manage/component/body/order_page.dart';
import 'package:gajuga_manage/component/body/sales/sales_manage.dart';
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
  bool isOrderPage = false; // TODO: 주문 관련 페이지만 true가 되도록 처리하기(다크모드)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('ko', 'KO'), // Korean
      ],
      title: "GAJUGA.",
      theme: ThemeData(
        primaryColor: isOrderPage ? darkgrey : pale,
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
      // TODO: 탭에 따라 아래쪽 화면만 바꿔줘야 함, 주문 관련 페이지에는 HeaderMenu 들어가지 않음
      //MenuManage(),
      // StaffManage(),
      // StaffProfile(),
      SalesManage(),
      // StockManage(),
      // ChefPage(),
      // OrderPage(),
    ],
  );
}
