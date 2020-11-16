import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_text.dart';

class ExpenseList extends StatefulWidget {
  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  
  TextStyle _tableHeaderStyle = TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 18);

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
      child: Column(
        children: [
          makeTitle('영업', '비용'),
          tableHeader(),
          tableBody(),
        ],
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
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0)),
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
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20.0)),
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

  Widget tableBody() {
    TextStyle _bodyTextStyle = TextStyle(color: darkblue, fontWeight: FontWeight.w600, fontSize: 16);

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(238, 238, 238, 1.0)),
        ),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    margin: index==0 ? EdgeInsets.only(top: 10.0) : EdgeInsets.only(top: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 10.0),
                            child: Row(
                              children: [
                                Text(
                                  "항 목  " + index.toString(),
                                  style: _bodyTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 10.0),
                            child: Row(
                              children: [
                                Text(
                                  "1,000,000",
                                  style: _bodyTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                ],
              );
            },
          ),
      ),
    );
  }
}
