import 'package:flutter/material.dart';
import 'package:gajuga_user/provider/provider.dart';
import 'package:gajuga_user/model/firebase_provider.dart';
import 'package:provider/provider.dart';
import 'component/header/header.dart';
import 'component/body/main_menu.dart';
import 'component/body/shopping_cart.dart';
import './util/palette.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  static String userid = '';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<StateProvider>(
              create: (context) => StateProvider()),
          ChangeNotifierProvider<FirebaseAuthService>(
            create: (_) => FirebaseAuthService(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/main': (context) => MainScreen(),
              '/shoppingCart': (context) => ShoppingCartRoute(),
            },
            title: "GAJUGA.",
            theme:
                ThemeData(primaryColor: pale, canvasColor: Colors.transparent),
            themeMode: ThemeMode.light,
            home: new Scaffold(
              body: mainBody(),
            )));
  }
}

Widget mainBody() {
  return CustomHeader(
      body: ListView(
    children: [
      TotalMenu(),
      //  totalMenu(),
      FavoriteMenuWidget()
    ],
  ));
}
