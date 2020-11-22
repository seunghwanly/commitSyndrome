import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/firebase_method.dart';
import 'package:gajuga_manage/util/loading.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_text.dart';

class CurrentStock extends StatefulWidget {
  CurrentStock();

  @override
  CurrentStockState createState() => CurrentStockState();
}

class CurrentStockState extends State<CurrentStock> {
  // stock reference
  var stockDatabaseFetched;

  @override
  void initState() {
    super.initState();
    stockDatabaseFetched = FirebaseMethod().getCurrentStockData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: stockDatabaseFetched,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            //data
            Map<dynamic, dynamic> pizza = snapshot.data['pizza'];
            Map<dynamic, dynamic> beverage = snapshot.data['beverage'];

            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: makeTitleSize("피자", "PIZZA", 10.0, 20.0, false),
                ),
                Expanded(
                    ///////////////////////////////////////////////////////////////////// PIZZA
                    flex: 4,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                                color: Color.fromRGBO(238, 238, 238, 1.0))),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20.0)),
                                            color: orange,
                                          ),
                                          padding: EdgeInsets.fromLTRB(
                                              30.0, 10.0, 0.0, 10.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "항 목",
                                                style: TextStyle(
                                                    color: white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              Icon(Icons.keyboard_arrow_down,
                                                  color: white)
                                            ],
                                          )),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10,
                                          padding: EdgeInsets.fromLTRB(
                                              30.0, 10.0, 0.0, 10.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight:
                                                    Radius.circular(20.0)),
                                            color: orange,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                "개 수",
                                                style: TextStyle(
                                                    color: white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              Icon(Icons.keyboard_arrow_down,
                                                  color: white)
                                            ],
                                          )),
                                    ),
                                  ],
                                )),
                            Expanded(
                              flex: 7,
                              child: ListView.builder(
                                itemCount: pizza.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Container(
                                          margin: index == 0
                                              ? EdgeInsets.only(top: 10.0)
                                              : EdgeInsets.only(top: 0.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            30.0,
                                                            10.0,
                                                            0.0,
                                                            10.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          pizza.keys
                                                              .elementAt(index),
                                                          style: TextStyle(
                                                              color: darkblue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            30.0,
                                                            10.0,
                                                            0.0,
                                                            10.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          pizza.values
                                                              .elementAt(index)
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: darkblue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ],
                                          )),
                                      Divider()
                                    ],
                                  );
                                },
                              ),
                            )
                          ],
                        ))),
                ///////////////////////////////////////////////////////////////////// END OF PIZZA
                Expanded(
                  flex: 1,
                  child: makeTitleSize("음료", "BEVERAGE", 10.0, 20.0, false),
                ),
                //////////////////////////////////////////////////////////////////////// BEVERAGE
                Expanded(
                    flex: 4,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                                color: Color.fromRGBO(238, 238, 238, 1.0))),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20.0)),
                                            color: orange,
                                          ),
                                          padding: EdgeInsets.fromLTRB(
                                              30.0, 10.0, 0.0, 10.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "항 목",
                                                style: TextStyle(
                                                    color: white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              Icon(Icons.keyboard_arrow_down,
                                                  color: white)
                                            ],
                                          )),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10,
                                          padding: EdgeInsets.fromLTRB(
                                              30.0, 10.0, 0.0, 10.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight:
                                                    Radius.circular(20.0)),
                                            color: orange,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                "개 수",
                                                style: TextStyle(
                                                    color: white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              Icon(Icons.keyboard_arrow_down,
                                                  color: white)
                                            ],
                                          )),
                                    ),
                                  ],
                                )),
                            Expanded(
                              flex: 3,
                              child: ListView.builder(
                                itemCount: beverage.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Container(
                                          margin: index == 0
                                              ? EdgeInsets.only(top: 10.0)
                                              : EdgeInsets.only(top: 0.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            30.0,
                                                            10.0,
                                                            0.0,
                                                            10.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          beverage.keys
                                                              .elementAt(index),
                                                          style: TextStyle(
                                                              color: darkblue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            30.0,
                                                            10.0,
                                                            0.0,
                                                            10.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          beverage.values
                                                              .elementAt(index)
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: darkblue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ],
                                          )),
                                      Divider()
                                    ],
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: SizedBox(),
                            )
                          ],
                        ))),
                ///////////////////////////////////////////////////////////////////// END OF BEVRAGE
              ],
            );
          } else {
            return Center(child: customLoadingBouncingGrid(orange));
          }
        });
  }
}
