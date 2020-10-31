import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  
  final body;

  Header({ Key key, @required this.body}) : super(key : key);

  @override
  _Header createState() => _Header();
}

class _Header extends State<Header> {

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
        body: widget.body
        );
  }
}
