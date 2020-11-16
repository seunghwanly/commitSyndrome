import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/header/header.dart';
import 'package:gajuga_manage/component/body/staff/staff_activity.dart';
import 'package:gajuga_manage/component/body/staff/staff_list.dart';
import 'package:gajuga_manage/component/body/staff/staff_search.dart';
import 'package:gajuga_manage/util/main_container.dart';

class StaffPage extends StatefulWidget {
  @override
  _StaffPageState createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView( // TODO: SingleChildScrollView로 keyboard overflow 해결하면 위쪽 shadow가 없어짐
              child: Column(
                children: [
                  StaffSearch(),
                  SizedBox(height: 40),
                  StaffList(),
                ],
              ),
            ),
            StaffActivity(),
          ],
        ),
      ),
    );
  }
}
