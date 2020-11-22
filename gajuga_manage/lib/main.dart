import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gajuga_manage/component/body/menu/menu_page.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:provider/provider.dart';
import 'model/menu_model.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provider<Information>(create: (_) => Information()),
        Provider<Information>.value(value: Information()),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
