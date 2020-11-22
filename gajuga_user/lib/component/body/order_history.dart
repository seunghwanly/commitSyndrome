import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../header/header.dart';
import './order_history_modal.dart';
import '../../util/box_shadow.dart';
import '../../util/to_text.dart';
import '../../util/palette.dart';
import '../../util/to_locale.dart';
//firebase database
import 'package:firebase_database/firebase_database.dart';
//loading
import 'package:loading_animations/loading_animations.dart';

class OrderHistory extends StatefulWidget {
  //OrderHistory ({  });

  @override
  OrderHistoryState createState() => OrderHistoryState();
}

class OrderHistoryState extends State<OrderHistory> {
  final databaseReference = FirebaseDatabase.instance.reference();
  final String userid = 'UserCode-01';
  var fetchedData;

  @override
  void initState() {
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    // print("몇개? " + this.fetchedData.length.toString());
    if (this.fetchedData == null) {
      return Container(
        color: pale,
        child: LoadingBouncingGrid.circle(
          backgroundColor: white,
        ),
      );
    } else {
      return CustomHeader(
          body: SingleChildScrollView(
              child: Column(
        children: [
          makeTitle("주문", "내역"),
          ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: this.fetchedData.length,
            itemBuilder: (BuildContext context, int index) {
              // var orders = new Map<String, dynamic>.from(data[index]);

              var orders =
                  new Map<String, dynamic>.from(this.fetchedData[index]);

              int totalCost = 0;

              // for (int i = 0; i < orders['contents'].length; ++i) {
              //   totalCost += orders['contents'][i]['cost'];
              // }
              totalCost = orders['totalCost'];

              return customBoxContainerWithMargin(
                  MediaQuery.of(context).size.width * 0.9, // 가로 세로 1 : 2 비율
                  MediaQuery.of(context).size.width * 0.5,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            makeTitleSize('피자', ' PIZZA', 0.0, 16, true),
                            Text(
                              DateTime.now()
                                      .difference(DateTime.parse(
                                          orders['orderTimes']['requestTime']
                                              .toString()
                                              .substring(0, 10)))
                                      .inDays
                                      .toString() +
                                  ' 일전',
                              style: TextStyle(
                                  color: darkblue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage((orders['contents']
                                                [0]['name'] ==
                                            '콜라' ||
                                        orders['contents'][0]['name'] == '사이다'
                                    ? 'images/${orders['contents'][1]['eng_name']}.png'
                                    : 'images/${orders['contents'][0]['eng_name']}.png'))),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                makeTextSize(
                                    '주문번호 ' + orders['orderNumber'].toString(),
                                    darkgrey,
                                    20.0,
                                    14),
                                (orders['contents'][0]['name'] == '콜라' ||
                                        orders['contents'][0]['name'] == '사이다'
                                    ? makeTextSize(
                                        orders['contents'][1]['name'] +
                                            " 피자" +
                                            (orders['contents'].length - 1 > 0
                                                ? ' 외 ' +
                                                    (orders['contents'].length -
                                                            1)
                                                        .toString() +
                                                    '개'
                                                : ''),
                                        darkblue,
                                        20.0,
                                        14)
                                    : makeTextSize(
                                        orders['contents'][0]['name'] +
                                            " 피자" +
                                            (orders['contents'].length - 1 > 0
                                                ? ' 외 ' +
                                                    (orders['contents'].length -
                                                            1)
                                                        .toString() +
                                                    '개'
                                                : ''),
                                        darkblue,
                                        20.0,
                                        14)),
                                makeTextSize(toLocaleString(totalCost) + ' 원',
                                    lightgrey, 20.0, 14)
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          color: orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            showOrderHistoryModal(context, orders);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.32,
                            height: MediaQuery.of(context).size.width * 0.08,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                new Icon(
                                  Icons.receipt,
                                  color: white,
                                  size: 15,
                                ),
                                new Text(
                                  "전자영수증보기",
                                  style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  true,
                  MediaQuery.of(context).size.height * 0.015, // 12.18 / 812
                  MediaQuery.of(context).size.width * 0.05); // 20 / 375
            },
          ),
        ],
      )));
    }
  }

  void readData() {
    databaseReference
        .child('user')
        .child(userid)
        .child('history')
        .once()
        .then((DataSnapshot dataSnapshot) {
      Map<dynamic, dynamic> values = dataSnapshot.value;
      var orderList = new List<dynamic>();
      // print(values.toString());
      values.forEach((k, v) {
        orderList.add(v);
      });
      // print('0' + orderList.length.toString());
      setState(() {
        //print('여기는 ? ' + (dataSnapshot.value).toString());
        this.fetchedData = orderList;
      });
      // fetchedData = dataSnapshot.value;
    });
  }
}
