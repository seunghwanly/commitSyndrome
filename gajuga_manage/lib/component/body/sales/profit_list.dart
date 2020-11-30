import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/sales/sales_calculate.dart';
import 'package:gajuga_manage/component/body/sales/sales_profit_modal.dart';
import 'package:gajuga_manage/model/sales_profit_model.dart';
import 'package:gajuga_manage/util/box_shadow.dart';
import 'package:gajuga_manage/util/firebase_method.dart';
import 'package:gajuga_manage/util/loading.dart';
import 'dart:ui';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_locale.dart';
import 'package:gajuga_manage/util/to_text.dart';
import 'package:provider/provider.dart';

class ProfitList extends StatefulWidget {
  final selectedDate;
  final mergedProfitData;
  final dataReferenceKey;

  ProfitList({this.selectedDate, this.mergedProfitData, this.dataReferenceKey});

  @override
  _ProfitListState createState() => _ProfitListState();
}

class _ProfitListState extends State<ProfitList> {
  //firebase reference
  // read 2 buckets !
  Future<dynamic> totalSales;
  Future<dynamic> totalProfit;

  @override
  void initState() {
    super.initState();
    // get data
    totalSales = FirebaseMethod().getTotalSalesData();
    totalProfit = FirebaseMethod().getTotalProfitData();
  }

  TextStyle _tableHeaderStyle =
      TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 18);

  Future<Sales> providerSales() async {
    return Sales();
  }

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
        child: FutureBuilder<List<dynamic>>(
            future: Future.wait([totalProfit, totalSales]),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                // print(snapshot.data[1].toString());
                return customLoadingBouncingGrid(orange);
              } else if (snapshot.hasError) {
                return Text("DATA FETCH ERROR !");
              } else {
                //profit data
                Map<String, dynamic> profitData =
                    new Map<String, dynamic>.from(snapshot.data[0]);

                // sales data
                Map<String, dynamic> menuData =
                    new Map<String, dynamic>.from(snapshot.data[1]);
                // check info is in the data
                if (DateTime.parse(menuData.keys.last)
                        .month
                        .compareTo(widget.selectedDate.month) ==
                    0) {
                  int totalAmount = 0;
                  widget.mergedProfitData.forEach((key, value) {
                    totalAmount += value;
                  });

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          makeTitle('영업', '수익'),
                          Text(
                            "+ " + toLocaleString(totalAmount) + "원",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: darkblue),
                          )
                        ],
                      ),
                      tableHeader(),
                      tableBody(widget.mergedProfitData),
                    ],
                  );
                } else {
                  return Center(
                      child: Text(
                    "이번 달은 데이터가 없네요 !",
                    style: TextStyle(
                        color: darkblue,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ));
                }
              }
            }));
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

  Widget tableBody(final mergedProfitData) {
    TextStyle _bodyTextStyle =
        TextStyle(color: darkblue, fontWeight: FontWeight.w600, fontSize: 18);

    return Expanded(
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(238, 238, 238, 1.0)),
          ),
          // FUTURE BUILDER
          child: ListView.builder(
            itemCount: mergedProfitData.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  FlatButton(
                    onLongPress: () {
                      if (index > 5)
                        showDeleteModal(
                            context,
                            'profit',
                            widget.dataReferenceKey,
                            mergedProfitData.keys.elementAt(index));
                    },
                    onPressed: () {},
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
                                      mergedProfitData.keys.elementAt(index),
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
                                      toLocaleString(mergedProfitData.values
                                              .elementAt(index)) +
                                          " 원",
                                      style: _bodyTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Divider(),
                ],
              );
            },
          )),
    );
  }
}
