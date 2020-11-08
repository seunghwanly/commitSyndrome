import 'package:flutter/material.dart';
import 'package:gajuga_user/util/box_shadow.dart';
import '../../util/to_text.dart';
import '../../util/box_shadow.dart';
import '../../util/palette.dart';
import '../header/header.dart';
import '../body/approval_order.dart';

class ShoppingCart extends StatelessWidget {
  final List<String> data = <String>['피자', '파스타', '음료'];

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
    void _trash() {}
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
                      ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          var menus =
                              new Map<String, dynamic>.from(orderdata[index]);
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
                                            backgroundImage:
                                                AssetImage('images/C.png'),
                                          ),
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  (80 / 375),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  (35 / 812),
                                              margin: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    (10 / 812),
                                              ),
                                              padding: EdgeInsets.all(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      (5 / 375)),
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    customeBoxShadow()
                                                  ],
                                                  color: white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        //function()
                                                      },
                                                      child: Container(
                                                        width: 15,
                                                        height: 15,
                                                        decoration: BoxDecoration(
                                                            boxShadow: [
                                                              customeBoxShadow()
                                                            ],
                                                            color: orange,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            new Text(
                                                              "-",
                                                              style: TextStyle(
                                                                  color: white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 13),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    '1',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        //function()
                                                      },
                                                      child: Container(
                                                        width: 15,
                                                        height: 15,
                                                        decoration: BoxDecoration(
                                                            boxShadow: [
                                                              customeBoxShadow()
                                                            ],
                                                            color: orange,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            new Text(
                                                              "+",
                                                              style: TextStyle(
                                                                  color: white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 13),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),

                                          //여기
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          makeThreeTitle(
                                              '피자 ',
                                              'PIZZA ',
                                              '/ ' + menus['name'].toString(),
                                              context),
                                          makeTextSize(
                                              '크기 : ' +
                                                  menus['size'].toString(),
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
                                                  menus['addcost'].toString() +
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

                                          makeThreeTitle(
                                              '가격 : ' +
                                                  (menus['cost'] +
                                                          menus['addcost'])
                                                      .toString() +
                                                  '원',
                                              '',
                                              '',
                                              context),
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
                                          //               (menus['cost'] +
                                          //                       menus[
                                          //                           'addcost'])
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
                                                  icon: Icon(
                                                      Icons.restore_from_trash),
                                                  color: Colors.black87,
                                                  iconSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          (30 / 375),
                                                  onPressed: _trash),
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
                        '42,700 Won',
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
                          Navigator.pop(context);
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
