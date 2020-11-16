import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gajuga_manage/component/body/header_button.dart';
import 'package:gajuga_manage/component/body/menu/menu_page.dart';
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
      home: Scaffold(
        body: MenuPage(),
      ),
    );
  }
}
