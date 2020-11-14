import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/order_list.dart';
import 'package:gajuga_manage/util/palette.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool unhandledOrders = true;
  bool handledOrders = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: darkgrey,
        child: SingleChildScrollView(
          // TODO: headerButton 고정시켜야하는데 physics: NeverScrollableScrollPhysics() 넣으면 ListView에도 적용됨
          child: Column(
            children: [
              headerButtons(),
              unhandledOrders ? OrderList(orderStatus: 1) : OrderList(orderStatus: 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerButtons() {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
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
              width: MediaQuery.of(context).size.width / 2.5,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: unhandledOrders ? orange : pale,
              ),
              alignment: Alignment.center,
              child: Text(
                '미처리된 주문',
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
              width: MediaQuery.of(context).size.width / 2.5,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: handledOrders ? orange : pale,
              ),
              alignment: Alignment.center,
              child: Text(
                '처리된 주문',
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
    );
  }
}