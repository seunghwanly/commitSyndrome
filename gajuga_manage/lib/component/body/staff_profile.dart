import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/box_shadow.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_text.dart';

class StaffProfile extends StatefulWidget {
  @override
  _StaffProfileState createState() => _StaffProfileState();
}

class _StaffProfileState extends State<StaffProfile> {
  TextEditingController searchController = new TextEditingController();

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                makeTitle('직원', ' 프로필 수정'),
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  onPressed: () { },
                ),
              ],
            ),
            Divider(
              height: 20,
              thickness: 3,
              indent: 14,
              color: darkgrey,
            ),
          ],
        ),
      ),
    );
  }
}
