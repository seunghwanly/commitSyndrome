import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/box_button.dart';
import 'package:gajuga_manage/util/box_shadow.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_text.dart';

class StockManage extends StatefulWidget {
  @override
  _StockManageState createState() => _StockManageState();
}

class _StockManageState extends State<StockManage> {
  TextEditingController searchController = new TextEditingController();

  void handleRequest() {
    print('');
  }

  void handleAdd() {}

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
          width: MediaQuery.of(context).size.width,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: makeTitle('재고', ' 확인'),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                          alignment: Alignment.center,
                          child: datePicker(context)),
                    ),
                    Expanded(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            tapButton(
                                handleAdd,
                                darkblue,
                                orange,
                                "재고 입력",
                                white,
                                18.0,
                                MediaQuery.of(context).size.width *
                                    0.10, //width
                                MediaQuery.of(context).size.height *
                                    0.05, //height
                                MediaQuery.of(context).size.height *
                                    0.01, //padding V
                                MediaQuery.of(context).size.width *
                                    0.01, //padding H
                                0.0),
                            tapButton(
                                handleRequest,
                                darkblue,
                                orange,
                                "발주 신청",
                                white,
                                18.0,
                                MediaQuery.of(context).size.width *
                                    0.10, //width
                                MediaQuery.of(context).size.height *
                                    0.05, //height
                                MediaQuery.of(context).size.height *
                                    0.01, //padding V
                                MediaQuery.of(context).size.width *
                                    0.01, //padding H
                                0.0), // margin H
                          ],
                        ))
                  ],
                ),
              ),
              Expanded(
                flex: 9,
                child: mainBody(),
              )
            ],
          )),
    );
  }
}

Widget mainBody() {
  return Container();
}

RaisedButton datePicker(BuildContext c) {
  return RaisedButton(
      onPressed: () => showDatePicker(
          context: c,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2021),
          cancelText: '닫기',
          confirmText: '확인'
          ),
      color: white,
      splashColor: superlight,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: superlight, width: 1.0)),
      child: Container(
        width: MediaQuery.of(c).size.width * 0.2,
        height: MediaQuery.of(c).size.height * 0.05,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.calendar_today,
              color: lightgrey,
            ),
            Text(
              new DateTime.now()
                  .toIso8601String()
                  .substring(0, 10)
                  .replaceAll('-', '/'),
              style: TextStyle(color: lightgrey),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: lightgrey,
            )
          ],
        ),
      ));
}
