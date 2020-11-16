import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/sales/expense_list.dart';
import 'package:gajuga_manage/component/body/sales/profit_list.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_text.dart';
import 'package:intl/intl.dart';

class SalesNetProfit extends StatefulWidget {
  SalesNetProfit();

  @override
  _SalesNetProfitState createState() => _SalesNetProfitState();
}

class _SalesNetProfitState extends State<SalesNetProfit> {
  final DateFormat formatter = DateFormat('yyyy년 MM월');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flex(
                direction: Axis.horizontal,
                children: [
                  Text(
                    '${formatter.format(DateTime.now())}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: orange,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down, size: 30),
                ],
              ),
              Text(
                '순이익 분석',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  print('add');
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.add_circle,
                    color: orange,
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfitList(),
              ExpenseList(),
            ],
          ),
        ],
      ),
    );
  }
}
