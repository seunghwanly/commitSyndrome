import 'package:flutter/material.dart';
import 'package:gajuga_user/util/box_shadow.dart';
import '../../util/to_text.dart';
import '../../util/box_shadow.dart';
import '../../util/palette.dart';
import '../header/header.dart';
import '../../util/dash_Rect.dart';
import 'package:flutter/material.dart';
import 'package:fdottedline/fdottedline.dart';

class ShoppingCart extends StatelessWidget {
  final List<String> data = <String>['피자', '파스타', '음료'];

  final menudata = [
    {
      'Imageurl': 'image1.jpg',
      'name': '고르곤졸라 피자',
      'description': '메뉴에 대한 간략한 설명입니다.',
      'cost': 12900,
    },
    {
      'Imageurl': 'image2.jpg',
      'name': '치즈 피자',
      'description': '메뉴에 대한 간략한 설명입니다.',
      'cost': 11900,
    },
    {
      'Imageurl': 'image3.jpg',
      'name': '페퍼로니 피자',
      'description': '메뉴에 대한 간략한 설명입니다.',
      'cost': 11900,
    },
    {
      'Imageurl': 'image3.jpg',
      'name': '포테이토 피자',
      'description': '메뉴에 대한 간략한 설명입니다.',
      'cost': 13900,
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
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [customeBoxShadow()],
                  color: Color.fromRGBO(255, 255, 255, 1.0)),
              child: Column(
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
                              new Map<String, dynamic>.from(menudata[index]);
                          return customStrikeBoxContainer(
                              MediaQuery.of(context).size.width * 0.6,
                              MediaQuery.of(context).size.height * 0.13,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 30,
                                            backgroundImage:
                                                AssetImage('images/C.png'),
                                          ),
                                          Container(
                                              width: 80,
                                              height: 35,
                                              margin: EdgeInsets.only(top: 5),
                                              padding: EdgeInsets.all(5),
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
                                            MainAxisAlignment.center,
                                        children: [
                                          makeTextSize(
                                              menus['name'].toString(),
                                              Color.fromRGBO(33, 33, 31, 1.0),
                                              20.0,
                                              14),
                                          makeTextSize(
                                              menus['description'].toString(),
                                              Color.fromRGBO(
                                                  119, 119, 119, 1.0),
                                              20.0,
                                              14),
                                          makeTextSize(
                                              menus['cost'].toString() + '원',
                                              Color.fromRGBO(51, 51, 51, 1.0),
                                              20.0,
                                              14),
                                        ],
                                      ),
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
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              // ImageIcon(
                                              //   AssetImage(
                                              //       '../../../images/icon/trash-outline.png'),
                                              //   color: Colors.black87,
                                              //   size: 35,
                                              // ),
                                              new IconButton(
                                                  icon: Icon(
                                                      Icons.restore_from_trash),
                                                  color: Colors.black87,
                                                  iconSize: 35,
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
                              15,
                              20);
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
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                  boxShadow: [customeBoxShadow()],
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(30.0),
                      topRight: const Radius.circular(30.0)),
                  color: Color.fromRGBO(0, 0, 0, 1.0)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(15),
                      boxShadow: [customeBoxShadow()],
                      color: Color.fromRGBO(255, 255, 255, 1.0)),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(15),
                      boxShadow: [customeBoxShadow()],
                      color: Color.fromRGBO(247, 230, 0, 1.0)),
                ),
              ],
            )
          ],
        )
      ]),
    );
  }
}
