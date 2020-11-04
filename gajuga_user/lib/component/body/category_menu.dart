import 'package:flutter/material.dart';
import 'package:gajuga_user/component/body/sub_menu.dart';
import 'package:gajuga_user/util/box_shadow.dart';
import '../../util/to_text.dart';
import '../../util/box_shadow.dart';
import '../../util/palette.dart';
import '../header/header.dart';

class CategoryMenu extends StatelessWidget {
  final List<String> data = <String>['피자', '파스타', '음료'];

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        makeTitle('카테고리', ' 메뉴'),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.topCenter,
                  width: 96,
                  height: 120,
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
                          fontSize: 22,
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
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.topCenter,
                  width: 96,
                  height: 120,
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
                          fontSize: 22,
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
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.topCenter,
                  width: 96,
                  height: 120,
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
                          fontSize: 22,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        'BEVERAGE',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  )),
            ]),
        Container(
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.topCenter,
            width: 400,
            height: 700,
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
                makeTitle('피자', ' PIZZA'),
                makeTitle('피자', ' PIZZA'),
                makeTitle('피자', ' PIZZA'),
              ],
            ))
      ],
    ));
  }
}
