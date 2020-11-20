import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gajuga_manage/component/body/menu/menu_page.dart';
import 'package:gajuga_manage/util/palette.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
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
        primaryColor: pale,
        canvasColor: Colors.transparent,
      ),
      themeMode: ThemeMode.light,
      home: Scaffold(
        body: MenuPage(),
      ),
    );
  }
}
