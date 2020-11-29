import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/sales/sales_profit_modal.dart';
import 'package:gajuga_manage/util/firebase_method.dart';
import 'package:gajuga_manage/util/loading.dart';
import 'dart:ui';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_locale.dart';
import 'package:gajuga_manage/util/to_text.dart';

class ExpenseList extends StatefulWidget {
  final selectedDate;
  final rangeExpenseData;
  final dataReferenceKey;

  ExpenseList(
      {this.selectedDate,
      this.rangeExpenseData,
      this.dataReferenceKey,});

  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  // firebase
  var fetchedExpenseData;

  @override
  void initState() {
    super.initState();
    fetchedExpenseData = FirebaseMethod().getTotalExpenseData();
  }

  TextStyle _tableHeaderStyle =
      TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width / 2.2,
      height: MediaQuery.of(context).size.height / 1.5,
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
      child: FutureBuilder(
        future: fetchedExpenseData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return customLoadingBouncingGrid(orange);
          } else if (snapshot.hasError) {
            return Text("DATA FETCH ERROR !");
          } else {
            Map<String, dynamic> expenseData =
                new Map<String, dynamic>.from(snapshot.data);
            if (expenseData.keys.contains(
                "${widget.selectedDate.year}-${widget.selectedDate.month}")) {
              int totalAmount = 0;
              widget.rangeExpenseData.forEach((key, value) {
                totalAmount += value;
              });
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      makeTitle('영업', '비용'),
                      Text(
                        "- " + toLocaleString(totalAmount) + "원",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: darkblue),
                      )
                    ],
                  ),
                  tableHeader(),
                  tableBody(widget.rangeExpenseData),
                ],
              );
            } else {
              return Center(
                  child: Text(
                "이번 달은 데이터가 없네요 !",
                style: TextStyle(
                    color: darkblue, fontWeight: FontWeight.w600, fontSize: 16),
              ));
            }
          }
        },
      ),
    );
  }

  Widget tableHeader() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Color.fromRGBO(238, 238, 238, 1.0)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(20.0)),
                    color: orange,
                  ),
                  padding: EdgeInsets.fromLTRB(30, 10, 0, 10),
                  child: Row(
                    children: [
                      Text(
                        "항 목",
                        style: _tableHeaderStyle,
                      ),
                      Icon(Icons.keyboard_arrow_down, color: white)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  padding: EdgeInsets.fromLTRB(30, 10, 0, 10),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(20.0)),
                    color: orange,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "금 액",
                        style: _tableHeaderStyle,
                      ),
                      Icon(Icons.keyboard_arrow_down, color: white),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget tableBody(final rangeExpenseData) {
    TextStyle _bodyTextStyle =
        TextStyle(color: darkblue, fontWeight: FontWeight.w600, fontSize: 16);

    return Expanded(
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(238, 238, 238, 1.0)),
          ),
          child: ListView.builder(
            itemCount: rangeExpenseData.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  FlatButton(
                      onPressed: () => print(""),
                      onLongPress: () => showDeleteModal(
                          context,
                          'expense',
                          widget.dataReferenceKey,
                          rangeExpenseData.keys.elementAt(index)),
                      child: Container(
                        margin: index == 0
                            ? EdgeInsets.only(top: 10.0)
                            : EdgeInsets.only(top: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 10.0),
                                child: Row(
                                  children: [
                                    Text(
                                      rangeExpenseData.keys.elementAt(index),
                                      style: _bodyTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 10.0),
                                child: Row(
                                  children: [
                                    Text(
                                      toLocaleString(rangeExpenseData.values
                                              .elementAt(index)) +
                                          " 원",
                                      style: _bodyTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  Divider(),
                ],
              );
            },
          )),
    );
  }
}
