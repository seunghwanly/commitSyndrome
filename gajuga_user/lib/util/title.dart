import 'package:flutter/material.dart';

Widget makeText(String title, Color color, double paddingLeft) {
  return Container(
    child: Text(
      title,
      style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 20),
      textAlign: TextAlign.left,
    ),
    padding: EdgeInsets.only(left: paddingLeft),
  );
}

Widget makeTitle(@required String left, @required String right) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 20),
    child: Row(
      children: [
        Text(
          left,
          style: TextStyle(
            color: Color.fromRGBO(218, 155, 104, 1.0),
            fontWeight: FontWeight.bold,
            fontSize: 22
          ),
          textAlign: TextAlign.left,
        ),
        Text(
          right,
          style: TextStyle(
            color: Color.fromRGBO(33, 33, 31, 1.0),
            fontWeight: FontWeight.bold,
            fontSize: 22
          ),
          textAlign: TextAlign.left,
        )
      ],
    ),
  );
}