import 'package:flutter/material.dart';

class MenuManage extends StatefulWidget {
  @override
  _MenuManageState createState() => _MenuManageState();
}

class _MenuManageState extends State<MenuManage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Colors.white,
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('메뉴 수정'),
          ],
        ),
      ),
    );
  }
}
