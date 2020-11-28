import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/main_container.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:gajuga_manage/component/body/order_list.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:intl/intl.dart';
//firebase database
import 'package:firebase_database/firebase_database.dart';
import 'dart:ui';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  var unhandledList;
  var handledList;
  bool unhandledOrders = true;
  bool handledOrders = false;
  var now = DateTime.now();
  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

  String getCurrnetListCount_unhandled() {
    if (unhandledList == null) {
      return '0';
    } else {
      return unhandledList.length.toString();
    }
  }

  String getCurrnetListCount_handled() {
    if (handledList == null) {
      return '0';
    } else {
      return handledList.length.toString();
    }
  }

  void readListbyState() {
    print('readList !');
    DatabaseReference readDatabaseReference =
        FirebaseDatabase.instance.reference();
    readDatabaseReference
        .child('order/' + DateFormat('yyyy-MM-dd').format(now))
        .orderByChild('orderNumber')
        .once()
        .then((DataSnapshot dataSnapshot) {
      Map<dynamic, dynamic> values = dataSnapshot.value;
      var orderHandledList = new List<dynamic>();
      var orderUnHandledList = new List<dynamic>();
      //print(values.toString());
      values.forEach((k, v) {
        if (v['orderState'] == 'request')
          orderUnHandledList.add(v);
        else if (v['orderState'] == 'ready') orderHandledList.add(v);
      });

      orderHandledList.sort((a, b) {
        return a['orderTimes']['requestTime']
            .compareTo(b['orderTimes']['requestTime']);
      });
      orderUnHandledList.sort((a, b) {
        return a['orderTimes']['requestTime']
            .compareTo(b['orderTimes']['requestTime']);
      });

      setState(() {
        this.unhandledList = orderUnHandledList;
        this.handledList = orderHandledList;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    databaseReference = FirebaseDatabase.instance
        .reference()
        .child('order/' + DateFormat('yyyy-MM-dd').format(DateTime.now()));
    //listener
    databaseReference.onChildAdded.listen((event) {
      readListbyState();
      setState(() {});
    });
    databaseReference.onChildChanged.listen((event) {
      readListbyState();
      setState(() {});
    });
    // databaseReference.onChildMoved.listen((event) {
    //   readListbyState();
    //   setState(() {});
    // });
    databaseReference.onChildRemoved.listen((event) {
      readListbyState();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // readListbyState();
    return MainContainer(
      body: SingleChildScrollView(
        child: Column(
          children: [
            StickyHeader(
              header: headerButtons(),
              content: unhandledOrders
                  ? OrderList(orderStatus: 'request', orderList: unhandledList)
                  : OrderList(
                      orderStatus: 'ready',
                      orderList: handledList,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget headerButtons() {
    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 10, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  unhandledOrders = true;
                  handledOrders = false;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2.3,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: unhandledOrders ? orange : pale,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1, 2),
                      blurRadius: 2,
                      spreadRadius: 0.1,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  '미처리된 주문(' + getCurrnetListCount_unhandled() + ')',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: unhandledOrders ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  handledOrders = true;
                  unhandledOrders = false;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2.3,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: handledOrders ? orange : pale,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1, 2),
                      blurRadius: 2,
                      spreadRadius: 0.1,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  '처리된 주문(' + getCurrnetListCount_handled() + ')',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: handledOrders ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
