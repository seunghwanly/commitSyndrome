import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/palette.dart';

class StaffActivity extends StatefulWidget {
  @override
  _StaffActivityState createState() => _StaffActivityState();
}

class _StaffActivityState extends State<StaffActivity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 1.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  children: [
                    TextSpan(
                      text: '직원',
                      style: TextStyle(color: darkgrey),
                    ),
                    TextSpan(
                      text: ' 활동 확인',
                      style: TextStyle(color: orange),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            child: Center(
              child: Text(
                '검색된 결과가 없습니다...',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}