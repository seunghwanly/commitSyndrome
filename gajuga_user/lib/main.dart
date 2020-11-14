import 'package:flutter/material.dart';
import 'package:gajuga_user/model/selected_option_model.dart';
import 'package:provider/provider.dart';
import 'component/header/header.dart';
import 'component/body/main_menu.dart';
import './util/palette.dart';

void main() => runApp(MainScreen());

MainScreenState parentState = new MainScreenState();

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => parentState;
}

class MainScreenState extends State<MainScreen> {
  int resetflag = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OptionList>(
        create: (_) => OptionList(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/main': (context) => MainScreen(),
            },
            title: "GAJUGA.",
            theme:
                ThemeData(primaryColor: pale, canvasColor: Colors.transparent),
            themeMode: ThemeMode.light,
            home: CustomHeader(
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
