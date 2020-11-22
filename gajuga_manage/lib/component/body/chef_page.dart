import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/order_list.dart';
import 'package:gajuga_manage/util/main_container.dart';
//firebase database
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class ChefPage extends StatefulWidget {
  @override
  _ChefPageState createState() => _ChefPageState();
}

class _ChefPageState extends State<ChefPage> {
  var confirmedList;
  var now = DateTime.now();
  final databaseReference = FirebaseDatabase.instance.reference();

  void readListbyState() {
    databaseReference
        .child('order/' + DateFormat('yyyy-MM-dd').format(now))
        .orderByChild('orderNumber')
        .once()
        .then((DataSnapshot dataSnapshot) {
      Map<dynamic, dynamic> values = dataSnapshot.value;
      var orderConfirmedList = new List<dynamic>();
      //print(values.toString());
      values.forEach((k, v) {
        if (v['orderState'] == 'confirm') orderConfirmedList.add(v);
      });
      setState(() {
        this.confirmedList = orderConfirmedList;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    readListbyState();
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      body: SingleChildScrollView(
        child: OrderList(
          orderStatus: 'confirm',
          orderList: confirmedList,
        ),
      ),
    );
  }
}
