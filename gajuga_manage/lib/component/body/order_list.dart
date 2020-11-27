import 'package:flutter/material.dart';
import 'package:gajuga_manage/model/order_model.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:intl/intl.dart';
import 'dart:ui';
//firebase database
import 'package:firebase_database/firebase_database.dart';

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
  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
  TextStyle _orderInfoStyle =
      TextStyle(fontSize: 21, fontWeight: FontWeight.w700);

  TextStyle _orderTimeStyle = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );
  var now = DateTime.now();

  String parseDateToString(String date) {
    DateTime d1 = DateTime.parse(date);
    return DateFormat('HH시 mm분 ss초').format(d1);
  }

  void progationState(
      String currentState, String orderNumber, String userInfo) {
    String nextState = '';
    if (currentState == 'request') {
      nextState = 'confirm';
    } else if (currentState == 'confirm') {
      nextState = 'ready';
    }

    if (nextState != '') {
      var now2 = DateTime.now();
      // order/2020-11-22/key/orderList
      databaseReference
          .child('order/' + DateFormat('yyyy-MM-dd').format(now))
          .once()
          .then((DataSnapshot dataSnapshot) {
        Map<dynamic, dynamic> values = dataSnapshot.value;

        values.forEach((k, v) {
          if (v['orderNumber'] == orderNumber) {
            databaseReference
                .child('order/' + DateFormat('yyyy-MM-dd').format(now))
                .child(k)
                .child('orderTimes')
                .child(nextState + 'Time')
                .set(now2.toString());
            databaseReference
                .child('order/' + DateFormat('yyyy-MM-dd').format(now))
                .child(k)
                .child('orderState')
                .set(nextState);
          }
        });
      });
      // user/uid/history/key/orderList
      databaseReference
          .child('user')
          .child(userInfo)
          .child('history')
          .once()
          .then((DataSnapshot dataSnapshot) {
        Map<dynamic, dynamic> values = dataSnapshot.value;
        values.forEach((k, v) {
          if (v['orderNumber'] == orderNumber) {
            databaseReference
                .child('user/')
                .child(userInfo)
                .child('history')
                .child(k)
                .child('orderTimes')
                .child(nextState + 'Time')
                .set(now2.toString());

            databaseReference
                .child('user/')
                .child(userInfo)
                .child('history')
                .child(k)
                .child('orderState')
                .set(nextState);
          }
        });
      });
    }
  }

  String differTwoDays(String str1, String str2) {
    DateTime d1 = DateTime.parse(str1);
    DateTime d2 = DateTime.parse(str2);
    var differ = d2.difference(d1).inMinutes;
    return (differ.toString());
  }

  String differDayFromNow(String str1) {
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
        itemCount: widget.orderList == null ? 0 : widget.orderList.length,
        itemBuilder: (BuildContext context, int index) {
          // if (widget.orderStatus == widget.orderList[index].status)
          return Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: pale,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1, 2),
                  blurRadius: 10,
                  spreadRadius: 0.1,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.orderList[index]['contents'].length,
                          itemBuilder:
                              (BuildContext context, int contentIndex) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    menuImage(
                                        widget.orderList[index], contentIndex),
                                    orderInfoLabel(),
                                    orderInfo(
                                        widget.orderList[index], contentIndex),
                                  ],
                                ),
                                contentIndex !=
                                        widget.orderList[index]['contents']
                                                .length -
                                            1
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Divider(thickness: 3))
                                    : SizedBox.shrink(),
                              ],
                            );
                          }),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          timeInfo(widget.orderList[index]),
                          Spacer(flex: 1),
                          completedButton(widget.orderList[index]['orderState'],
                              widget.orderList[index]),
                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget menuImage(var menu, int _idx) {
    return Container(
      width: 100,
      height: 180,
      margin: EdgeInsets.only(left: 40, right: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage:
                AssetImage('images/${menu['contents'][_idx]['eng_name']}.png'),
            radius: 35,
          ),
          SizedBox(height: 20),
          Text(
            '${menu['orderNumber']}',
            style: _orderInfoStyle,
          ),
        ],
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

  Widget orderInfo(var menu, int _idx) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${menu['contents'][_idx]['name']}',
            style: _orderInfoStyle,
          ),
          Text(
            '${menu['contents'][_idx]['option']['dough']} / ${menu['contents'][_idx]['option']['size']}',
            style: _orderInfoStyle,
          ),
          Text(
            '${menu['contents'][_idx]['count']}',
            style: _orderInfoStyle,
          ),
        ],
      ),
    );
  }

  Widget timeInfo(var menu) {
    if (menu['orderState'] == 'ready') {
      return Expanded(
        //margin: EdgeInsets.only(left: 40),
        flex: 4,
        child: Column(
          children: [
            Text(
              '총 소요시간',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              differTwoDays(menu['orderTimes']['requestTime'],
                      menu['orderTimes']['readyTime']) +
                  ' 분',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            Text(
              '경과시간',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              differDayFromNow(menu['orderTimes']['requestTime']) + ' 분',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget completedButton(String status, dynamic order) {
    if (status == 'ready') {
      return Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '주문시간 : ' +
                    parseDateToString(order['orderTimes']['requestTime']) +
                    '\n\n' +
                    '승인시간 : ' +
                    parseDateToString(order['orderTimes']['confirmTime']) +
                    '\n\n' +
                    '준비완료 : ' +
                    parseDateToString(order['orderTimes']['readyTime']),
                style: _orderTimeStyle,
              ),
              // Text(
              //   '승인시간 : ' +
              //       parseDateToString(order['orderTimes']['confirmTime']),
              //   style: _orderTimeStyle,
              // ),
              // Text(
              //   '준비완료 : ' + parseDateToString(order['orderTimes']['readyTime']),
              //   style: _orderTimeStyle,
              // ),
              // Text(
              //   '결제코드 : 2020010125542',
              //   style: _orderInfoStyle,
              // ),
            ],
          ));
    } else {
      return InkWell(
        onTap: () {
          progationState(status, order['orderNumber'].toString(),
              order['customerInfo'].toString());
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
                    : '처리\n완료',
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
}
