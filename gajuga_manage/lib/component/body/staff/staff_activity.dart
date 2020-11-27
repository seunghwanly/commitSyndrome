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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
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
          ),
          Expanded(
            child: FutureBuilder(
              future: _fetchData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData)
                  return printStatus('검색된 결과가 없습니다...');
                else if (snapshot.hasError)
                  return printStatus('오류가 발생했습니다.');
                else
                  return activityList();
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<String> _fetchData() async {
    // TODO: 데이터 가져오기
    await Future.delayed(Duration(seconds: 3));
    return 'Call Data';
  }

  Widget activityList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.check_circle_outline),
            title: Text('주문번호 $index'),
            subtitle: Text('주문시간'),
            trailing: Icon(Icons.arrow_right),
          );
        });
  }

  Widget printStatus(String inputString) {
    return Center(
      child: Text(
        inputString,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
