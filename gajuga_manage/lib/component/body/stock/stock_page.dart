import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//pages
import 'package:gajuga_manage/component/body/stock/stock_current.dart';
import 'package:gajuga_manage/component/body/stock/stock_add.dart';
import 'package:gajuga_manage/component/body/stock/stock_order.dart';
//util
import 'package:gajuga_manage/util/main_container.dart';
import 'package:gajuga_manage/util/box_button.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_text.dart';
//date picker
import 'stock_current.dart';

class StockPage extends StatefulWidget {
  @override
  _StockPageState createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  // route pages | current | add | order
  var pageIndex;

  // form keys
  final addFormKey = GlobalKey<FormState>();
  final orderFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    pageIndex = 0;
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    return MainContainer(
        body: SingleChildScrollView(
            //controller: new ScrollController(keepScrollOffset: true),
            child: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
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
                  ),
                ),
                Expanded(
                  flex: 4,
                  // child: Container(
                  //     alignment: Alignment.center,
                  //     child: datePicker(context, handleSave, selectedDate)),
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      this.pageIndex == 0
                          ? tapButton(
                              handleAdd,
                              darkblue,
                              orange,
                              "재고 입력",
                              white,
                              18.0,
                              MediaQuery.of(context).size.width * 0.10, //width
                              MediaQuery.of(context).size.height *
                                  0.05, //height
                              MediaQuery.of(context).size.height *
                                  0.01, //padding
                              MediaQuery.of(context).size.width *
                                  0.01, //padding H
                              0.0)
                          : SizedBox(),
                      this.pageIndex == 0
                          ? tapButton(
                              handleRequest,
                              darkblue,
                              orange,
                              "발주 신청",
                              white,
                              18.0,
                              MediaQuery.of(context).size.width * 0.10, //width
                              MediaQuery.of(context).size.height *
                                  0.05, //height
                              MediaQuery.of(context).size.height *
                                  0.01, //padding V
                              MediaQuery.of(context).size.width *
                                  0.01, //padding H
                              0.0)
                          : SizedBox(), // margin H
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(flex: 9, child: mainBody(context, pageIndex)),
        ],
      ),
    )));
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
                    fontSize: 20.0,
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      this.pageIndex = 0;
                    });
                    Navigator.pop(context);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: orange,
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 12,
                    height: MediaQuery.of(context).size.height / 20,
                    child: Text(
                      '확인',
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget mainBody(BuildContext context, int index) {
    switch (index) {
      case 0:
        return Container(
          margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          child: CurrentStock(),
        );
      case 1:
        return Container(
          margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
          child: AddStock(formKey: addFormKey, onCancel: handleCancel, pageIdx: pageIndex),
        );
      case 2:
        return Container(
          margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          child: OrderStock(formKey: orderFormKey),
        );
      default:
        return Container(
          margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          child: CurrentStock(),
        );
    }
  }
}
