import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/staff/staff_activity.dart';
import 'package:gajuga_manage/component/body/staff/staff_list.dart';
import 'package:gajuga_manage/component/body/staff/staff_search.dart';
import 'package:gajuga_manage/util/box_shadow.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_text.dart';

class StaffManage extends StatefulWidget {
  @override
  _StaffManageState createState() => _StaffManageState();
}

class _StaffManageState extends State<StaffManage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              StaffSearch(),
              SizedBox(height: 40),
              StaffList(),
            ],
          ),
          StaffActivity(),
        ],
      ),
    );
  }
}
