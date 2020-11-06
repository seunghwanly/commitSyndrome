import 'package:flutter/material.dart';
import '../body/shopping_cart.dart';
import 'package:gajuga_user/util/box_shadow.dart';
import '../../util/to_text.dart';
import '../../util/box_shadow.dart';
import '../../util/palette.dart';
import '../header/header.dart';

class CategoryMenu extends StatelessWidget {
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
    return CustomHeader(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            makeTitle('카테고리', ' 메뉴'),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01),
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [customeBoxShadow()],
                          color: Color.fromRGBO(218, 155, 104, 1.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '피자',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            'PIZZA',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01),
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [customeBoxShadow()],
                          color: Color.fromRGBO(33, 33, 31, 1.0)),
                      // child: new RotationTransition(
                      //   turns: new AlwaysStoppedAnimation(45 / 360),
                      //   child:  Image(image: AssetImage('images/icon/close_white.png')),
                      //   ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '파스타',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            'PASTA',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01),
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [customeBoxShadow()],
                          color: Color.fromRGBO(33, 33, 31, 1.0)),
                      // child: new RotationTransition(
                      //   turns: new AlwaysStoppedAnimation(45 / 360),
                      //   child:  Image(image: AssetImage('images/icon/close_white.png')),
                      //   ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '음료',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            'BEVERAGE',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      )),
                ]),
            Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.015),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.015),
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width * 0.93,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [customeBoxShadow()],
                    color: Color.fromRGBO(255, 255, 255, 1.0)),
                // child: new RotationTransition(
                //   turns: new AlwaysStoppedAnimation(45 / 360),
                //   child:  Image(image: AssetImage('images/icon/close_white.png')),
                //   ),
                child: Column(
                  children: <Widget>[
                    SingleChildScrollView(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        makeTitleSize('피자', ' PIZZA',
                            MediaQuery.of(context).size.width * 0.04, 20, true),
                        ListView.builder(
                          itemCount: data.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            var menus =
                                new Map<String, dynamic>.from(menudata[index]);
                            return customBoxContainerWithMargin(
                                MediaQuery.of(context).size.width * 0.9,
                                MediaQuery.of(context).size.height * 0.14,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 38,
                                          backgroundImage:
                                              AssetImage('images/A.png'),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            makeTextSizepadding(
                                                menus['name'].toString(),
                                                Color.fromRGBO(33, 33, 31, 1.0),
                                                20.0,
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01,
                                                14),
                                            makeTextSizepadding(
                                                menus['description'].toString(),
                                                Color.fromRGBO(
                                                    119, 119, 119, 1.0),
                                                20.0,
                                                0,
                                                14),
                                            makeTextSizepadding(
                                                menus['cost'].toString() + '원',
                                                Color.fromRGBO(51, 51, 51, 1.0),
                                                20.0,
                                                0,
                                                14),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerRight,
                                          child: GestureDetector(
                                            onTap: () {
                                              //showOrderHistoryModal(context, menus);
                                            },
                                            child: Container(
                                              width: 35,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    customeBoxShadow()
                                                  ],
                                                  color: orange,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  new Text(
                                                    "+",
                                                    style: TextStyle(
                                                        color: white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 28),
                                                    textAlign: TextAlign.center,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                true,
                                15,
                                5);
                          },
                        ),
                      ],
                    )),
                  ],
                )),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                // margin:
                //     EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                //alignment: Alignment.bottomCenter,

                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [customeBoxShadow()],
                    color: Color.fromRGBO(218, 155, 104, 1.0)),
                // child: new RotationTransition(
                //   turns: new AlwaysStoppedAnimation(45 / 360),
                //   child:  Image(image: AssetImage('images/icon/close_white.png')),
                //   ),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShoppingCart()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '장바구니 바로가기',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ))),
          ],
        )
      ],
    ));
  }
}
