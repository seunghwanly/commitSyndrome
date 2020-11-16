import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/box_shadow.dart';
import 'package:gajuga_manage/util/palette.dart';
//pie chart
import 'package:pie_chart/pie_chart.dart';

//date picker
import '../../../util/date_picker.dart';

class SalesByMenu extends StatefulWidget {
  SalesByMenu();

  @override
  _SalesByMenuState createState() => _SalesByMenuState();
}

class _SalesByMenuState extends State<SalesByMenu> {
  DateTime selectedDate;

  //PIE CHART ELEMENTS
  Map<String, double> todayData = {
    "고르곤졸라피자": 3,
    "포테이토피자": 2,
    "페퍼로니피자": 5,
    "불고기피자": 5
  };

  List<Color> todayDataColor = [
    Color.fromRGBO(4, 157, 217, 1.0),
    Color.fromRGBO(3, 101, 140, 1.0),
    Color.fromRGBO(242, 194, 48, 1.0),
    Color.fromRGBO(122, 191, 111, 1.0)
  ];

  // LIFE CYCLE
  @override
  void initState() {
    super.initState();
    selectedDate = new DateTime.now();
  }

  void setDate(DateTime newDate) {
    setState(() {
      selectedDate = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        top: 20,
      ),
      decoration: customBoxDecoration(),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              alignment: Alignment.center,
              child: datePicker(context, setDate, selectedDate),
            ),
          ),
          Expanded(
            flex: 8,
            child: Row(
              //------------------------------------------------- PIE CHART & DESC
              children: [
                Expanded(
                  //------------------------------------------------- PIE CHART
                  flex: 6,
                    child: PieChart(
                      dataMap: todayData,
                      colorList: todayDataColor,
                    ),
                  ),
                  Expanded(
                    //------------------------------------------------- DESC for 1st
                    flex: 4,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('images/A.png'),
                            radius: 100,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 5,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '오늘은 ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: '${todayData.keys.first}',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                                TextSpan(
                                  text: '가 제일 많은 판매량을 기록했네요 !\n오늘 매출은 ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: '${5000}',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                                TextSpan(
                                  text: '원 입니다 ! 분발해주세요 !',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
