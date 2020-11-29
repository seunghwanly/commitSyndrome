import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:gajuga_manage/util/loading.dart';
import 'package:gajuga_manage/component/body/staff/staff_page.dart';
import 'package:gajuga_manage/component/body/staff/staff_list.dart';

class StaffActivity extends StatefulWidget {
  @override
  _StaffActivityState createState() => _StaffActivityState();
}

class _StaffActivityState extends State<StaffActivity> {
  final staffReference = FirebaseDatabase.instance.reference();
  final List actList = new List();
  String uid = StaffPage.selectedUid;

  Timer _timer;
  int _start = 1;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_start < 1) {
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
                  FlatButton(
                    color: orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => StaffPage()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "확인",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: StaffPage.selectedRole == 1
                      ? staffReference
                          .child('manager/employee/staff/' +
                              StaffPage.selectedUid +
                              '/activity')
                          .once()
                      : staffReference
                          .child('manager/employee/chef/' +
                              StaffPage.selectedUid +
                              '/activity')
                          .once(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      actList.clear();
                      Map<dynamic, dynamic> values = snapshot.data.value;
                      if (values != null) {
                        values.forEach((key, values) {
                          actList.add(values);
                        });
                      }
                      return activityList(actList);
                    } else {
                      return Container(
                          alignment: Alignment.center,
                          child: customLoadingBouncingGrid(orange));
                    }
                  }),
            ),
          ],
        ),
      );
    } else {
      startTimer();
      return Container(
          alignment: Alignment.center,
          child: customLoadingBouncingGrid(orange));
    }
  }
}

Widget activityList(List activity) {
  if (activity.length == 0) {
    return Container(
        child: Center(
      child: Text(
        '검색된 결과가 없습니다...',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  } else {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: activity == null ? 0 : activity.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              child: ListTile(
            leading: Icon(Icons.check_circle_outline),
            title: Text('주문 번호   ' + activity[index]["orderNumber"],
                style: TextStyle(fontSize: 20)),
            subtitle: Text('주문 승인 시간   ' + activity[index]["approvalTime"],
                style: TextStyle(fontSize: 18)),
          ));
        });
  }
}
