import 'package:flutter/material.dart';
import 'box_shadow.dart';

Container minusButton(double size) {
  return Container(
    alignment: Alignment.topCenter,
    width: size,
    height: size,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [customeBoxShadow()],
        color: Color.fromRGBO(218, 155, 104, 1.0)),
    // child: Image(image: AssetImage('images/icon/remove_outline_white.png'),),
    child: Text(
      '-',
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 24,
        color: Colors.white,
      ),
      textAlign: TextAlign.justify,
    ),
  );
}

Container plusButton(double size) {
  return Container(
    alignment: Alignment.topCenter,
    width: size,
    height: size,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [customeBoxShadow()],
        color: Color.fromRGBO(218, 155, 104, 1.0)),
    // child: new RotationTransition(
    //   turns: new AlwaysStoppedAnimation(45 / 360),
    //   child:  Image(image: AssetImage('images/icon/close_white.png')),
    //   ),
    child: Text(
      '+',
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 24,
        color: Colors.white,
      ),
      textAlign: TextAlign.justify,
    ),
  );
}
