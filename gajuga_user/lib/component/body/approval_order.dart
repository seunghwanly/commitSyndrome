import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:gajuga_user/util/box_shadow.dart';
import '../../util/box_shadow.dart';
import '../../util/palette.dart';
import 'package:intl/intl.dart';
import '../header/header.dart';
import '../body/order_state.dart';
import '../../model/order_history_model.dart';

class ApprovalOrder extends StatefulWidget {
  final Order currentOrder;
  final String orderKey;
  ApprovalOrder({this.currentOrder, this.orderKey});

  @override
  ApprovalOrderState createState() => ApprovalOrderState();
}

class ApprovalOrderState extends State<ApprovalOrder> {
  void _goOrderState(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OrderStateList(
                  currentOrder: widget.currentOrder,
                  orderKey: widget.orderKey,
                )));
  }

  String currentState = '';
  DatabaseReference menuReference = FirebaseDatabase.instance
      .reference()
      .child('order/' + DateFormat('yyyy-MM-dd').format(DateTime.now()));

  @override
  void initState() {
    super.initState();
    menuReference = FirebaseDatabase.instance
        .reference()
        .child('order/' + DateFormat('yyyy-MM-dd').format(DateTime.now()))
        .child(widget.orderKey);
    //init state
    // menuReference.once().then((DataSnapshot snapshot) {
    //   if (snapshot.value != null) {
    //     setState(() => currentState = snapshot.value);
    //   } else {
    //     // init when fetched data is null
    //   }
    // });

    //listener
    menuReference.onValue.listen((event) {
      var snapshot = event.snapshot;
      var value = snapshot.value['orderState'].toString();
      if (value == 'confirm') {
        //set confirmTime 나중에 관리자에서 주문받는 곳에 넣으면 좋을듯
        // menuReference
        //     .child('orderTimes')
        //     .set(<String, String>{'confirmTime': DateTime.now().toString()});
        Route route = MaterialPageRoute(
            builder: (context) => OrderStateList(
                currentOrder: widget.currentOrder, orderKey: widget.orderKey));

        Navigator.pushReplacement(context, route);
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
    // StreamBuilder(
    //     stream: menuReference
    //         .onValue, // 데이터베이스가 변할 때 마다 확인할 경로 : 구독할 PATH -> onValue를 사용합니다
    //     builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
    //       if (snapshot.hasData) {
    //         return snapshot.data.snapshot.value;
    //       }
    //     });

    return CustomHeader(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: <Widget>[
            Center(
                child: Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Text(
                      '주문승인 대기 중',
                      style: TextStyle(
                          color: Color.fromRGBO(33, 33, 31, 1.0),
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width / 9),
                      textAlign: TextAlign.center,
                    ))),
            Center(
                child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text(
                '가게에서 주문 확인 중입니다',
                style: TextStyle(
                    color: Color.fromRGBO(33, 33, 31, 1.0),
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width / 16),
                textAlign: TextAlign.center,
              ),
            )),
            Center(
                child: Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Column(
                      children: [
                        Text(
                          '가게 사정에 따라 주문이 취소될 수 있습니다',
                          style: TextStyle(
                              color: Color.fromRGBO(33, 33, 31, 1.0),
                              fontWeight: FontWeight.w500,
                              fontSize: MediaQuery.of(context).size.width / 25),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '접수되면 알려드릴게요',
                          style: TextStyle(
                              color: Color.fromRGBO(33, 33, 31, 1.0),
                              fontWeight: FontWeight.w500,
                              fontSize: MediaQuery.of(context).size.width / 25),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ))),
            Text(
              '주문 상황은 주문내역에서',
              style: TextStyle(
                  color: Color.fromRGBO(33, 33, 31, 1.0),
                  fontWeight: FontWeight.w500,
                  fontSize: MediaQuery.of(context).size.width / 25),
              textAlign: TextAlign.center,
            ),
            Text(
              '언제든 확인하실 수 있습니다',
              style: TextStyle(
                  color: Color.fromRGBO(33, 33, 31, 1.0),
                  fontWeight: FontWeight.w500,
                  fontSize: MediaQuery.of(context).size.width / 25),
              textAlign: TextAlign.center,
            ),
            Text('$currentState')
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * (50 / 812)),
              width: MediaQuery.of(context).size.width * (60 / 375),
              height: MediaQuery.of(context).size.width * (60 / 375),
              decoration: BoxDecoration(
                  color: white,
                  boxShadow: [customeBoxShadow()],
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * (60 / 375))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.refresh),
                    color: Color.fromRGBO(0, 0, 0, 1.0),
                    onPressed: () => _goOrderState(context),
                    iconSize: MediaQuery.of(context).size.width * (40 / 375),
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * (345 / 375),
              height: MediaQuery.of(context).size.height * (70 / 812),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(218, 155, 104, 0.95),
                  boxShadow: [customeBoxShadow()],
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '홈으로 돌아가기',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width / 21),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '주문내역 보기',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width / 21),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}
