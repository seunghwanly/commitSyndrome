import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/order_list.dart';
import 'package:gajuga_manage/util/palette.dart';

class ChefPage extends StatefulWidget {
  @override
  _ChefPageState createState() => _ChefPageState();
}

class _ChefPageState extends State<ChefPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: darkgrey,
        child: SingleChildScrollView(
          child: OrderList(orderStatus: 0),
        ),
      ),
    );
  }
}
