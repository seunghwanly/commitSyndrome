import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gajuga_user/provider/provider.dart';
import 'package:gajuga_user/util/payment/iamport_payment.dart';
import 'package:provider/provider.dart';
import '../header/header.dart';
import '../../util/box_shadow.dart';
import '../../util/box_button.dart';
import '../../util/to_locale.dart';
import '../../util/to_text.dart';
import './sub_menu_modal.dart';
import '../../util/palette.dart';
import '../../model/shoppingcart_model.dart';
import '../../model/order_history_model.dart';

//firebase database
import 'package:firebase_database/firebase_database.dart';

class SubmenuScreen extends StatefulWidget {
  final item, cost, desc, engname;

  SubmenuScreen({this.item, this.cost, this.desc, this.engname});

  @override
  SubmenuScreenState createState() => SubmenuScreenState();
}

class SubmenuScreenState extends State<SubmenuScreen> {
  //firebase
  final databaseReference = FirebaseDatabase.instance.reference();
  final DBRef = FirebaseDatabase.instance.reference();
  final String userid = 'UserCode-01';
  //--------------------------------------------------------------------------고정 옵션
  final contentSize = {
    "category": "SIZE/사이즈 선택",
    "sub": [
      {"name": "레귤러", "eng_name": "regular", "detail": "13inch", "cost": 0},
      {"name": "라지", "eng_name": "large", "detail": "17inch", "cost": 4000}
    ]
  };

  final contentDough = {
    "category": "DOUGH/도우 선택",
    'sub': [
      {'name': "기본", 'eng_name': "standard", 'detail': '', 'cost': 0},
      {'name': "치즈", 'eng_name': "cheese", 'detail': '', 'cost': 2000},
      {'name': "고구마", 'eng_name': "sweet potato", 'detail': '', 'cost': 2000},
    ]
  };

  //selected things
  int count = 1;
  Map<String, dynamic> dataForPush = {
    "cost": 0,
    'count': 0,
    "name": null,
    "option": {"size": "regualr", "dough": "standard"},
    'eng_name': null,
  };

  void handleCount(bool isAdded) {
    setState(() {
      if (isAdded) {
        count++;
      } else {
        if (count > 1) {
          count--;
        }
      }
    });
  }

  void addShoppingCart(ShoppingCart menuItem) {
    // print('이름' + menuItem['name']);
    String push =
        DBRef.child('user/userInfo/' + userid + '/shoppingCart').push().key;
    DBRef.child('user/userInfo/' + userid + '/shoppingCart').child(push).set({
      'cost': menuItem.cost,
      'name': menuItem.name,
      'count': menuItem.count,
      'eng_name': menuItem.engName,
      'option': {
        'dough': menuItem.option.dough,
        'size': menuItem.option.size,
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final optionSelected = Provider.of<StateProvider>(context);
    List<Map<String, dynamic>> parsedOptionList =
        optionSelected.getOptionList();

    int totalCost = (widget.cost +
        parsedOptionList[0]['addedCost'] +
        parsedOptionList[1]['addedCost']);

    //main build -----------------------------------------------------------------
    return CustomHeader(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        makeTitle('세부', ' 메뉴'),
        imageCard(context),
        countCard(context),
        optionCard(context, parsedOptionList, contentSize, contentDough),
        totalCostCard(context, parsedOptionList),
        bottomCard(context, totalCost, parsedOptionList)
      ],
    ));
  }

  Widget imageCard(BuildContext c) {
    return customBoxContainer(
        // 340,
        MediaQuery.of(c).size.width * 0.9, // iphoneX - 340
        MediaQuery.of(c).size.width * 0.9, // iphoneX - 340
        // MediaQuery.of(c).size.height * 0.3,
        Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Container(
                  width: MediaQuery.of(c).size.width * 0.9, // iphoneX - 340
                  height: MediaQuery.of(c).size.height * 0.27, // iphoneX - 203
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      image: DecorationImage(
                        image: AssetImage('images/${widget.engname}.png'),
                        fit: BoxFit.cover,
                      ))),
            ),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(c).size.height * 0.2 * 0.7,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    child: Text(widget.item,
                        style: TextStyle(
                            color: darkblue,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ),
                  Text(
                      // "이것은 메뉴 ${widget.item} 에 대한 설명입니다. 어쩌구 저쩌구 최은만 진짜 싫다..어끝까지 50글자에요",
                      widget.desc,
                      style: TextStyle(
                          color: lightgrey,
                          fontWeight: FontWeight.normal,
                          fontSize: 12))
                ],
              ),
            )
          ],
        ),
        false);
  }

  Widget countCard(BuildContext c) {
    return customBoxContainer(
        MediaQuery.of(c).size.width * 0.9, //iphone X - 340
        MediaQuery.of(c).size.height * 0.07, //iphone X - 60
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: minusButton(30),
              onTap: () => handleCount(false),
            ),
            Text(count.toString(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: darkblue)),
            GestureDetector(
              child: plusButton(30),
              onTap: () => handleCount(true),
            )
          ],
        ),
        true);
  }

  Widget optionCard(BuildContext c, List<Map<String, dynamic>> parsedOptionList,
      final option1, final option2) {
    //final String optionSelected = Provider.of<String>(c);
    // String optionSelected = Consumer<String>()

    return GestureDetector(
      onTap: () {
        showSubMenuModal(c, parsedOptionList, option1, option2);
      },
      child: customBoxContainer(
          MediaQuery.of(c).size.width * 0.9, //iphone X  - 340
          MediaQuery.of(c).size.height * 0.1, //iphone X - 80
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('추가사항 : ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: darkblue),
                      textAlign: TextAlign.center),
                  Text(
                    ' ' +
                        parsedOptionList[0]['selected'] +
                        ' , ' +
                        parsedOptionList[1]['selected'],
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: lightgrey),
                  )
                ],
              ),
              Text('>',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: darkblue),
                  textAlign: TextAlign.center),
            ],
          ),
          true),
    );
  }

  Widget totalCostCard(
      BuildContext c, List<Map<String, dynamic>> parsedOptionList) {
    return customBoxContainer(
        MediaQuery.of(c).size.width * 0.9, //iphone X - 340
        MediaQuery.of(c).size.height * 0.07, //iphone X - 60
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('총 금액',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromRGBO(33, 33, 31, 1.0)),
                textAlign: TextAlign.center),
            Text(
                toLocaleString((widget.cost +
                            parsedOptionList[0]['addedCost'] +
                            parsedOptionList[1]['addedCost']) *
                        count) +
                    '원',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromRGBO(218, 155, 104, 1.0)),
                textAlign: TextAlign.center),
          ],
        ),
        true);
  }

  Widget bottomCard(
      BuildContext c, int totalCost, List<Map<String, dynamic>> list) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: customBoxContainer(
            MediaQuery.of(c).size.width * 0.9, //iphone X - 340
            MediaQuery.of(c).size.height * 0.07, //iphone X - 60
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    //장바구니 경로 user/basket
                    setState(() {
                      dataForPush['cost'] = totalCost;
                      dataForPush['name'] = widget.item;
                      dataForPush['eng_name'] = widget.engname;
                      dataForPush['option']['size'] = list[0]['selected'];
                      dataForPush['option']['dough'] = list[1]['selected'];
                    });

                    // return showDialog(
                    //   context: c,
                    //   builder: (BuildContext context) {
                    //     return Dialog(
                    //       backgroundColor: white,
                    //       child: Text(dataForPush.toString())
                    //     );
                    //   }
                    //   );
                    ShoppingCart menuitem = ShoppingCart(
                        dataForPush['cost'],
                        count,
                        dataForPush['name'],
                        Option(size: '라지', dough: '치즈'),
                        dataForPush['eng_name']);

                    addShoppingCart(menuitem);
                    //writeData();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 30, right: 20),
                    width: MediaQuery.of(c).size.width * 0.45, // iphone X - 170
                    height:
                        MediaQuery.of(c).size.height * 0.07, //iphone X - 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      color: darkblue,
                    ),
                    child: Text('장바구니담기',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                        textAlign: TextAlign.left),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // 결제 화면으로 넘기기
                    Navigator.push(
                        c, MaterialPageRoute(builder: (c) => Payment()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 20, right: 30),
                    width: MediaQuery.of(c).size.width * 0.45, // iphone X - 170
                    height:
                        MediaQuery.of(c).size.height * 0.07, //iphone X - 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: orange,
                    ),
                    child: Text('바로결제및주문',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                        textAlign: TextAlign.right),
                  ),
                )
              ],
            ),
            false));
  }

  void writeData() {
    databaseReference
        .child('user/basket/')
        .push()
        .set(dataForPush)
        .then((v) => print("success!"))
        .catchError((error) => print(error.toString()));
  }
}
