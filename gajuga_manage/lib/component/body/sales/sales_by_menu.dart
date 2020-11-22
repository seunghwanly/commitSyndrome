import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/box_shadow.dart';
import 'package:gajuga_manage/util/firebase_method.dart';
import 'package:gajuga_manage/util/loading.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_locale.dart';
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
  //firebase
  var salesDatabaseFetched;

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
    salesDatabaseFetched = FirebaseMethod().getTotalSalesData();
  }

  void setDate(DateTime newDate) {
    setState(() {
      selectedDate = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: salesDatabaseFetched,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          //rank
          double max = 0.0;
          String firstRank = '';
          String firstRankImage = '';
          // data length
          int ggz = 0;
          int ptt = 0;
          int ppr = 0;
          int bgg = 0;

          //data
          Map<String, dynamic> menuData =
              new Map<String, dynamic>.from(snapshot.data);

          // check info is in the data
          if (menuData.keys.contains(
              "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}")) {
            menuData.forEach((key, value) {
              if (key ==
                  "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}") {
                print("is in!");
                Map<String, dynamic> orderInfo =
                    new Map<String, dynamic>.from(value);
                orderInfo.forEach((key, value) {
                  Map<String, dynamic> orderItems =
                      new Map<String, dynamic>.from(value);
                  orderItems.forEach((key, value) {
                    if (key == 'orderItems') {
                      Map<String, dynamic> items =
                          new Map<String, dynamic>.from(value);
                      items.forEach((key, value) {
                        switch (key) {
                          case "고르곤졸라피자":
                            ggz += value['count'];
                            break;
                          case "포테이토피자":
                            ptt += value['count'];
                            break;
                          case "페퍼로니피자":
                            ppr += value['count'];
                            break;
                          case "불고기피자":
                            bgg += value['count'];
                            break;
                          default:
                        }
                      });
                    }
                  });
                });
              }
            });

            todayData['고르곤졸라피자'] = ggz.toDouble();
            todayData['포테이토피자'] = ptt.toDouble();
            todayData['페퍼로니피자'] = ppr.toDouble();
            todayData['불고기피자'] = bgg.toDouble();

            todayData.forEach((key, value) {
              if (value >= max) {
                max = value;
                firstRank = key;
              }
            });

            switch (firstRank) {
              case '고르곤졸라피자':
                firstRankImage = 'gorgonzola';
                break;
              case '포테이토피자':
                firstRankImage = 'potato';
                break;
              case '페퍼로니피자':
                firstRankImage = 'pepperoni';
                break;
              case '불고기피자':
                firstRankImage = 'bulgogi';
                break;
              default:
                firstRankImage = "A";
            }

            return Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 20, bottom: 20),
              padding: EdgeInsets.only(left: 20),
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
                                  backgroundImage: AssetImage(
                                      'images/${firstRankImage}.png'),
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
                                        text: '${firstRank}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: '가 제일 많은 판매량을 기록했네요 !\n오늘 매출은 ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text:
                                            '${toLocaleString(todayData[firstRank].toInt() * 12900)}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
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
          } else {
            return Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 20, bottom: 20),
                padding: EdgeInsets.only(left: 20),
                decoration: customBoxDecoration(),
                child: Column(children: [
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
                    child: Center(child: Text('${selectedDate.toString().substring(0,10)} 에 데이터가 존재하지 않습니다.'),),
                  )
                ]));
          }
        } else {
          return Center(child: customLoadingBouncingGrid(orange));
        }
      },
    );
  }
}
