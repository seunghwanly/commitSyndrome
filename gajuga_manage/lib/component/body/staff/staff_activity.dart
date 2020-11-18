import 'dart:ui';

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
      height: MediaQuery.of(context).size.height / 1.25,
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
      // child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            Expanded(
              child: FutureBuilder(
                future: _fetchData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text(
                        '검색된 결과가 없습니다...',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                  else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        '오류가 발생했습니다.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                    else { // 데이터가 정상적으로 불러와진 경우
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'ㅎㅎ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
          ],
        ),
      // ),
    );
  }

  Future<String> _fetchData() async {
    // TODO: 데이터 가져오기
    await Future.delayed(Duration(seconds: 3));
    return 'Call Data';
  }
}