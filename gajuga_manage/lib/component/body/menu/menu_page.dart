import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/menu/menu_header.dart';
import 'package:gajuga_manage/util/main_container.dart';
import 'package:gajuga_manage/util/palette.dart';

import 'menu_list.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MenuHeader(),
          Divider(
            height: 20,
            thickness: 3,
            indent: 14,
            color: darkgrey,
          ),
          SizedBox(height: 10),
          MenuList(), // 메뉴 목록
        ],
      ),
    );
  }
}
