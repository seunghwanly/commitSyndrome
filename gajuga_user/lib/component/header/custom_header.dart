import 'package:flutter/material.dart';

class CustomHeader extends StatefulWidget {

  CustomHeader({ @required this.body });

  final body;

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
      body: widget.body,
    );
  }
}