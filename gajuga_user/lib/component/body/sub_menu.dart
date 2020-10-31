import 'package:flutter/material.dart';
import '../header/custom_header.dart';
import '../../util/box_shadow.dart';
import '../../util/box_button.dart';
import '../../util/locale.dart';
import '../../util/title.dart';

class SubmenuScreen extends StatefulWidget {
  final item, cost;

  SubmenuScreen({@required this.item, @required this.cost});

  @override
  SubmenuScreenState createState() => SubmenuScreenState();
}

class SubmenuScreenState extends State<SubmenuScreen> {
  int count = 1;

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
  Widget build(BuildContext context) {
    return CustomHeader(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        makeTitle('세부', ' 메뉴'),
        imageCard(),
        countCard(),
        optionCard(),
        totalCostCard(),
        bottomCard()
      ],
    ));
  }

  Widget imageCard() {
    return customBoxContainer(
        340,
        340,
        Column(
          children: [
            Container(
              child: Container(
                width: 340,
                height: 220,
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
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(widget.item,
                        style: TextStyle(
                            color: Color.fromRGBO(33, 33, 31, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                  Text("이것은 메뉴 ${widget.item} 에 대한 설명입니다. 어쩌구 저쩌구 최은만 진짜 싫다..",
                      style: TextStyle(
                          color: Color.fromRGBO(119, 119, 119, 1.0),
                          fontWeight: FontWeight.normal,
                          fontSize: 14))
                ],
              ),
            )
          ],
        ),
        false);
  }

  Widget countCard() {
    return customBoxContainer(
        340,
        60,
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
                    color: Color.fromRGBO(33, 33, 31, 1.0))),
            GestureDetector(
              child: plusButton(30),
              onTap: () => handleCount(true),
            )
          ],
        ),
        true);
  }

  Widget optionCard() {
    return GestureDetector(
      onTap: () {
        Scaffold.of(this.context).showSnackBar(new SnackBar(
          content: Text('준비중입니다... :)'),
        ));
      },
      child: customBoxContainer(
          340,
          80,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('추가사항',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(33, 33, 31, 1.0)),
                  textAlign: TextAlign.center),
              Text('>',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color.fromRGBO(33, 33, 31, 1.0)),
                  textAlign: TextAlign.center),
            ],
          ),
          true),
    );
  }

  Widget totalCostCard() {
    return customBoxContainer(
        340,
        60,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('총 금액',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromRGBO(33, 33, 31, 1.0)),
                textAlign: TextAlign.center),
            Text(toLocaleString(widget.cost) + '원',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromRGBO(218, 155, 104, 1.0)),
                textAlign: TextAlign.center),
          ],
        ),
        true);
  }

  Widget bottomCard() {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: customBoxContainer(
            340,
            60,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 40, right: 20),
                    width: 170,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      color: Color.fromRGBO(33, 33, 31, 1.0),
                    ),
                    child: Text('장바구니담기',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                        textAlign: TextAlign.center),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    final snackBar = SnackBar(content: Text("Tap"));

                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 20, right: 40),
                    width: 170,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: Color.fromRGBO(218, 155, 104, 1.0),
                    ),
                    child: Text('바로결제 및 주문',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                        textAlign: TextAlign.center),
                  ),
                )
              ],
            ),
            false));
  }
}
