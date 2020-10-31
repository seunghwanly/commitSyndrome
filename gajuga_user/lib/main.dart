import 'package:flutter/material.dart';
import 'component/main_menu.dart';

void main() => runApp(MainScreen());

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "GAJUGA.",
        theme: ThemeData(
          primaryColor: Color.fromRGBO(234, 230, 218, 1.0),
        ),
        themeMode: ThemeMode.light,
        home: CustomHeader());
  }
}

class CustomHeader extends StatefulWidget {
  @override
  _CustomHeaderState createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    void _openDrawer() {}

    void _gotoCart() {}

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GAJUGA.',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.format_list_bulleted),
          onPressed: _openDrawer,
          alignment: Alignment.centerLeft,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: _gotoCart,
            alignment: Alignment.centerRight,
          ),
        ],
      ),
      // body: widget.body
      body: mainBody(),
    );
  }
}

Widget mainBody() {
  return Container(
    color: Color.fromRGBO(234, 230, 218, 1.0),
    padding: EdgeInsets.only(top: 30),
    child: ListView(
      children: [totalMenu(), favoriteMenu()],
    ),
  );
}
