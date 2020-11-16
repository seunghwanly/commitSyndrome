import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/main_container.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:gajuga_manage/component/body/order_list.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'dart:ui';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool unhandledOrders = true;
  bool handledOrders = false;

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      body: SingleChildScrollView(
        child: Column(
          children: [
            StickyHeader(
              header: headerButtons(),
              content: unhandledOrders ? OrderList(orderStatus: 1) : OrderList(orderStatus: 2),
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
                width: MediaQuery.of(context).size.width / 2.3,
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
      ),
    );
  }
}