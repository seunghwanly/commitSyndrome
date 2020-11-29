import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/sales/expense_list.dart';
import 'package:gajuga_manage/component/body/sales/profit_list.dart';
import 'package:gajuga_manage/component/body/sales/sales_calculate.dart';
import 'package:gajuga_manage/util/borders.dart';
import 'package:gajuga_manage/util/date_picker.dart';
import 'package:gajuga_manage/util/firebase_method.dart';
import 'package:gajuga_manage/util/loading.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_locale.dart';
import 'package:gajuga_manage/util/to_text.dart';
import 'dart:ui';
import 'package:intl/intl.dart';
import '../../../util/firebase_method.dart';

class SalesNetProfit extends StatefulWidget {
  SalesNetProfit();

  @override
  _SalesNetProfitState createState() => _SalesNetProfitState();
}

class _SalesNetProfitState extends State<SalesNetProfit> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _selectedDateString = DateFormat('yyyy년 MM월').format(DateTime.now());
  DateTime selectedDate;

  // radioValue & Form
  int _radioValue = -1;
  TextEditingController addedDesc = new TextEditingController();
  TextEditingController addedAmount = new TextEditingController();

  //firebase reference
  // read 3 buckets !
  Future<dynamic> totalSales;
  Future<dynamic> totalProfit;
  Future<dynamic> totalExpense;

  // //Stream Controller
  // StreamController _streamController;

  // // change to realtime data
  // var totalSalesReference = FirebaseMethod().salesReference;
  // var totalProfitReference = FirebaseMethod().profitReference;
  // var totalExpenseReference = FirebaseMethod().expenseReference;
  // // data to save
  // var menuData;
  // var profitData;
  // var expenseData;

  @override
  void initState() {
    super.initState();
    selectedDate = new DateTime.now();
    //firebase
    // get data
    totalExpense = FirebaseMethod().getTotalExpenseData();
    totalSales = FirebaseMethod().getTotalSalesData();
    totalProfit = FirebaseMethod().getTotalProfitData();
    // order
    FirebaseMethod().orderReference.onChildAdded.listen((event) {
      totalSales = FirebaseMethod().getTotalSalesData();
      setState(() {});
    });
    FirebaseMethod().orderReference.onChildChanged.listen((event) {
      totalSales = FirebaseMethod().getTotalSalesData();
      setState(() {});
    });
    FirebaseMethod().orderReference.onChildRemoved.listen((event) {
      totalSales = FirebaseMethod().getTotalSalesData();
      setState(() {});
    });
    // profit
    FirebaseMethod().profitReference.onChildAdded.listen((event) {
      totalProfit = FirebaseMethod().getTotalProfitData();
      setState(() {});
    });
    FirebaseMethod().profitReference.onChildChanged.listen((event) {
      totalProfit = FirebaseMethod().getTotalProfitData();
      setState(() {});
    });
    FirebaseMethod().profitReference.onChildRemoved.listen((event) {
      totalProfit = FirebaseMethod().getTotalProfitData();
      setState(() {});
    });
    // expense
    FirebaseMethod().expenseReference.onChildAdded.listen((event) {
      totalExpense = FirebaseMethod().getTotalExpenseData();
      setState(() {});
    });
    FirebaseMethod().expenseReference.onChildChanged.listen((event) {
      totalExpense = FirebaseMethod().getTotalExpenseData();
      setState(() {});
    });
    FirebaseMethod().expenseReference.onChildRemoved.listen((event) {
      totalExpense = FirebaseMethod().getTotalExpenseData();
      setState(() {});
    });

    // //init
    // _streamController = new StreamController.broadcast(onListen: () {
    //   totalProfitReference.onValue;
    //   totalSalesReference.onValue;
    //   totalExpenseReference.onValue;
    // });

    // totalProfitReference.once().then((DataSnapshot snapshot) {
    //   if(snapshot.value != null) {
    //     profitData = new Map<String, dynamic>.from(snapshot.value);
    //   } else print("profitData is null");
    // });
    // totalSalesReference.once().then((DataSnapshot snapshot) {
    //   if(snapshot.value != null) {
    //     menuData = new Map<String, dynamic>.from(snapshot.value);
    //   } else print("menuData is null");
    // });
    // totalExpenseReference.once().then((DataSnapshot snapshot) {
    //   if(snapshot.value != null) {
    //     expenseData = new Map<String, dynamic>.from(snapshot.value);
    //   } else print("expenseData is null");
    // });

    // _streamController.add(totalProfitReference.onValue);
    // _streamController.add(totalSalesReference.onValue);
    // _streamController.add(totalExpenseReference.onValue);
  }

  @override
  void dispose() {
    super.dispose();
    FirebaseMethod().orderReference.onDisconnect();
    FirebaseMethod().profitReference.onDisconnect();
    FirebaseMethod().expenseReference.onDisconnect();
  }

  void setDate(DateTime newDate) {
    setState(() {
      selectedDate = newDate;
      _selectedDateString = DateFormat('yyyy년 MM월').format(selectedDate);
    });
  }

  void _dataUpdated() {
    Scaffold.of(context)
        .showSnackBar(new SnackBar(content: new Text("매출 정보 입력이 완료되었습니다.")));
  }

  @override
  Widget build(BuildContext rootContext) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
        child: SingleChildScrollView(
          child: FutureBuilder(
              // stream: _streamController.stream,
              // // [totalProfitReference.onValue, totalSalesReference.onValue, totalExpenseReference.onValue]
              future: Future.wait([totalProfit, totalSales, totalExpense]),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print("waiting...");
                  return new Center(child: customLoadingBouncingGrid(orange));
                } else {
                  if (!snapshot.hasData) {
                    // must be not null !
                    print("no data");
                    return new Center(child: customLoadingBouncingGrid(orange));
                  } else if (snapshot.hasError) {
                    return Text("DATA FETCH ERROR !");
                  } else {
                    print("has data");
                    //profit data
                    Map<String, dynamic> profitData =
                        new Map<String, dynamic>.from(snapshot.data[0]);
                    // sales data
                    Map<String, dynamic> menuData =
                        new Map<String, dynamic>.from(snapshot.data[1]);
                    // expense data
                    Map<String, dynamic> expenseData =
                        new Map<String, dynamic>.from(snapshot.data[2]);

                    // only check this month
                    String selectedDateKey =
                        "${selectedDate.year}-${selectedDate.month}";

                    String lastYearKey = menuData.keys.last.substring(0, 4);
                    String lastMonthKey = menuData.keys.last.substring(5, 7);

                    String firstYearKey = menuData.keys.first.substring(0, 4);
                    String firstMonthKey = menuData.keys.first.substring(5, 7);

                    if (selectedDate.month.compareTo(DateTime.parse(
                                    lastYearKey + '-' + lastMonthKey + '-01')
                                .month) <=
                            0 &&
                        selectedDate.month.compareTo(DateTime.parse(
                                    firstYearKey + '-' + firstMonthKey + '-01')
                                .month) >=
                            0) {
                      // essentail
                      var totalSalesThisMonth =
                          calculateMonthSales(menuData, selectedDate);
                      // tranform to money
                      // totalSalesThisMonth.forEach((key, value) {
                      //   totalSalesThisMonth.update(key, (value) {
                      //     if (key == "사이다" || key == "콜라") {
                      //       return value * 2000;
                      //     } else
                      //       return value * 12900;
                      //   });
                      // });
                      // optional
                      // 1. profit
                      var totalProfitThisMonth;
                      //additional information added
                      if (profitData.keys.contains(selectedDateKey)) {
                        totalProfitThisMonth = profitData[selectedDateKey];
                      }
                      // 2. expense
                      var totalExpenseThisMonth;
                      //additional information added
                      if (expenseData.keys.contains(selectedDateKey)) {
                        totalExpenseThisMonth = expenseData[selectedDateKey];
                      }

                      // merge
                      var mergedProfitData = {
                        ...totalSalesThisMonth,
                        ...totalProfitThisMonth
                      };
                      // count total amount
                      int totalExpenseAmount = 0;
                      totalExpenseThisMonth.forEach((key, value) {
                        totalExpenseAmount += value;
                      });
                      int totalProfitAmount = 0;
                      mergedProfitData.forEach((key, value) {
                        totalProfitAmount += value;
                      });

                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 6,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          DateTime newDateTime =
                                              await customDatePicker(
                                                  context, selectedDate);
                                          if (newDateTime != null) {
                                            setDate(newDateTime);
                                          }
                                        },
                                        child: Flex(
                                          direction: Axis.horizontal,
                                          children: [
                                            Text(
                                              _selectedDateString,
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: orange,
                                              ),
                                            ),
                                            Icon(Icons.keyboard_arrow_down,
                                                size: 30),
                                          ],
                                        ),
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
                                  )),
                              Expanded(
                                  flex: 4,
                                  child: Text(
                                    (totalProfitAmount - totalExpenseAmount) > 0
                                        ? "+ " +
                                            toLocaleString((totalProfitAmount -
                                                    totalExpenseAmount)
                                                .abs()) +
                                            "원"
                                        : "- " +
                                            toLocaleString((totalProfitAmount -
                                                    totalExpenseAmount)
                                                .abs()) +
                                            "원",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: (totalProfitAmount -
                                                    totalExpenseAmount) >
                                                0
                                            ? Colors.green[400]
                                            : mandarin),
                                    textAlign: TextAlign.end,
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProfitList(
                                mergedProfitData: mergedProfitData,
                                selectedDate: selectedDate,
                                dataReferenceKey: selectedDateKey,
                              ),
                              ExpenseList(
                                  rangeExpenseData: totalExpenseThisMonth,
                                  selectedDate: selectedDate,
                                  dataReferenceKey: selectedDateKey),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 6,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          DateTime newDateTime =
                                              await customDatePicker(
                                                  context, selectedDate);
                                          if (newDateTime != null) {
                                            setDate(newDateTime);
                                          }
                                        },
                                        child: Flex(
                                          direction: Axis.horizontal,
                                          children: [
                                            Text(
                                              _selectedDateString,
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: orange,
                                              ),
                                            ),
                                            Icon(Icons.keyboard_arrow_down,
                                                size: 30),
                                          ],
                                        ),
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
                                  )),
                              Expanded(flex: 4, child: SizedBox())
                            ],
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 2,
                              child: Center(
                                  child: Text(
                                      "${selectedDate.year}년 ${selectedDate.month}월에는 데이터가 없습니다 !",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: darkblue))))
                        ],
                      );
                    }
                  }
                }
              }),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: white,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.8,
            height: MediaQuery.of(context).size.height / 2.5,
            padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                makeTitleSize(_selectedDateString, ' 매출관리', 10, 20, false),
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
                        _radioValue = -1;
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
                        print("onPress");
                        FirebaseMethod().addSpecificData(
                            rootKey: _radioValue == 0 ? 'profit' : 'expense',
                            parentKey:
                                "${selectedDate.year}-${selectedDate.month}",
                            name: addedDesc.text.trim(),
                            amount: int.parse(addedAmount.text.trim()));
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
                    onChanged: (int value) {
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
                    onChanged: (int value) {
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
    });
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
              controller: addedDesc,
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
              controller: addedAmount,
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
