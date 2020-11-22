import 'package:flutter/material.dart';
import '../body/shopping_cart.dart';
import 'package:gajuga_user/util/box_shadow.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../util/to_text.dart';
import '../../util/to_locale.dart';
import '../../util/box_shadow.dart';
import '../../util/palette.dart';
import '../header/header.dart';
import 'ready_order_modal.dart';
import 'package:intl/intl.dart';
import '../../model/order_history_model.dart';

class OrderStateList extends StatefulWidget {
  final Order currentOrder;
  OrderStateList({this.currentOrder});
  @override
  OrderState createState() => OrderState();
}

class OrderState extends State<OrderStateList> {
  var currentState = 'confirm';
  DatabaseReference menuReference = FirebaseDatabase.instance
      .reference()
      .child('order/' + DateFormat('yyyy-MM-dd').format(DateTime.now()));

  String getContentLenght() {
    if (widget.currentOrder.content.length > 1) {
      return ('외 ' + (widget.currentOrder.content.length - 1).toString() + '개');
    } else if (widget.currentOrder.content.length == 1) {
      return ('1개');
    } else {
      return ('');
    }
  }

  @override
  void initState() {
    super.initState();

    //listener
    menuReference.onValue.listen((event) {
      var snapshot = event.snapshot;
      var value = snapshot.value['orderState'].toString();
      print('value : ' + value);
      setState(() {
        currentState = value;
      });

      if (value == 'ready') {
        menuReference.onDisconnect();
        showReadyModal(context);
      } else {
        // setState(() {
        // });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    // database off
    menuReference.onDisconnect();
  }

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * (44 / 812),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              makeTitle('주문', ' 내역'),
            ],
          ),
        ),
        Container(
          //color: Colors.black54,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * (650 / 812),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/bulgogi.png'),
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Container(
                  //   margin: EdgeInsets.only(bottom: 10),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       // Text('이미지'),
                  //       CircleAvatar(
                  //         radius:
                  //             MediaQuery.of(context).size.width * (15 / 375),
                  //         backgroundColor: Color.fromRGBO(0xff, 0xee, 0xe4, 1),
                  //       ),
                  //       makeWhiteText('결제완료', Colors.white, 0, 0,
                  //           MediaQuery.of(context).size.width / 26),
                  //       makeWhiteText(
                  //           DateFormat('HH시mm분ss초').format(
                  //               widget.currentOrder.orderTimes.requestTime),
                  //           Colors.white,
                  //           0,
                  //           5,
                  //           MediaQuery.of(context).size.width / 26),
                  //     ],
                  //   ),
                  // ),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          StateCircle(currentState, 0, context),
                          // CircleAvatar(
                          //   radius:
                          //       MediaQuery.of(context).size.width * (15 / 375),
                          //   backgroundColor:
                          //       Color.fromRGBO(0xff, 0xee, 0xe4, 1),
                          // ),
                          makeWhiteText('주문요청', Colors.white, 0, 5,
                              MediaQuery.of(context).size.width / 26),
                          makeWhiteText(
                              DateFormat('HH시mm분ss초').format(
                                  widget.currentOrder.orderTimes.requestTime),
                              Colors.white,
                              0,
                              5,
                              MediaQuery.of(context).size.width / 26),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          StateCircle(currentState, 1, context),
                          // CircleAvatar(
                          //   radius:
                          //       MediaQuery.of(context).size.width * (15 / 375),
                          //   backgroundColor:
                          //       Color.fromRGBO(0xf1, 0x7f, 0x42, 1),
                          //   // backgroundColor:
                          //   //     Color.fromRGBO(0xce, 0x6d, 0x39, 1),
                          // ),
                          makeWhiteText('주문승인', Colors.white, 0, 5,
                              MediaQuery.of(context).size.width / 26),
                          makeWhiteText(
                              DateFormat('HH시mm분ss초').format(
                                  widget.currentOrder.orderTimes.confirmTime),
                              Colors.white,
                              0,
                              5,
                              MediaQuery.of(context).size.width / 26),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // CircleAvatar(
                          //   radius:
                          //       MediaQuery.of(context).size.width * (15 / 375),
                          //   backgroundColor: Color.fromRGBO(133, 50, 15, 1),
                          // ),
                          StateCircle(currentState, 2, context),
                          makeWhiteText('준비완료', Colors.white, 0, 5,
                              MediaQuery.of(context).size.width / 26),
                          makeWhiteText(
                              DateFormat('HH시mm분ss초').format(
                                  widget.currentOrder.orderTimes.readyTime),
                              Colors.white,
                              0,
                              5,
                              MediaQuery.of(context).size.width / 26),
                        ],
                      )),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        // showReadyModal(context);
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width:
                              MediaQuery.of(context).size.width * (340 / 375),
                          height:
                              MediaQuery.of(context).size.height * (120 / 812),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1.00),
                              boxShadow: [customeBoxShadow()],
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    (340 / 375) *
                                    0.3,
                                height: MediaQuery.of(context).size.height *
                                    (120 / 812),
                                //color: Colors.black26,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius:
                                          MediaQuery.of(context).size.height *
                                              (40 / 812),
                                      backgroundImage:
                                          AssetImage('images/potato.png'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    (340 / 375) *
                                    0.7,
                                height: MediaQuery.of(context).size.height *
                                    (120 / 812),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    makeWhiteText(
                                        '주문번호 : ' +
                                            widget.currentOrder.orderNumber,
                                        Color.fromRGBO(33, 33, 31, 1),
                                        0,
                                        5,
                                        MediaQuery.of(context).size.width / 25),
                                    makeWhiteText(
                                        widget.currentOrder.content[0].name +
                                            ' ' +
                                            getContentLenght(),
                                        Color.fromRGBO(33, 33, 31, 1),
                                        0,
                                        5,
                                        MediaQuery.of(context).size.width / 27),
                                    makeWhiteText(
                                        '총 금액 : ' +
                                            toLocaleString(
                                                widget.currentOrder.totalCost) +
                                            ' Won',
                                        Color.fromRGBO(119, 119, 119, 1),
                                        0,
                                        5,
                                        MediaQuery.of(context).size.width / 27),
                                  ],
                                ),
                                //color: Colors.black87,
                              )
                            ],
                          )))
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}

Widget StateCircle(String currentState, int index, BuildContext context) {
  if (currentState == 'request') {
    if (index == 0) {
      return CircleAvatar(
        radius: MediaQuery.of(context).size.width * (15 / 375),
        backgroundColor: Color.fromRGBO(247, 107, 51, 1),
      );
    } else if (index == 1) {
      return CircleAvatar(
        radius: MediaQuery.of(context).size.width * (15 / 375),
        backgroundColor: Color.fromRGBO(0xff, 0xee, 0xe4, 1),
      );
    } else {
      return CircleAvatar(
        radius: MediaQuery.of(context).size.width * (15 / 375),
        backgroundColor: Color.fromRGBO(0xff, 0xee, 0xe4, 1),
      );
    }
  } else if (currentState == 'confirm') {
    if (index == 0) {
      return CircleAvatar(
        radius: MediaQuery.of(context).size.width * (15 / 375),
        backgroundColor: Color.fromRGBO(0xff, 0xee, 0xe4, 1),
      );
    } else if (index == 1) {
      return CircleAvatar(
        radius: MediaQuery.of(context).size.width * (15 / 375),
        backgroundColor: Color.fromRGBO(247, 107, 51, 1),
      );
    } else {
      return CircleAvatar(
        radius: MediaQuery.of(context).size.width * (15 / 375),
        backgroundColor: Color.fromRGBO(0xff, 0xee, 0xe4, 1),
      );
    }
  } else {
    if (index == 0) {
      return CircleAvatar(
        radius: MediaQuery.of(context).size.width * (15 / 375),
        backgroundColor: Color.fromRGBO(0xff, 0xee, 0xe4, 1),
      );
    } else if (index == 1) {
      return CircleAvatar(
        radius: MediaQuery.of(context).size.width * (15 / 375),
        backgroundColor: Color.fromRGBO(0xff, 0xee, 0xe4, 1),
      );
    } else {
      return CircleAvatar(
        radius: MediaQuery.of(context).size.width * (15 / 375),
        backgroundColor: Color.fromRGBO(247, 107, 51, 1),
      );
    }
  }
}
