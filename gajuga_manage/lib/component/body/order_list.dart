import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'dart:ui';

class OrderMenu {
  String orderNumber;
  String name;
  String additional;
  int quantity;

  OrderMenu({this.orderNumber, this.name, this.additional = '없음', this.quantity = 1});
}

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  TextStyle _orderInfoStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final List<OrderMenu> orderList = [
    OrderMenu(orderNumber: 'A-847', name: '앤초비파스타'),
    OrderMenu(orderNumber: 'A-848', name: '루꼴라피자', additional: '라지 Large / 17 inch'),
    OrderMenu(orderNumber: 'A-849', name: '오일파스타'),
    OrderMenu(orderNumber: 'A-850', name: '루꼴라피자', additional: '라지 Large / 17 inch'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 25, 40, 40),
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: orderList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              children: [
                menuImage(),
                orderInfoLabel(),
                orderInfo(),
                Spacer(),
                timeInfo(),
                Spacer(),
                completedButton(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget menuImage() {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.only(left: 40, right: 40),
      child: CircleAvatar(
        backgroundImage: AssetImage('images/A.png'),
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

  Widget orderInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'A-847',
          style: _orderInfoStyle,
        ),
        Text(
          '앤초비파스타',
          style: _orderInfoStyle,
        ),
        Text(
          '없음',
          style: _orderInfoStyle,
        ),
        Text(
          '1개',
          style: _orderInfoStyle,
        ),
      ],
    );
  }

  Widget timeInfo() {
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
            '8분 23초',
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

  Widget completedButton() {
    return Container(
      height: 140,
      width: 140,
      margin: EdgeInsets.fromLTRB(0, 20, 40, 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: orange,
      ),
      alignment: Alignment.center,
      child: Text(
        '조리\n완료',
        style: TextStyle(
          fontSize: 35,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}