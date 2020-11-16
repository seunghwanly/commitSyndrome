import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/main_container.dart';
import 'package:gajuga_manage/component/body/sales/sales_by_menu.dart';
import 'package:gajuga_manage/component/body/sales/sales_net_profit.dart';
import 'package:gajuga_manage/component/body/sales/sales_popularity.dart';
import 'package:gajuga_manage/util/box_button.dart';
import 'package:gajuga_manage/util/palette.dart';


class SalesPage extends StatefulWidget {
  @override
  _SalesPageState createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  int pageIndex = 0;

  void handlePage(int goto) {
    setState(() {
      pageIndex = goto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              tapButton(
                  () => handlePage(0),
                  this.pageIndex == 0 ? orange : darkblue,
                  orange,
                  "메뉴별 매출분석",
                  white,
                  20.0,
                  MediaQuery.of(context).size.width * 0.2,
                  MediaQuery.of(context).size.width * 0.05,
                  MediaQuery.of(context).size.height * 0.01,
                  MediaQuery.of(context).size.width * 0.01,
                  0.0),
              tapButton(
                  () => handlePage(1),
                  this.pageIndex == 1 ? orange : darkblue,
                  orange,
                  "순이익 분석",
                  white,
                  20.0,
                  MediaQuery.of(context).size.width * 0.2,
                  MediaQuery.of(context).size.width * 0.05,
                  MediaQuery.of(context).size.height * 0.01,
                  MediaQuery.of(context).size.width * 0.01,
                  0.0),
              tapButton(
                  () => handlePage(2),
                  this.pageIndex == 2 ? orange : darkblue,
                  orange,
                  "메뉴인기도분석",
                  white,
                  20.0,
                  MediaQuery.of(context).size.width * 0.2,
                  MediaQuery.of(context).size.width * 0.05,
                  MediaQuery.of(context).size.height * 0.01,
                  MediaQuery.of(context).size.width * 0.01,
                  0.0)
            ],
          ),
        ),
        Expanded(
          flex: 9,
          child: mainBody(this.pageIndex),
        ),
      ],
    ),
    );
  }
}

Widget mainBody(int pageIndex) {
  switch (pageIndex) {
    case 0:
      return SalesByMenu();
    case 1:
      return SalesNetProfit();
    case 2:
      return SalesPopularity();
  }
}
