import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../body/shopping_cart.dart';
import 'package:gajuga_user/util/box_shadow.dart';
import '../../util/to_text.dart';
import '../../util/box_shadow.dart';
import '../../util/palette.dart';
import '../../util/to_locale.dart';
import '../header/header.dart';

class CategoryMenu extends StatefulWidget {
  @override
  CategoryMenuState createState() => CategoryMenuState();
}

class CategoryMenuState extends State<CategoryMenu> {
  final DBRef = FirebaseDatabase.instance.reference();
  final List<String> data = <String>['피자', '음료'];
  final String userid = 'UserCode-01';
  var currentState = 'pizza';
  var tmp = 0;
  var fetchedData;
  var currentMenuList;

  void toShoppingCart(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ShoppingCartRoute()));
    //DBRef.child('menu').set(menudata);
    if (result) {
      setState(() {});
    }
  }

  void addShoppingCart(dynamic menuItem) {
    // print('이름' + menuItem['name']);
    String push =
        DBRef.child('user/userInfo/' + userid + '/shoppingCart').push().key;

    if (currentState == 'pizza') {
      DBRef.child('user/userInfo/' + userid + '/shoppingCart').child(push).set({
        'cost': menuItem['cost'],
        'name': menuItem['name'],
        'option': {
          'dough': '기본',
          'size': '레귤러',
        }
      });
      setState(() {
        tmp += 1;
      });
    } else if (currentState == 'beverage') {
      DBRef.child('user/userInfo/' + userid + '/shoppingCart').child(push).set({
        'cost': menuItem['cost'],
        'name': menuItem['name'],
      });
      setState(() {
        tmp += 1;
      });
    }
  }

  void pizzaState() {
    setState(() {
      currentState = 'pizza';
    });
    readData();
  }

  void beverageState() {
    setState(() {
      currentState = 'beverage';
    });
    readData();
  }

  void readData() {
    DBRef.child('manager/menu/category/' + currentState)
        .once()
        .then((DataSnapshot dataSnapshot) {
      if (dataSnapshot.value != null) {
        setState(() {
          currentMenuList = dataSnapshot.value;
        });
        //  print('사이즈' + currentMenuList.length.toString());
      } else {
        print('데이터 없음');
      }
      // fetchedData = dataSnapshot.value;
    });
  }

  final menudata = {
    'category': [
      {
        'pizza': [
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
        ]
      },
      {
        'beverage': [
          {
            'Imageurl': 'image1.jpg',
            'name': '콜라',
            'description': '콜라가 설명이 필요해?',
            'cost': 2000,
          },
          {
            'Imageurl': 'image2.jpg',
            'name': '사이다',
            'description': '사이다가 설명이 필요해?',
            'cost': 2000,
          },
        ]
      }
    ]
  };

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //readData();
  }

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
        body: Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.012,
                bottom: MediaQuery.of(context).size.height * 0.037),
            child: Column(
              // 전체 컬럼
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: makeTitle('카테고리', ' 메뉴'),
                ),
                Expanded(
                    flex: 1,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FloatingActionButton.extended(
                            heroTag: 'PizzaBtn',
                            elevation: 8.0,
                            onPressed: pizzaState,
                            backgroundColor: currentState == 'pizza'
                                ? Colors.black87
                                : orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width *
                                    0.18, // iphoneX - 200
                                height: MediaQuery.of(context).size.width *
                                    0.18, // iphoneX - 50
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '피자',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                22,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    Text(
                                      'PIZZA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                36,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                )),
                          ),
                          FloatingActionButton.extended(
                            heroTag: 'BeverageBtn',
                            elevation: 8.0,
                            onPressed: beverageState,
                            backgroundColor: currentState == 'beverage'
                                ? Colors.black87
                                : orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width *
                                    0.18, // iphoneX - 200
                                height: MediaQuery.of(context).size.width *
                                    0.18, // iphoneX - 50
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '음료',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                22,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    Text(
                                      'BEVERAGE',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                36,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                )),
                          )
                        ])),
                Expanded(
                    // 피자 PIZZA 하고 아래 LIST VIEW ---------------------------------------------------------------
                    flex: 7,
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        //height: MediaQuery.of(context).size.height * 0.6,
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03,
                          bottom: MediaQuery.of(context).size.height * 0.03,
                        ),
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02,
                            bottom: MediaQuery.of(context).size.height * 0.02),
                        // alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [customeBoxShadow()],
                            color: Color.fromRGBO(255, 255, 255, 1.0)),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: makePaddingTitleSize(
                                  currentState == 'pizza' ? '피자 ' : '음료 ',
                                  currentState == 'pizza'
                                      ? 'PIZZA'
                                      : 'BEVERAGE',
                                  MediaQuery.of(context).size.width * 0.08,
                                  MediaQuery.of(context).size.width * 0.02,
                                  MediaQuery.of(context).size.width *
                                      (18 / 375),
                                  true),
                            ),
                            Expanded(
                              flex: 9,
                              child: ListView.builder(
                                controller:
                                    ScrollController(keepScrollOffset: true),
                                // itemCount: currentMenuList.length == null
                                //     ? 0
                                //     : currentMenuList.length,
                                itemCount: currentMenuList.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  // var menus = new Map<String, dynamic>.from(
                                  //     menudata[index]);
                                  return customBoxContainerCategory(
                                      MediaQuery.of(context).size.width * 0.7,
                                      MediaQuery.of(context).size.height *
                                          (120 / 812),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                radius: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    12,
                                                backgroundImage: AssetImage(
                                                    'images/${currentMenuList[index]['name']}.png'),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  makeTextSizepadding(
                                                      //  menus['name']
                                                      //  .toString(),
                                                      currentMenuList[index]
                                                          ['name'],
                                                      Color.fromRGBO(
                                                          33, 33, 31, 1.0),
                                                      20.0,
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.01,
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          26),
                                                  makeTextSizepaddingWidth(
                                                      // menus['description']
                                                      //   .toString(),
                                                      currentMenuList[index]
                                                          ['desc'],
                                                      Color.fromRGBO(
                                                          119, 119, 119, 1.0),
                                                      20.0,
                                                      0,
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          35,
                                                      context),
                                                  makeTextSizepadding(
                                                      // menus['cost']
                                                      // .toString() +

                                                      toLocaleString(
                                                              currentMenuList[
                                                                      index]
                                                                  ['cost']) +
                                                          '원',
                                                      Color.fromRGBO(
                                                          51, 51, 51, 1.0),
                                                      20.0,
                                                      0,
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          28),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.08,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.08,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(30)),
                                                      boxShadow: [
                                                        customeBoxShadow()
                                                      ],
                                                      color: Color.fromRGBO(
                                                          218, 155, 104, 1.0)),
                                                  child: FloatingActionButton
                                                      .extended(
                                                          heroTag:
                                                              'addShoppingCartBtn' +
                                                                  index
                                                                      .toString(),
                                                          elevation: 3.0,
                                                          onPressed: () =>
                                                              addShoppingCart(currentMenuList[index]),
                                                          backgroundColor: orange,
                                                          hoverColor: Colors.black87,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          label: Container(
                                                              child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              new Text(
                                                                "+",
                                                                style: TextStyle(
                                                                    color:
                                                                        white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        14),
                                                                // textAlign: TextAlign.center,
                                                              )
                                                            ],
                                                          ))))
                                            ],
                                          ),
                                        ],
                                      ),
                                      true,
                                      // MediaQuery.of(context).size.height / 70,
                                      MediaQuery.of(context).size.height / 250,
                                      MediaQuery.of(context).size.width / 50);
                                },
                              ),
                            )
                          ],
                        ))),
                Expanded(
                  flex: 1,
                  child: FloatingActionButton.extended(
                    heroTag: 'goShoppingCartBtn',
                    elevation: 8.0,
                    onPressed: () => toShoppingCart(context),
                    backgroundColor: orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    label: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width *
                          0.53, // iphoneX - 200
                      height: MediaQuery.of(context).size.height *
                          0.06, // iphoneX - 50
                      child: Text(
                        '장바구니 바로가기',
                        style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            )));
    // Column( // 장바구니 바로가기 ------------------------------------------------------------------
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     Container(
    //         // margin:
    //         //     EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
    //         //alignment: Alignment.bottomCenter,

    //         width: MediaQuery.of(context).size.width * 1,
    //         height: MediaQuery.of(context).size.height * 0.07,
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(30),
    //                 topRight: Radius.circular(30)),
    //             boxShadow: [customeBoxShadow()],
    //             color: Color.fromRGBO(218, 155, 104, 1.0)),
    //         // child: new RotationTransition(
    //         //   turns: new AlwaysStoppedAnimation(45 / 360),
    //         //   child:  Image(image: AssetImage('images/icon/close_white.png')),
    //         //   ),
    //         child: GestureDetector(
    //             onTap: () {
    //               Navigator.push(
    //                   context,
    //                   MaterialPageRoute(
    //                       builder: (context) => ShoppingCart()));
    //             },
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: <Widget>[
    //                 Text(
    //                   '장바구니 바로가기',
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.w600,
    //                     fontSize:
    //                         MediaQuery.of(context).size.width / 22,
    //                     color: Colors.white,
    //                   ),
    //                   textAlign: TextAlign.center,
    //                 ),
    //               ],
    //             ))),
    //   ],
    // )
  }
}
