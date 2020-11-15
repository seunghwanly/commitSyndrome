import 'package:flutter/material.dart';
import 'package:gajuga_user/provider/provider.dart';
import 'package:provider/provider.dart';
import 'component/header/header.dart';
import 'component/body/main_menu.dart';
import 'component/body/shopping_cart.dart';
import './util/palette.dart';

void main() => runApp(MainScreen());

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<StateProvider>(create: (context) => StateProvider())
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
            home: new CustomHeader(
              body: mainBody(),
            )));
  }
}

Widget mainBody() {
  return ListView(
    children: [
      TotalMenu(),
      //  totalMenu(),
      FavoriteMenuWidget()
    ],
  );
}
