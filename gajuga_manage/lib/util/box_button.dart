import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/box_shadow.dart';

Container minusButton(double size) {
  return Container(
    alignment: Alignment.topCenter,
    width: size,
    height: size,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      boxShadow: [customBoxShadow()],
      color: Color.fromRGBO(218, 155, 104, 1.0),
    ),
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
      boxShadow: [customBoxShadow()],
      color: Color.fromRGBO(218, 155, 104, 1.0),
    ),
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

RaisedButton tapButton(
    Function onPress,
    Color initColor,
    Color splashColor,
    String title,
    Color textColor,
    double textSize,
    double width,
    double height,
    double paddingVertical,
    double paddingHorizontal,
    double marginHorizontal) {
  return RaisedButton(
      onPressed: onPress,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: initColor,
      splashColor: splashColor,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(vertical: paddingVertical, horizontal: paddingHorizontal),
        margin: EdgeInsets.only(left: marginHorizontal, right: marginHorizontal),
        child: Text(
          title,
          style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: textSize),
          textAlign: TextAlign.center,
        ),
      ));
}
