import 'dart:math';
import 'dart:ui';

import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/box_shadow.dart';
import 'package:gajuga_manage/util/palette.dart';

class SalesByMenu extends StatefulWidget {
  SalesByMenu();

  @override
  _SalesByMenuState createState() => _SalesByMenuState();
}

class _SalesByMenuState extends State<SalesByMenu> {
  List<String> month = [
    "1월",
    "2월",
    "3월",
    "4월",
    "5월",
    "6월",
    "7월",
    "8월",
    "9월",
    "10월",
    "11월",
    "12월"
  ];

  double handleMissingData(DateTime dateTime) {
    return (Random().nextDouble() * 100).roundToDouble();
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
      child: BezierChart(
        bezierChartScale: BezierChartScale.MONTHLY,
        fromDate: DateTime(2020, 01, 01),
        toDate: DateTime.now(),
        selectedDate: DateTime.now(),
        series: [
          BezierLine(
            label: "고르곤졸라 피자",
            lineColor: Color.fromRGBO(242, 230, 65, 1.0),
            onMissingValue: handleMissingData,
            data: [
              DataPoint<DateTime>(value: 10, xAxis: DateTime(2020, 01, 01)),
              DataPoint<DateTime>(value: 50, xAxis: DateTime(2020, 02, 01)),
              DataPoint<DateTime>(value: 20, xAxis: DateTime(2020, 03, 01)),
              DataPoint<DateTime>(value: 80, xAxis: DateTime(2020, 04, 01)),
              DataPoint<DateTime>(value: 14, xAxis: DateTime(2020, 05, 01)),
              DataPoint<DateTime>(value: 30, xAxis: DateTime(2020, 06, 01)),
            ],
          ),
          BezierLine(
            label: "포테이토 피자",
            lineColor: Color.fromRGBO(3, 120, 166, 1.0),
            onMissingValue: handleMissingData,
            data: [
              DataPoint<DateTime>(value: 100, xAxis: DateTime(2020, 01, 01)),
              DataPoint<DateTime>(value: 70, xAxis: DateTime(2020, 02, 01)),
              DataPoint<DateTime>(value: 50, xAxis: DateTime(2020, 03, 01)),
              DataPoint<DateTime>(value: 10, xAxis: DateTime(2020, 04, 01)),
              DataPoint<DateTime>(value: 14, xAxis: DateTime(2020, 05, 01)),
              DataPoint<DateTime>(value: 60, xAxis: DateTime(2020, 06, 01)),
            ],
          ),
          BezierLine(
            label: "페퍼로니 피자",
            lineColor: Color.fromRGBO(242, 135, 41, 1.0),
            onMissingValue: handleMissingData,
            data: [
              DataPoint<DateTime>(value: 12, xAxis: DateTime(2020, 01, 01)),
              DataPoint<DateTime>(value: 59, xAxis: DateTime(2020, 02, 01)),
              DataPoint<DateTime>(value: 25, xAxis: DateTime(2020, 03, 01)),
              DataPoint<DateTime>(value: 80, xAxis: DateTime(2020, 04, 01)),
              DataPoint<DateTime>(value: 33, xAxis: DateTime(2020, 05, 01)),
              DataPoint<DateTime>(value: 86, xAxis: DateTime(2020, 06, 01)),
            ],
          ),
          BezierLine(
            label: "불고기 피자",
            lineColor: darkblue,
            onMissingValue: handleMissingData,
            data: [
              DataPoint<DateTime>(value: 60, xAxis: DateTime(2020, 01, 01)),
              DataPoint<DateTime>(value: 50, xAxis: DateTime(2020, 02, 01)),
              DataPoint<DateTime>(value: 20, xAxis: DateTime(2020, 03, 01)),
              DataPoint<DateTime>(value: 20, xAxis: DateTime(2020, 04, 01)),
              DataPoint<DateTime>(value: 34, xAxis: DateTime(2020, 05, 01)),
              DataPoint<DateTime>(value: 37, xAxis: DateTime(2020, 06, 01)),
            ],
          ),
        ],
        config: BezierChartConfig(
            showVerticalIndicator: true,
            verticalIndicatorStrokeWidth: 2.0,
            verticalIndicatorColor: orange,
            verticalIndicatorFixedPosition: false,
            contentWidth: MediaQuery.of(context).size.width,
            footerHeight: 50.0,
            xAxisTextStyle: TextStyle(color: darkblue),
            updatePositionOnTap: true),
      ),
    );
  }
}
