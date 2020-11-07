import 'package:flutter/material.dart';
import '../header/header.dart';
import '../../util/box_shadow.dart';
import '../../util/box_button.dart';
import '../../util/to_locale.dart';
import '../../util/to_text.dart';
import './sub_menu_modal.dart';
import '../../util/palette.dart';

class SubmenuScreen extends StatefulWidget {

  final item, cost;

  SubmenuScreen({ this.item, this.cost});

  @override
  SubmenuScreenState createState() => SubmenuScreenState();
}

class SubmenuScreenState extends State<SubmenuScreen> {

  int count = 1;
  final bool option1 = null, option2 = null;

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

  @override
  Widget build(BuildContext context) {  //main build -----------------------------------------------------------------
    return CustomHeader(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        makeTitle('세부', ' 메뉴'),
        imageCard(context),
        countCard(context),
        optionCard(context, option1, option2),
        totalCostCard(context),
        bottomCard(context)
      ],
    ));
  }

  Widget imageCard(BuildContext c) {
    return customBoxContainer(
        // 340,
        MediaQuery.of(c).size.width * 0.9,
        MediaQuery.of(c).size.width * 0.9,
        Column(
          children: [
            Container(
              child: Container(
                width: MediaQuery.of(c).size.width * 0.9,
                height: MediaQuery.of(c).size.height * 0.27,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  image: DecorationImage(
                    image: AssetImage('images/${widget.item}.png'),
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              height: MediaQuery.of(c).size.height * 0.27 * 0.5,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(widget.item,
                        style: TextStyle(
                            color: darkblue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                  Text("이것은 메뉴 ${widget.item} 에 대한 설명입니다. 어쩌구 저쩌구 최은만 진짜 싫다..",
                      style: TextStyle(
                          color: lightgrey,
                          fontWeight: FontWeight.normal,
                          fontSize: 14))
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
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: darkblue)
                    ),
            GestureDetector(
              child: plusButton(30),
              onTap: () => handleCount(true),
            )
          ],
        ),
        true);
  }

  Widget optionCard(BuildContext c, final option1, final option2) {
    return GestureDetector(
      onTap: () {
        showSubMenuModal(c, option1, option2);
      },
      child: customBoxContainer(
          MediaQuery.of(c).size.width * 0.9, //iphone X  - 340
          MediaQuery.of(c).size.height * 0.1, //iphone X - 80
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('추가사항',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: darkblue),
                  textAlign: TextAlign.center),
              Text('>',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: darkblue),
                  textAlign: TextAlign.center),
            ],
          ),
          true),
    );
  }

  Widget totalCostCard(BuildContext c) {
    return customBoxContainer(
        MediaQuery.of(c).size.width * 0.9, //iphone X - 340
        MediaQuery.of(c).size.height * 0.07, //iphone X - 60
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('총 금액',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromRGBO(33, 33, 31, 1.0)),
                textAlign: TextAlign.center),
            Text(toLocaleString(widget.cost) + '원',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromRGBO(218, 155, 104, 1.0)),
                textAlign: TextAlign.center),
          ],
        ),
        true);
  }

  Widget bottomCard(BuildContext c) {
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
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 30, right: 20),
                    width: MediaQuery.of(c).size.width * 0.45, // iphone X - 170
                    height: MediaQuery.of(c).size.height * 0.07, //iphone X - 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      color: darkblue,
                    ),
                    child: Text('장바구니담기',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                        textAlign: TextAlign.center),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    final snackBar = SnackBar(content: Text("Tap"));

                    Scaffold.of(c).showSnackBar(snackBar);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 20, right: 30),
                    width: MediaQuery.of(c).size.width * 0.45, // iphone X - 170
                    height: MediaQuery.of(c).size.height * 0.07, //iphone X - 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: orange,
                    ),
                    child: Text('바로결제및주문',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                        textAlign: TextAlign.center),
                  ),
                )
              ],
            ),
            false));
  }
}
