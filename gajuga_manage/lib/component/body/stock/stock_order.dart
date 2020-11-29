import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:gajuga_manage/util/firebase_method.dart';
import 'package:gajuga_manage/util/loading.dart';
import 'package:gajuga_manage/util/palette.dart';


class OrderStock extends StatefulWidget {
  final formKey, onCancel, pageIdx;

  OrderStock({this.formKey, this.onCancel, this.pageIdx});

  @override
  OrderStockState createState() => OrderStockState();
}

class OrderStockState extends State<OrderStock> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController _scrollController = new ScrollController();
  Map<String, TextEditingController> sendTextController;

  // firebase
  var stockDatabaseFetched;

  @override
  void initState() {
    super.initState();
    stockDatabaseFetched = FirebaseMethod().getCurrentStockData();

    sendTextController = new Map();

    FirebaseMethod().stockReference.once().then((snapshot) {
      Map<String, dynamic> getLengthfromMap =
          Map<String, dynamic>.from(snapshot.value);
      // pizza
      Map<String, dynamic> getPizza =
          Map<String, dynamic>.from(getLengthfromMap['pizza']);
      getPizza.forEach((key, value) {
        var push = {
          key : new TextEditingController()
        };
        sendTextController.addAll(push);
      });

      Map<String, dynamic> getBeverage =
          Map<String, dynamic>.from(getLengthfromMap['beverage']);
      getBeverage.forEach((key, value) {
        var push = {
          key : new TextEditingController()
        };
        sendTextController.addAll(push);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Form(
            key: widget.formKey,
            child: FutureBuilder(
                future: stockDatabaseFetched,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    print("waiting...");
                    return new Center(child: customLoadingBouncingGrid(orange));
                  } else {
                    if (!snapshot.hasData) {
                      // must be not null !
                      print("no data");
                      return new Center(
                          child: customLoadingBouncingGrid(orange));
                    } else if (snapshot.hasError) {
                      return Text("DATA FETCH ERROR !");
                    } else {
                      //data
                      Map<dynamic, dynamic> pizza = snapshot.data['pizza'];
                      // sort by key
                      var pizzaList = pizza.entries.toList()
                        ..sort((item1, item2) => item1.key
                            .toString()
                            .compareTo(item2.key.toString()));
                      Map<dynamic, dynamic> beverage =
                          snapshot.data['beverage'];

                      var mergedList = {...pizzaList, ...beverage.entries};

                      return Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: RaisedButton(
                                    onPressed: widget.onCancel,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    color: superlight,
                                    child: Container(
                                        height: 60,
                                        alignment: Alignment.center,
                                        child: Text("취소",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                            textAlign: TextAlign.center)),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: RaisedButton(
                                    onPressed: () => showModal("전송되었습니다 !", 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    color: orange,
                                    child: Container(
                                        height: 60,
                                        alignment: Alignment.center,
                                        child: Text("전송",
                                            style: TextStyle(
                                                color: white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                            textAlign: TextAlign.center)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 8,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      border: Border.all(
                                          color: Color.fromRGBO(
                                              238, 238, 238, 1.0))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            10,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      20.0)),
                                                      color: orange,
                                                    ),
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            30.0,
                                                            10.0,
                                                            0.0,
                                                            10.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "항 목",
                                                          style: TextStyle(
                                                              color: white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18),
                                                        ),
                                                        Icon(
                                                            Icons
                                                                .keyboard_arrow_down,
                                                            color: white)
                                                      ],
                                                    )),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            10,
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            30.0,
                                                            10.0,
                                                            0.0,
                                                            10.0),
                                                    decoration: BoxDecoration(
                                                      color: orange,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "재 고",
                                                          style: TextStyle(
                                                              color: white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18),
                                                        ),
                                                        Icon(
                                                            Icons
                                                                .keyboard_arrow_down,
                                                            color: white)
                                                      ],
                                                    )),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            10,
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            30.0,
                                                            10.0,
                                                            0.0,
                                                            10.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(
                                                                      20.0)),
                                                      color: orange,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "주 문 량",
                                                          style: TextStyle(
                                                              color: white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18),
                                                        ),
                                                        Icon(
                                                            Icons
                                                                .keyboard_arrow_down,
                                                            color: white)
                                                      ],
                                                    )),
                                              ),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 8,
                                          child: Scrollbar(
                                              isAlwaysShown: true,
                                              controller: _scrollController,
                                              child: ListView.builder(
                                                controller: _scrollController,
                                                //physics: NeverScrollableScrollPhysics(),
                                                itemCount: mergedList.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Column(
                                                    children: [
                                                      Container(
                                                          margin: index == 0
                                                              ? EdgeInsets.only(
                                                                  top: 10.0)
                                                              : EdgeInsets.only(
                                                                  top: 0.0),
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              12,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                flex: 4,
                                                                child:
                                                                    Container(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            30.0,
                                                                            10.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Text(
                                                                          mergedList
                                                                              .elementAt(index)
                                                                              .key,
                                                                          style: TextStyle(
                                                                              color: darkblue,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 16),
                                                                        )),
                                                              ),
                                                              Expanded(
                                                                flex: 3,
                                                                child:
                                                                    Container(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            30.0,
                                                                            10.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Text(
                                                                          mergedList
                                                                              .elementAt(index)
                                                                              .value
                                                                              .toString(),
                                                                          style: TextStyle(
                                                                              color: darkblue,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 16),
                                                                        )),
                                                              ),
                                                              Expanded(
                                                                  flex: 3,
                                                                  child: Row(
                                                                    children: [
                                                                      Expanded(
                                                                          flex:
                                                                              3,
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100,
                                                                            padding: EdgeInsets.fromLTRB(
                                                                                30.0,
                                                                                10.0,
                                                                                0.0,
                                                                                10.0),
                                                                            child:
                                                                                TextFormField(
                                                                              controller: sendTextController[mergedList
                                                                              .elementAt(index)
                                                                              .key],
                                                                              textAlign: TextAlign.center,
                                                                              decoration: InputDecoration(focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: mandarin, width: 2)), errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: mandarin, width: 2)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: lightgrey, width: 2)), focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: orange, width: 2)), errorStyle: TextStyle(color: mandarin, fontSize: 10.0, fontWeight: FontWeight.w600), labelText: "개수", labelStyle: TextStyle(color: lightgrey, fontSize: 14.0, fontWeight: FontWeight.w600)),
                                                                            ),
                                                                          )),
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            SizedBox(),
                                                                      )
                                                                    ],
                                                                  )),
                                                            ],
                                                          )),
                                                      Divider()
                                                    ],
                                                  );
                                                },
                                              )))
                                    ],
                                  )))
                        ],
                      );
                    }
                  }
                })));
  }

  Future<void> send(
      {String body,
      String subject,
      String recipients,
      List<String> attachmentPaths,
      bool isHTML}) async {
    final Email email = Email(
      body: body,
      subject: subject,
      recipients: [recipients],
      attachmentPaths: attachmentPaths,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
  }

  showModal(String title, int flag) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        setHandle() {
          sendTextController.forEach((key, value) {
              print(key + " > " + value.text.trim());
            });
          Navigator.of(context).pop();
          if (flag == 1) {
            widget.onCancel();
          }
        }

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
                  title,
                  style: TextStyle(
                    color: darkblue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                RaisedButton(
                  onPressed: setHandle,
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
}
