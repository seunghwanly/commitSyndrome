import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/palette.dart';

class AddStock extends StatefulWidget {
  final savePressed;

  AddStock({this.savePressed});

  @override
  AddStockState createState() => AddStockState();
}

class AddStockState extends State<AddStock> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
            // height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Color.fromRGBO(238, 238, 238, 1.0))),
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
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0)),
                                color: orange,
                              ),
                              padding:
                                  EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 10.0),
                              child: Row(
                                children: [
                                  Text(
                                    "항 목",
                                    style: TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Icon(Icons.keyboard_arrow_down, color: white)
                                ],
                              )),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                              height: MediaQuery.of(context).size.height / 10,
                              padding:
                                  EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.0)),
                                color: orange,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "갯 수",
                                    style: TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Icon(Icons.keyboard_arrow_down, color: white)
                                ],
                              )),
                        ),
                      ],
                    )),
                Expanded(
                    flex: 9,
                    child: ListView.builder(
                      //physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                                margin: index == 0
                                    ? EdgeInsets.only(top: 10.0)
                                    : EdgeInsets.only(top: 0.0),
                                height: MediaQuery.of(context).size.height / 12,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                              30.0, 10.0, 0.0, 10.0),
                                          child: Text(
                                            "항 목  " + index.toString(),
                                            style: TextStyle(
                                                color: darkblue,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          )),
                                    ),
                                    Expanded(
                                        flex: 5,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 2,
                                                child: Container(
                                                  width: 100,
                                                  padding: EdgeInsets.fromLTRB(
                                                      30.0, 10.0, 0.0, 10.0),
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        labelText: "갯수 입력",
                                                        labelStyle: TextStyle(
                                                            color: lightgrey,
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                  ),
                                                )),
                                            Expanded(
                                              flex: 3,
                                              child: Container(),
                                            )
                                          ],
                                        )),
                                  ],
                                )),
                            Divider()
                          ],
                        );
                      },
                    )),
              ],
            )));
  }
}