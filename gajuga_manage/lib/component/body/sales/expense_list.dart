import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/palette.dart';

class ExpenseList extends StatefulWidget {
  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Color.fromRGBO(238, 238, 238, 1.0)),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0)),
                      color: orange,
                    ),
                    padding: EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 10.0),
                    child: Row(
                      children: [
                        Text(
                          "항 목",
                          style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down, color: white)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 10,
                    padding: EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20.0)),
                      color: orange,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "금 액",
                          style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down, color: white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 9,
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
                                    style: TextStyle(
                                      color: darkblue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
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
                                    style: TextStyle(
                                      color: darkblue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
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
        ],
      ),
    );
  }
}
