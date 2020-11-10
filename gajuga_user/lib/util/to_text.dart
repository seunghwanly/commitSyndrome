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

Widget makeTextSize(
    String title, Color color, double paddingLeft, double size) {
  return Container(
    child: Text(
      title,
      style:
          TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: size),
      textAlign: TextAlign.left,
    ),
    padding: EdgeInsets.only(left: paddingLeft),
  );
}

Widget makeTextSizepadding(String title, Color color, double paddingLeft,
    double paddingBottom, double size) {
  return Container(
    child: Text(
      title,
      style:
          TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: size),
      textAlign: TextAlign.left,
    ),
    padding: EdgeInsets.only(left: paddingLeft, bottom: paddingBottom),
  );
}

Widget makeTextSizepaddingWidth(String title, Color color, double paddingLeft,
    double paddingBottom, double size, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width / 2.3,
    child: Text(
      title,
      style:
          TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: size),
      textAlign: TextAlign.left,
    ),
    padding: EdgeInsets.only(left: paddingLeft, bottom: paddingBottom),
  );
}

Widget makeTextSizepaddingRight(String title, Color color, double paddingRight,
    double paddingBottom, double size) {
  return Container(
    child: Text(
      title,
      style:
          TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: size),
      textAlign: TextAlign.right,
    ),
    padding: EdgeInsets.only(right: paddingRight, bottom: paddingBottom),
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
              fontSize: 20),
          textAlign: TextAlign.left,
        ),
        Text(
          right,
          style: TextStyle(
              color: Color.fromRGBO(33, 33, 31, 1.0),
              fontWeight: FontWeight.bold,
              fontSize: 20),
          textAlign: TextAlign.left,
        )
      ],
    ),
  );
}

Widget makeTitleSize(
    String left, String right, double marginLeft, double size, bool reverse) {
  if (!reverse) {
    return Container(
      margin: EdgeInsets.only(left: marginLeft),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              left,
              style: TextStyle(
                  color: Color.fromRGBO(218, 155, 104, 1.0),
                  fontWeight: FontWeight.bold,
                  fontSize: size),
              textAlign: TextAlign.center,
            ),
            Text(
              right,
              style: TextStyle(
                  color: Color.fromRGBO(33, 33, 31, 1.0),
                  fontWeight: FontWeight.bold,
                  fontSize: size),
              textAlign: TextAlign.center,
            )
          ]),
    );
  } else {
    return Container(
      margin: EdgeInsets.only(left: marginLeft),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              left,
              style: TextStyle(
                  color: Color.fromRGBO(33, 33, 31, 1.0),
                  fontWeight: FontWeight.bold,
                  fontSize: size),
              textAlign: TextAlign.center,
            ),
            Text(
              right,
              style: TextStyle(
                  color: Color.fromRGBO(218, 155, 104, 1.0),
                  fontWeight: FontWeight.bold,
                  fontSize: size),
              textAlign: TextAlign.center,
            )
          ]),
    );
  }
}

Widget makeThreeTitle(@required String left, @required String center,
    @required String right, @required BuildContext context) {
  return Container(
    alignment: Alignment.centerLeft,
    margin:
        EdgeInsets.only(left: MediaQuery.of(context).size.width * (15 / 375)),
    child: Row(
      children: [
        Text(
          left,
          style: TextStyle(
              color: Color.fromRGBO(33, 33, 31, 1.0),
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width / 28),
          textAlign: TextAlign.left,
        ),
        Text(
          center,
          style: TextStyle(
              color: Color.fromRGBO(218, 155, 104, 1.0),
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width / 28),
          textAlign: TextAlign.left,
        ),
        Text(
          right,
          style: TextStyle(
              color: Color.fromRGBO(33, 33, 31, 1.0),
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width / 28),
          textAlign: TextAlign.left,
        ),
      ],
    ),
  );
}

Widget makeWhiteText(String title, Color color, double paddingLeft,
    double paddingBottom, double size) {
  return Container(
    child: Text(
      title,
      style:
          TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: size),
      textAlign: TextAlign.left,
    ),
    padding: EdgeInsets.only(left: paddingLeft, bottom: paddingBottom),
  );
}

Widget makePaddingTitleSize(String left, String right, double marginLeft,
    double padding, double size, bool reverse) {
  if (!reverse) {
    return Container(
      margin: EdgeInsets.only(left: marginLeft),
      padding: EdgeInsets.only(top: 0, bottom: padding),
      alignment: Alignment.topCenter,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              left,
              style: TextStyle(
                  color: Color.fromRGBO(218, 155, 104, 1.0),
                  fontWeight: FontWeight.bold,
                  fontSize: size),
              textAlign: TextAlign.justify,
            ),
            Text(
              right,
              style: TextStyle(
                  color: Color.fromRGBO(33, 33, 31, 1.0),
                  fontWeight: FontWeight.bold,
                  fontSize: size),
              textAlign: TextAlign.justify,
            )
          ]),
    );
  } else {
    return Container(
      padding: EdgeInsets.only(top: 0, bottom: padding),
      margin: EdgeInsets.only(left: marginLeft),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              left,
              style: TextStyle(
                  color: Color.fromRGBO(33, 33, 31, 1.0),
                  fontWeight: FontWeight.bold,
                  fontSize: size),
              textAlign: TextAlign.center,
            ),
            Text(
              right,
              style: TextStyle(
                  color: Color.fromRGBO(218, 155, 104, 1.0),
                  fontWeight: FontWeight.bold,
                  fontSize: size),
              textAlign: TextAlign.center,
            )
          ]),
    );
  }
}
