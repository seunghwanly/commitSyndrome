import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/box_shadow.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/component/body/header_button.dart';

class HeaderMenu extends StatefulWidget {
  @override
  _HeaderMenuState createState() => _HeaderMenuState();
}

class _HeaderMenuState extends State<HeaderMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: HeaderButton(),
    );
  }
}
