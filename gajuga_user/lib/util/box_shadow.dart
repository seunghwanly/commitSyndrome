import 'package:flutter/material.dart';
import '../util/dash_Rect.dart';

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
    padding: needPadding ? EdgeInsets.all(20) : null,
    child: c,
    margin: EdgeInsets.only(
        top: marginVertical,
        bottom: marginVertical,
        left: marginHorizontal,
        right: marginHorizontal),
  );
}

Container customStrikeBoxContainer(double w, double h, final c,
    bool needPadding, double marginVertical, double marginHorizontal) {
  return Container(
    alignment: Alignment.center,
    width: w,
    height: h,
    decoration: BoxDecoration(color: Colors.black12),
    padding: needPadding ? EdgeInsets.all(20) : null,
    child: DashedRect(
      color: Colors.red,
      strokeWidth: 2.0,
      gap: 3.0,
    ),
    margin: EdgeInsets.only(
        top: marginVertical,
        bottom: marginVertical,
        left: marginHorizontal,
        right: marginHorizontal),
  );
}
