import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gajuga_user/util/box_shadow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../util/to_text.dart';
import '../../util/box_shadow.dart';
import '../../util/palette.dart';
import '../header/header.dart';
import '../body/approval_order.dart';
import '../../model/shoppingcart_model.dart';
import '../../model/menu_model.dart';
import '../../model/order_history_model.dart';
import '../../util/to_locale.dart';

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
  int itemCount = 0;

  void readData() {
    if (itemCount == 1 || itemCount == 0) {
      setState(() {});
    }
    // print('readData');
    List<ShoppingCart> tmpcartList = List<ShoppingCart>();
    DBRef.child('user/userInfo/' + userid + '/shoppingCart')
        .orderByChild('cost')
        .once()
        .then((DataSnapshot dataSnapshot) {
      if (dataSnapshot.value != null) {
        Map<dynamic, dynamic> values = dataSnapshot.value;
        int sub_totalCost = 0;

        values.forEach((key, value) {
          ShoppingCart item;

          if (value['name'] == '사이다' || value['name'] == '콜라') {
            item = new ShoppingCart(value['cost'], value["name"],
                new Option(dough: '기본', size: '레귤러'));
          } else {
            item = new ShoppingCart(
                value['cost'],
                value["name"],
                new Option(
                    dough: value['option']['dough'],
                    size: value['option']['size']));
          }
          sub_totalCost +=
              item.cost + countAddCost(item.option.dough, item.option.size);
          item.key = key;
          tmpcartList.add(item);

          //print("key:" + key + " value:" + value["cost"].toString());
        });

        setState(() {
          itemCount = tmpcartList.length;
          cartList = tmpcartList;
          totalCost = sub_totalCost;
          cartList = cartList.reversed.toList();
        });
      }
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
    return addCost;
  }
  // Menu getMenubyName(String name){
  //   DBRef.child('user/userInfo/' + userid + '/shoppingCart')
  //       .orderByChild('cost')
  //       .once()
  //       .then((DataSnapshot dataSnapshot) {

  //   });
  // }

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
  void initState() {
    super.initState();
    readData();
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpInshoppingCart');
    readData();
  }

  void _trash() {
    // if (headerState.shoppingCartCount == 1 ||
    //     headerState.shoppingCartCount == 0) {
    //   headerState.setState(() {});
    // }
  }

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            makeTitle('장바구니', ' 메뉴'),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01),
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.61,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [customeBoxShadow()],
                  color: Color.fromRGBO(255, 255, 255, 1.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SingleChildScrollView(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // cartList == null
                      //     ? Text('장바구니가 비어있네요 !')
                      ListView.builder(
                        itemCount: cartList == null ? 0 : cartList.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          // var menus =
                          //     new Map<String, dynamic>.from(orderdata[index]);
                          return customStrikeBoxContainer(
                              MediaQuery.of(context).size.width * 0.94,
                              MediaQuery.of(context).size.height * 0.17,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                (25 / 375),
                                            backgroundImage: AssetImage(
                                                'images/${cartList[index].name}.png'),
                                          ),
                                          // Container(
                                          //     width: MediaQuery.of(context)
                                          //             .size
                                          //             .width *
                                          //         (80 / 375),
                                          //     height: MediaQuery.of(context)
                                          //             .size
                                          //             .height *
                                          //         (35 / 812),
                                          //     margin: EdgeInsets.only(
                                          //       top: MediaQuery.of(context)
                                          //               .size
                                          //               .height *
                                          //           (10 / 812),
                                          //     ),
                                          //     padding: EdgeInsets.all(
                                          //         MediaQuery.of(context)
                                          //                 .size
                                          //                 .width *
                                          //             (5 / 375)),
                                          //     decoration: BoxDecoration(
                                          //         boxShadow: [
                                          //           customeBoxShadow()
                                          //         ],
                                          //         color: white,
                                          //         borderRadius:
                                          //             BorderRadius.circular(
                                          //                 10)),
                                          //     child: Row(
                                          //       mainAxisAlignment:
                                          //           MainAxisAlignment
                                          //               .spaceBetween,
                                          //       crossAxisAlignment:
                                          //           CrossAxisAlignment.center,
                                          //       children: [
                                          //         Container(
                                          //           alignment:
                                          //               Alignment.centerLeft,
                                          //           child: GestureDetector(
                                          //             onTap: () {
                                          //               //function()
                                          //             },
                                          //             child: Container(
                                          //               width: 15,
                                          //               height: 15,
                                          //               decoration: BoxDecoration(
                                          //                   boxShadow: [
                                          //                     customeBoxShadow()
                                          //                   ],
                                          //                   color: orange,
                                          //                   borderRadius:
                                          //                       BorderRadius
                                          //                           .circular(
                                          //                               5)),
                                          //               child: Row(
                                          //                 mainAxisAlignment:
                                          //                     MainAxisAlignment
                                          //                         .center,
                                          //                 crossAxisAlignment:
                                          //                     CrossAxisAlignment
                                          //                         .center,
                                          //                 children: [
                                          //                   new Text(
                                          //                     "-",
                                          //                     style: TextStyle(
                                          //                         color: white,
                                          //                         fontWeight:
                                          //                             FontWeight
                                          //                                 .bold,
                                          //                         fontSize: 13),
                                          //                     textAlign:
                                          //                         TextAlign
                                          //                             .center,
                                          //                   )
                                          //                 ],
                                          //               ),
                                          //             ),
                                          //           ),
                                          //         ),
                                          //         Text(
                                          //           '1',
                                          //           style: TextStyle(
                                          //               color: Colors.black,
                                          //               fontWeight:
                                          //                   FontWeight.bold,
                                          //               fontSize: 13),
                                          //           textAlign: TextAlign.center,
                                          //         ),
                                          //         Container(
                                          //           alignment:
                                          //               Alignment.centerRight,
                                          //           child: GestureDetector(
                                          //             onTap: () {
                                          //               //function()
                                          //             },
                                          //             child: Container(
                                          //               width: 15,
                                          //               height: 15,
                                          //               decoration: BoxDecoration(
                                          //                   boxShadow: [
                                          //                     customeBoxShadow()
                                          //                   ],
                                          //                   color: orange,
                                          //                   borderRadius:
                                          //                       BorderRadius
                                          //                           .circular(
                                          //                               5)),
                                          //               child: Row(
                                          //                 mainAxisAlignment:
                                          //                     MainAxisAlignment
                                          //                         .center,
                                          //                 children: [
                                          //                   new Text(
                                          //                     "+",
                                          //                     style: TextStyle(
                                          //                         color: white,
                                          //                         fontWeight:
                                          //                             FontWeight
                                          //                                 .bold,
                                          //                         fontSize: 13),
                                          //                     textAlign:
                                          //                         TextAlign
                                          //                             .center,
                                          //                   )
                                          //                 ],
                                          //               ),
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       ],
                                          //     )),

                                          //여기
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          cartList[index].cost == 2000
                                              ? makeThreeTitle(
                                                  '음료 ',
                                                  'BEVERAGE ',
                                                  '/ ' +
                                                      cartList[index]
                                                          .name
                                                          .toString(),
                                                  context)
                                              : makeThreeTitle(
                                                  '피자 ',
                                                  'PIZZA ',
                                                  '/ ' +
                                                      cartList[index]
                                                          .name
                                                          .toString(),
                                                  context),

                                          makeTextSize(
                                              '크기 : ' +
                                                  cartList[index]
                                                      .option
                                                      .size
                                                      .toString(),
                                              // menus['size'].toString(),

                                              Color.fromRGBO(
                                                  119, 119, 119, 1.0),
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  (15 / 375),
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  30),
                                          makeTextSize(
                                              '추가요금 : ' +
                                                  toLocaleString(countAddCost(
                                                      cartList[index]
                                                          .option
                                                          .dough,
                                                      cartList[index]
                                                          .option
                                                          .size)) +
                                                  '원',
                                              Color.fromRGBO(
                                                  119, 119, 119, 1.0),
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  (15 / 375),
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  30),

                                          makeTextSizepadding(
                                              '가격 : ' +
                                                  toLocaleString(
                                                      cartList[index].cost +
                                                          countAddCost(
                                                              cartList[index]
                                                                  .option
                                                                  .dough,
                                                              cartList[index]
                                                                  .option
                                                                  .size)) +
                                                  '원',
                                              Colors.black87,
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  (15 / 375),
                                              0,
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  25),
                                          ////////////////////////////여기까지주석
                                          // Container(
                                          //     width: 150,
                                          //     height: 20,
                                          //     color: Colors.black12,
                                          //     child: Column(
                                          //       crossAxisAlignment:
                                          //           CrossAxisAlignment.end,
                                          //       mainAxisAlignment:
                                          //           MainAxisAlignment.end,
                                          //       children: [
                                          //         Text(
                                          //           '가격 : ' +
                                          //               (cartList[index].cost +
                                          //                       countAddCost(
                                          //                           cartList[
                                          //                                   index]
                                          //                               .option
                                          //                               .dough,
                                          //                           cartList[
                                          //                                   index]
                                          //                               .option
                                          //                               .size))
                                          //                   .toString() +
                                          //               '원',
                                          //           style: TextStyle(
                                          //               color: Color.fromRGBO(
                                          //                   10, 10, 5, 1.0),
                                          //               fontWeight:
                                          //                   FontWeight.bold,
                                          //               fontSize: MediaQuery.of(
                                          //                           context)
                                          //                       .size
                                          //                       .width /
                                          //                   22),
                                          //           textAlign: TextAlign.center,
                                          //         ),
                                          //       ],
                                          //     )),
                                        ],
                                      ),

                                      //요기
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            //function()
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              // ImageIcon(
                                              //   AssetImage(
                                              //       '../../../images/icon/trash-outline.png'),
                                              //   color: Colors.black87,
                                              //   size: 35,
                                              // ),
                                              // Container()
                                              new IconButton(
                                                  icon:
                                                      Icon(Icons.remove_circle),
                                                  color: darkgrey,
                                                  iconSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          (30 / 375),
                                                  onPressed: () => {
                                                        deleteCurrentItem(
                                                            cartList[index].key)
                                                      }),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              true,
                              0,
                              5,
                              context);
                        },
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * (28 / 375),
                top: MediaQuery.of(context).size.width * (18 / 375),
                right: MediaQuery.of(context).size.width * (28 / 375),
              ),
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * (80 / 812),
              decoration: BoxDecoration(
                  boxShadow: [customeBoxShadow()],
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(30.0),
                      topRight: const Radius.circular(30.0)),
                  color: Color.fromRGBO(0, 0, 0, 1.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '총 주문금액',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width / 24),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        toLocaleString(totalCost) + ' Won',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width / 25),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        '부가세(VAT)가 포함된 금액입니다.',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                            fontWeight: FontWeight.normal,
                            fontSize: MediaQuery.of(context).size.width / 40),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * (70 / 812),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '더 담으러 가기',
                              style: TextStyle(
                                  color: Color.fromRGBO(33, 33, 31, 1.0),
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 21),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ))),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * (70 / 812),
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(15),
                      boxShadow: [customeBoxShadow()],
                      color: Color.fromRGBO(247, 230, 0, 1.0)),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings: RouteSettings(),
                                builder: (context) => ApprovalOrder()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '카카오페이',
                            style: TextStyle(
                                color: Color.fromRGBO(33, 33, 31, 1.0),
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width / 22),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '주문하기',
                            style: TextStyle(
                                color: Color.fromRGBO(33, 33, 31, 1.0),
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width / 22),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}
