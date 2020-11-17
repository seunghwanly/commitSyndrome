import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/sales/expense_list.dart';
import 'package:gajuga_manage/component/body/sales/profit_list.dart';
import 'package:gajuga_manage/util/borders.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_text.dart';
import 'dart:ui';
import 'package:intl/intl.dart';

class Choice {
  int id;
  String value;
 
  Choice({this.id, this.value});
}

class SalesNetProfit extends StatefulWidget {
  SalesNetProfit();

  @override
  _SalesNetProfitState createState() => _SalesNetProfitState();
}

class _SalesNetProfitState extends State<SalesNetProfit> {
  List<Choice> _choices =[
    Choice(id: 1, value: '영업수익'),
    Choice(id: 2, value: '영업비용'),
  ];

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final DateFormat formatter = DateFormat('yyyy년 MM월');
  int _radioValue = -1;

  void _dataUpdated() {
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("매출 정보 입력이 완료되었습니다.")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
        child: SingleChildScrollView(
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
                      showModal();
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
        ),
      ),
    );
  }

  showModal() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 16.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: white,
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 2.5,
            padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                makeTitleSize('YYYY년 mm월', ' 매출관리', 10, 20, false),
                Column(
                  children: [
                    choiceField(),
                    nameField(),
                    amountField(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 12,
                        height: MediaQuery.of(context).size.height / 20,
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: pale,
                        ),
                        child: Text(
                          '취소',
                          style: TextStyle(
                            color: darkgrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        _dataUpdated();
                        _radioValue = -1;
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 12,
                        height: MediaQuery.of(context).size.height / 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: orange,
                        ),
                        child: Text(
                          '확인',
                          style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget choiceField() {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Row(
          children: [
            Text(
              '분       류',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Flexible(
              child: Row(
                children: [
                  FlatButton.icon(
                    label: Text('영업수익'),
                    icon: Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: (int value){
                        setState(() {
                          _radioValue = value;
                          print(_radioValue);
                        });
                      },
                      activeColor: orange,
                    ),
                    onPressed: () {
                      setState(() {
                        _radioValue = 0;
                      });
                    },
                  ),
                  FlatButton.icon(
                    label: Text('영업비용'),
                    icon: Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: (int value){
                        setState(() {
                          _radioValue = value;
                          print(_radioValue);
                        });
                      },
                      activeColor: orange,
                    ),
                    onPressed: () {
                      setState(() {
                        _radioValue = 1;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      }
    );
  }

  Widget nameField() {
    return Row(
      children: [
        Text(
          '항목이름',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(
                enabledBorder: roundInputBorder,
                focusedBorder: roundInputBorder,
                hintText: '항목 이름을 입력해주세요...',
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget amountField() {
    return Row(
      children: [
        Text(
          '금       액',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                enabledBorder: roundInputBorder,
                focusedBorder: roundInputBorder,
                hintText: '금액을 입력해주세요...',
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
