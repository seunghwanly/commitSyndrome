import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//pages
import 'package:gajuga_manage/component/body/stock/stock_current.dart';
import 'package:gajuga_manage/component/body/stock/stock_add.dart';
import 'package:gajuga_manage/component/body/stock/stock_order.dart';
//util
import 'package:gajuga_manage/util/box_button.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_text.dart';
//date picker
import '../../../util/date_picker.dart';
import 'stock_current.dart';

class StockManage extends StatefulWidget {
  @override
  _StockManageState createState() => _StockManageState();
}

class _StockManageState extends State<StockManage> {
  TextEditingController searchController = new TextEditingController();

  var pageIndex = 0;
  bool save = false;

  void handleRequest() {
    setState(() {
      this.pageIndex = 2;
    });
  }

  void handleAdd() {
    setState(() {
      this.pageIndex = 1;
    });
  }

  void handleCancel() {
    setState(() {
      this.pageIndex = 0;
    });
  }

  void handleSave() {
    showModal();
  }

  DateTime selectedDate;

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
          child: SingleChildScrollView(
              //controller: new ScrollController(keepScrollOffset: true),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
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
                                child: GestureDetector(
                                  onTap: () => setState(() {
                                    this.pageIndex = 0;
                                  }),
                                  child: this.pageIndex == 0
                                      ? makeTitle('재고', ' 확인')
                                      : this.pageIndex == 1
                                          ? makeTitle("재고", " 입력")
                                          : makeTitle("발주", " 신청"),
                                )),
                            Expanded(
                              flex: 4,
                              child: Container(
                                  alignment: Alignment.center,
                                  child: datePicker(context, selectedDate)),
                            ),
                            Expanded(
                                flex: 3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    tapButton(
                                        this.pageIndex == 0
                                            ? handleAdd
                                            : handleCancel,
                                        this.pageIndex == 0
                                            ? darkblue
                                            : superlight,
                                        orange,
                                        this.pageIndex == 0 ? "재고 입력" : "취소",
                                        this.pageIndex == 0 ? white : darkblue,
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
                                        this.pageIndex == 0
                                            ? handleRequest
                                            : handleSave,
                                        this.pageIndex == 0 ? darkblue : orange,
                                        orange,
                                        this.pageIndex == 0 ? "발주 신청" : "저장",
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
                        child: mainBody(context, pageIndex, save),
                      )
                    ],
                  )))),
    );
  }

  datePicker(BuildContext c, DateTime selectedDate) {
    return RaisedButton(
        onPressed: () async {
          return customDatePicker(c);
        },
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

  showModal() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 16.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: white,
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 5,
              padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    this.pageIndex == 1 ? "재고 입력이 완료되었습니다." : "발주 신청이 완료되었습니다.",
                    style: TextStyle(
                        color: darkblue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        this.save = false;
                        this.pageIndex = 0;
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 12,
                      height: MediaQuery.of(context).size.height / 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: orange),
                      child: Text(
                        '확인',
                        style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

Widget mainBody(BuildContext context, int index, final save) {
  switch (index) {
    case 0:
      return Container(
        margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
        child: CurrentStock(),
      );
    case 1:
      return Container(
        margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
        child: AddStock(savePressed: save),
      );
    case 2:
      return Container(
        margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
        child: OrderStock(savePressed: save),
      );
    default:
      return Container(
        margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
        child: CurrentStock(),
      );
  }
}
