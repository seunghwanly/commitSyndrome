import 'package:flutter/material.dart';

BoxShadow customeBoxShadow() {
  return BoxShadow(
      color: Colors.black.withOpacity(0.16),
      offset: Offset(0, 3),
      blurRadius: 6);
}

BoxDecoration customBoxDecoration() {
  return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [customeBoxShadow()]);
}

Container customBoxContainer(double w, double h, final c, bool needPadding) {
  return Container(
      alignment: Alignment.center,
      width: w,
      height: h,
      decoration: customBoxDecoration(),
      padding: needPadding ? EdgeInsets.only(left: 20, right: 20) : null,
      child: c);
}

Container customBoxContainerWithMargin(double w, double h, final c,
    bool needPadding, double marginVertical, double marginHorizontal) {
  return Container(
    alignment: Alignment.center,
    width: w,
    height: h,
    decoration: customBoxDecoration(),
    padding: needPadding ? EdgeInsets.fromLTRB(20, 10, 20, 10) : null,
    child: c,
    margin: EdgeInsets.only(
        top: marginVertical,
        bottom: marginVertical,
        left: marginHorizontal,
        right: marginHorizontal),
  );
}

Container customBoxContainerCategory(double w, double h, final c,
    bool needPadding, double marginVertical, double marginHorizontal) {
  return Container(
    alignment: Alignment.center,
    width: w,
    height: h,
    // decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(30),
    //     boxShadow: [customeBoxShadow()]),
    padding: needPadding
        ? EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 20,
            right: 20,
          )
        : null,
    child: c,
    margin: EdgeInsets.only(
        top: marginVertical,
        bottom: marginVertical,
        left: marginHorizontal,
        right: marginHorizontal),
  );
}

Container customStrikeBoxContainer(
    double w,
    double h,
    final c,
    bool needPadding,
    double marginVertical,
    double marginHorizontal,
    BuildContext context) {
  return Container(
    alignment: Alignment.center,
    width: w,
    height: h,
    decoration: BoxDecoration(
      // borderRadius: BorderRadius.circular(10),
      border: Border(
          //bottom: BorderSide(width: 0.6, color: Colors.black38),
          ),
      // color: Colors.white,
    ),
    padding: needPadding
        ? EdgeInsets.only(left: 5, right: 1, top: 0, bottom: 0)
        : null,
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      c,
      Divider(
        indent: MediaQuery.of(context).size.width * (25 / 375),
        endIndent: MediaQuery.of(context).size.width * (30 / 375),
        thickness: 2,
      ),
    ]),
    margin: EdgeInsets.only(
        top: marginVertical,
        bottom: marginVertical,
        left: marginHorizontal,
        right: marginHorizontal),
  );
}
