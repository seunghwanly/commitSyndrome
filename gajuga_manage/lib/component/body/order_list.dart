import 'package:flutter/material.dart';
import 'package:gajuga_manage/model/order_model.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:intl/intl.dart';
import 'dart:ui';

// class OrderMenu {
//   String orderNumber;
//   String name;
//   String additional;
//   int quantity;
//   String status; // 0: 미처리, 1: 주문승인(조리중), 2: 준비완료

//   OrderMenu(
//       {this.orderNumber,
//       this.name,
//       this.additional = '없음',
//       this.quantity = 1,
//       this.status = 'request'});
// }

class OrderList extends StatefulWidget {
  final String orderStatus;
  final orderList;

  const OrderList({Key key, this.orderStatus, this.orderList})
      : super(key: key);

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  TextStyle _orderInfoStyle =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

  String differTwoDays(String str1) {
    DateTime d1 = DateTime.parse(str1);
    DateTime d2 = DateTime.now();
    var differ = d2.difference(d1).inMinutes;
    return (differ.toString());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 0, 40, 40),
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.orderList.length,
        itemBuilder: (BuildContext context, int index) {
          // if (widget.orderStatus == widget.orderList[index].status)
          return Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1, 2),
                  blurRadius: 10,
                  spreadRadius: 0.1,
                ),
              ],
            ),
            child: Row(
              children: [
                menuImage(index),
                orderInfoLabel(),
                orderInfo(widget.orderList[index]),
                timeInfo(widget.orderList[index]),
                Spacer(),
                completedButton(widget.orderList[index]['orderState']),
              ],
            ),
          );
          // else
          // return SizedBox.shrink();
        },
      ),
    );
  }

  Widget menuImage(int index) {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.only(left: 40, right: 40),
      child: CircleAvatar(
        backgroundImage: AssetImage(
            'images/${widget.orderList[index]['contents'][0]['eng_name']}.png'),
        radius: 35,
      ),
    );
  }

  Widget orderInfoLabel() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '주문번호 :',
            style: _orderInfoStyle,
          ),
          Text(
            '메뉴이름 :',
            style: _orderInfoStyle,
          ),
          Text(
            '추가사항 :',
            style: _orderInfoStyle,
          ),
          Text(
            '개수 :',
            style: _orderInfoStyle,
          ),
        ],
      ),
    );
  }

  Widget orderInfo(var menu) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${menu['orderNumber']}',
            style: _orderInfoStyle,
          ),
          Text(
            '${menu['contents'][0]['name']}',
            style: _orderInfoStyle,
          ),
          Text(
            '${menu['contents'][0]['option']['dough']} / ${menu['contents'][0]['option']['size']}',
            style: _orderInfoStyle,
          ),
          Text(
            '${menu['contents'][0]['count']}',
            style: _orderInfoStyle,
          ),
        ],
      ),
    );
  }

  Widget timeInfo(var menu) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Text(
            '경과시간',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            differTwoDays(menu['orderTimes']['requestTime']) + ' 분',
            style: TextStyle(
              fontSize: 43,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget completedButton(String status) {
    return InkWell(
      onTap: () {
        print('click');
      },
      child: Container(
        height: 140,
        width: 140,
        margin: EdgeInsets.fromLTRB(0, 20, 20, 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: orange,
        ),
        alignment: Alignment.center,
        child: Text(
          status == 'request'
              ? '주문\n승인'
              : status == 'confirm'
                  ? '준비\n완료'
                  : '준비\n완료',
          style: TextStyle(
            fontSize: 35,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
