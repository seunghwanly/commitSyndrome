import 'package:flutter/material.dart';
import 'package:gajuga_manage/model/sales_profit_model.dart';
import 'package:gajuga_manage/util/loading.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gajuga_manage/component/body/menu/menu_page.dart';
import 'package:gajuga_manage/component/body/authentification/firebase_provider.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:provider/provider.dart';
import 'model/menu_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  static String userid = '';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
              providers: [
                ChangeNotifierProvider<FirebaseAuthService>(
                  create: (_) => FirebaseAuthService(),
                ),
                Provider<Information>.value(value: Information()),
                ChangeNotifierProvider<Sales>(create: (_) => Sales())
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
              ));
        }
        if (snapshot.hasError) {
          return Text("Firebase initalize error !");
        }
        return MaterialApp(
          home: Scaffold(
            body: Center(child: customLoadingBouncingGrid(white)),
          ),
        );
      },
    );
  }
}
