import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gajuga_user/util/box_shadow.dart';

import '../../model/order_history_model.dart';
import '../../model/shoppingcart_model.dart';
import '../../util/box_shadow.dart';
import '../../util/palette.dart';
import '../../util/to_locale.dart';
import '../../util/to_text.dart';
import '../body/approval_order.dart';
import '../header/header.dart';

class ShoppingCartRoute extends StatefulWidget {
  @override
  ShoppingCartState createState() => ShoppingCartState();
}

class ShoppingCartState extends State<ShoppingCartRoute> {
  final List<String> data = <String>['피자', '파스타', '음료'];
  final DBRef = FirebaseDatabase.instance.reference();
  final String userid = 'UserCode-01';
  var tmp = 0;
  int totalCost = 0;
  List<ShoppingCart> cartList = List<ShoppingCart>();

  //scroll controller
  ScrollController _scrollController;

  final orderdata = [
    {
      'Imageurl': 'image1.jpg',
      'name': '고르곤졸라 피자',
      'description': '메뉴에 대한 간략한 설명입니다.',
      'cost': 12900,
      'size': 'Large',
      'addcost': 2000,
    },
    {
      'Imageurl': 'image1.jpg',
      'name': '치즈 피자',
      'description': '메뉴에 대한 간략한 설명입니다.',
      'cost': 11900,
      'size': 'Regular',
      'addcost': 0,
    },
    {
      'Imageurl': 'image1.jpg',
      'name': '포테이토 피자',
      'description': '메뉴에 대한 간략한 설명입니다.',
      'cost': 12900,
      'size': 'Large',
      'addcost': 2000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Expanded(
          //------------------------------------------------------------------ TITLE
          flex: 1,
          child: makeTitle('장바구니', ' 메뉴'),
        ),
        Expanded(
          //------------------------------------------------------------------ CONTENTS
          flex: 7,
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
            width: MediaQuery.of(context).size.width * 0.90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [customeBoxShadow()],
                color: Color.fromRGBO(255, 255, 255, 1.0)),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: cartList == null ? 0 : cartList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return customStrikeBoxContainer(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height / 7,
                    Row(
                      //------------------------------------------------------------------ MAIN CONTANIER
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          //------------------------------------------------------------------ IMAGE
                          flex: 2,
                          child: CircleAvatar(
                            radius:
                                MediaQuery.of(context).size.width * (25 / 375),
                            backgroundImage: AssetImage(
                                'images/${cartList[index].engName}.png'),
                          ),
                        ),
                        Expanded(
                          //------------------------------------------------------------------ DESC
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              cartList[index].cost == 2000
                                  ? makeThreeTitle(
                                      '음료 ',
                                      'BEVERAGE ',
                                      '/ ' + cartList[index].name.toString(),
                                      context)
                                  : makeThreeTitle(
                                      '피자 ',
                                      'PIZZA ',
                                      '/ ' + cartList[index].name.toString(),
                                      context),
                              makeTextSize(
                                  '크기 : ' +
                                      cartList[index].option.size.toString(),
                                  // menus['size'].toString(),

                                  Color.fromRGBO(119, 119, 119, 1.0),
                                  MediaQuery.of(context).size.width *
                                      (15 / 375),
                                  MediaQuery.of(context).size.width / 30),
                              makeTextSize(
                                  '추가요금 : ' +
                                      toLocaleString(countAddCost(
                                          cartList[index].option.dough,
                                          cartList[index].option.size)) +
                                      '원',
                                  Color.fromRGBO(119, 119, 119, 1.0),
                                  MediaQuery.of(context).size.width *
                                      (15 / 375),
                                  MediaQuery.of(context).size.width / 30),
                              makeTextSize(
                                  '수량 : ' + cartList[index].count.toString(),
                                  Color.fromRGBO(119, 119, 119, 1.0),
                                  MediaQuery.of(context).size.width *
                                      (15 / 375),
                                  MediaQuery.of(context).size.width / 30),
                              makeTextSizepadding(
                                  '가격 : ' +
                                      toLocaleString(cartList[index].cost +
                                          countAddCost(
                                                  cartList[index].option.dough,
                                                  cartList[index].option.size) *
                                              cartList[index].count) +
                                      '원',
                                  Colors.black87,
                                  MediaQuery.of(context).size.width *
                                      (15 / 375),
                                  0,
                                  MediaQuery.of(context).size.width / 25),
                            ],
                          ),
                        ),
                        Expanded(
                          //------------------------------------------------------------------ BUTTON
                          flex: 2,
                          child: IconButton(
                              icon: Icon(Icons.remove_circle),
                              color: darkgrey,
                              iconSize: MediaQuery.of(context).size.width *
                                  (30 / 375),
                              onPressed: () =>
                                  {deleteCurrentItem(cartList[index].key)}),
                        )
                      ],
                    ),
                    true,
                    0,
                    0,
                    context);
              },
            ),
          ),
        ),
        Expanded(
            //------------------------------------------------------------------ FOOTER
            flex: 2,
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  boxShadow: [customeBoxShadow()],
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(30.0),
                      topRight: const Radius.circular(30.0)),
                  color: Color.fromRGBO(0, 0, 0, 1.0)),
              child: Column(
                //------------------------------------------------------------------ totalCost
                children: [
                  Expanded(
                      flex: 5,
                      child: Container(
                          padding: EdgeInsets.only(
                            left:
                                MediaQuery.of(context).size.width * (28 / 375),
                            top: MediaQuery.of(context).size.width * (18 / 375),
                            right:
                                MediaQuery.of(context).size.width * (28 / 375),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                '총 주문금액',
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1.0),
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 20),
                                textAlign: TextAlign.left,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    toLocaleString(totalCost) + ' 원',
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 1.0),
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                20),
                                    textAlign: TextAlign.right,
                                  ),
                                  Text(
                                    '부가세(VAT)가 포함된 금액입니다.',
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 1.0),
                                        fontWeight: FontWeight.normal,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                40),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              )
                            ],
                          ))),
                  //------------------------------------------------------------------ Buttons
                  Expanded(
                      flex: 5,
                      child: Row(
                        children: <Widget>[
                          Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(15),
                                  boxShadow: [customeBoxShadow()],
                                  color: Color.fromRGBO(255, 255, 255, 1.0)),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context, true);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '더 담으러 가기',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(33, 33, 31, 1.0),
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                21),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ))),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(15),
                                boxShadow: [customeBoxShadow()],
                                color: Color.fromRGBO(247, 230, 0, 1.0)),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ApprovalOrder()));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '카카오페이',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(33, 33, 31, 1.0),
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              22),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      '주문하기',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(33, 33, 31, 1.0),
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              22),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )),
                          )
                        ],
                      ))
                ],
              ),
            )),
      ]),
    );
  }

  void readData() {
    Map<dynamic, dynamic> result;
    DBRef.child('user/userInfo/' + userid + '/shoppingCart')
        .orderByChild('cost')
        .once()
        .then((DataSnapshot dataSnapshot) {
      result = dataSnapshot.value;
      Map<dynamic, dynamic> values = dataSnapshot.value;
      int sub_totalCost = 0;
      setState(() {
        print('readData');
        cartList.clear();
      });
      if (values == null) {
        setState(() {
          totalCost = sub_totalCost;
          //cartList = cartList.reversed.toList();
        });
      }
      values.forEach((key, value) {
        ShoppingCart item;

        if (value['name'] == '사이다' || value['name'] == '콜라') {
          item = new ShoppingCart(value['cost'], value['count'], value["name"],
              new Option(dough: '기본', size: '355mL'), value['eng_name']);
        } else {
          item = new ShoppingCart(
              value['cost'],
              value['count'],
              value["name"],
              new Option(
                  dough: value['option']['dough'],
                  size: value['option']['size']),
              value['eng_name']);
        }
        sub_totalCost +=
            item.cost + countAddCost(item.option.dough, item.option.size);
        item.key = key;
        setState(() {
          cartList.add(item);
        });
        //print("key:" + key + " value:" + value["cost"].toString());
      });
      setState(() {
        totalCost = sub_totalCost;
        cartList = cartList.reversed.toList();
      });
    });
  }

  void deleteCurrentItem(String key) {
    DBRef.child('user/userInfo/' + userid + '/shoppingCart/' + key).remove();
    readData();
    setState(() {});
  }

  int countAddCost(String dough, String size) {
    int addCost = 0;
    if (dough != '기본') {
      addCost += 2000;
    }
    if (size != '레귤러') {
      addCost += 4000;
    }
    if (size == '355mL') {
      addCost -= 4000;
    }
    return addCost;
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpInshoppingCart');
    readData();
  }

  @override
  void initState() {
    super.initState();
    readData();
  }
}
