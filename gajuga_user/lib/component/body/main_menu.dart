import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gajuga_user/component/body/sub_menu.dart';
import 'package:gajuga_user/util/box_shadow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../util/to_locale.dart';
import '../../util/to_text.dart';
import '../../util/box_shadow.dart';
import '../../util/palette.dart';
import '../body/category_menu.dart';
import '../../model/menu_model.dart';

class TotalMenu extends StatefulWidget {
  @override
  TotalMenuState createState() => TotalMenuState();
}

class TotalMenuState extends State<TotalMenu> {
  final DBRef = FirebaseDatabase.instance.reference();
  final List<String> data = <String>['A', 'B', 'C', 'D'];
  final String userid = 'UserCode-01';
  var currentState = 'pizza';
  var currentMenuList;

  void readData() {
    DBRef.child('manager/menu/category/' + currentState)
        .once()
        .then((DataSnapshot dataSnapshot) {
      if (dataSnapshot.value != null) {
        setState(() {
          currentMenuList = dataSnapshot.value;
        });
        print('사이즈' + currentMenuList.length.toString());
      } else {
        print('데이터 없음');
      }
      // fetchedData = dataSnapshot.value;
    });
  }

  void getCurrentList() {
    //print("되냐여기" + jsonEncode(fetchedData));
  }

  void addMenuItem(Menu menu) {
    Ingredient tmp;
    int i = 0;
    // print(menu.ingredients);
    DBRef.child('user')
        .child('userInfo')
        .child(userid)
        .child('shoppingCart')
        .set({
      "name": menu.name,
      "cost": menu.cost,
      'ingrdients': [
        for (Ingredient ingre in menu.ingredients)
          {
            ingre.name: ingre.quantity,
          }
      ]
    });
  }

  @override
  void initState() {
    super.initState();
    readData();
    //getCurrentList();
  }

  @override
  Widget build(BuildContext context) {
    //readData();

    return Container(
        //height: 530,
        height: MediaQuery.of(context).size.height * 0.65,
        child: Column(
          children: <Widget>[
            // makeTitle('전체', ' 메뉴'),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CategoryMenu()));
              },
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      '전체 ',
                      style: TextStyle(
                          color: Color.fromRGBO(218, 155, 104, 1.0),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '메뉴',
                      style: TextStyle(
                          color: Color.fromRGBO(33, 33, 31, 1.0),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/고르곤졸라피자.png'),
                          fit: BoxFit.cover)),
                  // child: Image(
                  //   image: AssetImage('images/고르곤졸라피자.png'),
                  //   fit: BoxFit.cover,
                  //   // height: 427,
                  // ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2),
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: double.infinity,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 40),
                    itemCount: this.currentMenuList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _listItem(
                          this.currentMenuList[index]['name'],
                          AssetImage(
                              'images/${this.currentMenuList[index]['name']}.png'),
                          this.currentMenuList[index]['desc'],
                          this.currentMenuList[index]['cost'],
                          context);
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _listItem(String title, AssetImage image, String desc, int cost,
      BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width * 0.45;
    double itemHeight = MediaQuery.of(context).size.height * 0.35;

    return Container(
      width: itemWidth,
      height: itemHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              offset: Offset(0, 3),
              blurRadius: 6,
            )
          ]),
      margin: EdgeInsets.only(left: 40, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: image,
            radius: 35,
          ),
          Text(title,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              textAlign: TextAlign.center),
          Text(desc,
              style:
                  TextStyle(fontWeight: FontWeight.normal, color: Colors.grey),
              textAlign: TextAlign.center),
          Text(toLocaleString(cost) + " 원",
              style:
                  TextStyle(fontWeight: FontWeight.normal, color: Colors.grey),
              textAlign: TextAlign.center),
          FlatButton(
            color: orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () {
              List<Ingredient> ingredients = [];
              Ingredient ingre1 = Ingredient('치즈', 12);
              Ingredient ingre2 = Ingredient('올리브', 5);
              ingredients.add(ingre1);
              ingredients.add(ingre2);
              Menu thisMenu = Menu('올리브피자', 13900, ingredients);
              //addMenuItem(thisMenu);
              //  var orders =
              //     new Map<String, dynamic>.from(this.fetchedData[0]);
              // var orders = new Map<String, dynamic>.from(
              //     this.fetchedData["category"][0]);
              // print(
              //     "담겼나요 ? " + jsonEncode(fetchedData['category'][0]['pizza']));

              Scaffold.of(context).showSnackBar(SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: itemHeight * 0.1,
                      child: Text(
                        '메뉴 ' + title + ' 가 장바구니에 담겼습니다 :)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    FlatButton(
                        onPressed: () {
                          Scaffold.of(context).hideCurrentSnackBar();
                        },
                        child: Container(
                          height: itemHeight * 0.1,
                          width: itemWidth * 0.2,
                          alignment: Alignment.centerRight,
                          child: Text(
                            '닫기',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ))
                  ],
                ),
                behavior: SnackBarBehavior.floating,
                backgroundColor: orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 10.0,
              ));
            },
            child: Container(
              alignment: Alignment.center,
              height: itemHeight * 0.09,
              width: itemWidth * 0.6,
              child: Text(
                "장바구니 담기",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FavoriteMenuWidget extends StatelessWidget {
  final List<String> data = <String>['A', 'B', 'C', 'D'];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        makeTitle("인기", " 메뉴"),
        Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.16,
            margin: EdgeInsets.only(left: 25, top: 15, right: 25),
            padding: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [customeBoxShadow()]),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubmenuScreen(
                                    item: data[index], cost: 12900)));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 30, top: 10, right: 30),
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('images/불고기피자.png'),
                            ),
                            Text(
                              "메뉴 " + data[index],
                              style: TextStyle(
                                  color: darkblue, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ));
                }))
      ],
    ));
  }
}
