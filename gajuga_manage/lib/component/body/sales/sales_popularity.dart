import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/sales/sales_calculate.dart';
import 'package:gajuga_manage/util/box_shadow.dart';
import 'package:gajuga_manage/util/firebase_method.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_locale.dart';
// date picker
import '../../../util/date_picker.dart';

class SalesPopularity extends StatefulWidget {
  SalesPopularity();

  @override
  _SalesPopularityState createState() => _SalesPopularityState();
}

class _SalesPopularityState extends State<SalesPopularity> {
  // set State DateTime :- datePicker
  DateTime selectedDate;
  //firebase
  var salesDatabaseFetched;
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

  bool showFirstSales = false;
  bool showSecondSales = false;
  bool showThirdSales = false;

  void handleOnPressed(int index) {
    switch (index) {
      case 1:
        setState(() {
          showFirstSales = !showFirstSales;
        });
        break;
      case 2:
        setState(() {
          showSecondSales = !showSecondSales;
        });
        break;
      case 3:
        setState(() {
          showThirdSales = !showThirdSales;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 20.0),
      margin: EdgeInsets.only(top: 20, bottom: 20),
      decoration: customBoxDecoration(),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              child: datePicker(context, setDate, selectedDate),
            ),
          ),
          Expanded(
            flex: 8,
            child: FutureBuilder(
              future: salesDatabaseFetched,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  // data length
                  int ggz = 0;
                  int ptt = 0;
                  int ppr = 0;
                  int bgg = 0;

                  Map<String, double> todayData = {
                    "고르곤졸라피자": 0,
                    "포테이토피자": 0,
                    "페퍼로니피자": 0,
                    "불고기피자": 0
                  };

                  //data
                  Map<String, dynamic> menuData =
                      new Map<String, dynamic>.from(snapshot.data);

                  // check info is in the data
                  if (DateTime.parse(menuData.keys.last)
                              .compareTo(selectedDate) <=
                          0 &&
                      selectedDate.compareTo(DateTime.now()) <= 0) {
                    var calculatedResult =
                        calculateSales(menuData, selectedDate);
                    double totalCount = 0;

                    calculatedResult.forEach((key, value) {
                      totalCount += value.toDouble();
                    });

                    todayData['고르곤졸라피자'] =
                        calculatedResult['고르곤졸라피자'].toDouble() *
                            100 /
                            totalCount;
                    todayData['포테이토피자'] =
                        calculatedResult['포테이토피자'].toDouble() *
                            100 /
                            totalCount;
                    todayData['페퍼로니피자'] =
                        calculatedResult['페퍼로니피자'].toDouble() *
                            100 /
                            totalCount;
                    todayData['불고기피자'] =
                        calculatedResult['불고기피자'].toDouble() * 100 / totalCount;

                    var newMap = Map.fromEntries(todayData.entries.toList()
                      ..sort((e1, e2) => (e1.value).compareTo(e2.value)));

                    String changeImage(String name) {
                      switch (name) {
                        case '고르곤졸라피자':
                          return 'gorgonzola';
                        case '포테이토피자':
                          return 'potato';
                        case '페퍼로니피자':
                          return 'pepperoni';
                        case '불고기피자':
                          return 'bulgogi';
                        default:
                          return "A";
                      }
                    }

                    return Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          itemWithIcon(
                              context,
                              changeImage(newMap.entries.elementAt(2).key),
                              newMap.entries.elementAt(2).key,
                              "두 번째로 가장 많이 팔린 메뉴입니다.",
                              showSecondSales? calculatedResult[newMap.entries.elementAt(2).key] * 12900 : 12900,
                              2,
                              handleOnPressed),
                          itemWithIcon(
                              context,
                              changeImage(newMap.entries.elementAt(3).key),
                              newMap.entries.elementAt(3).key,
                              "첫 번째로 가장 많이 팔린 메뉴입니다.",
                              showFirstSales? calculatedResult[newMap.entries.elementAt(3).key] * 12900 : 12900,
                              1,
                              handleOnPressed),
                          itemWithIcon(
                              context,
                              changeImage(newMap.entries.elementAt(1).key),
                              newMap.entries.elementAt(2).key,
                              "세 번째로 가장 많이 팔린 메뉴입니다.",
                              showThirdSales? calculatedResult[newMap.entries.elementAt(1).key] * 12900 : 12900,
                              3,
                              handleOnPressed),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                        child: Text(
                            '${selectedDate.toString().substring(0, 10)} 에 데이터가 존재하지 않습니다.'));
                  }
                }
                return Center(
                  child: Text(
                      '${selectedDate.toString().substring(0, 10)} 에 데이터가 존재하지 않습니다.'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget itemWithIcon(BuildContext context, String menuTitle, String korTitle, String menuDesc,
    int menuCost, int rank, Function onPress) {
  String imagePath = '';
  if (rank == 2)
    imagePath = imagePath + '_silver';
  else if (rank == 3) imagePath = imagePath + '_brown';

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image(image: AssetImage('images/icon/crown${imagePath}.png')),
      customBoxContainer(
          MediaQuery.of(context).size.width / 3.5,
          MediaQuery.of(context).size.height / 2,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/${menuTitle}.png'),
                radius: 80,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    korTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: darkblue,
                      fontSize: 18
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    menuDesc,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: lightgrey,
                      fontSize: 14
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    toLocaleString(menuCost) + " 원",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: darkblue,
                      fontSize: 18
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              FlatButton(
                onPressed: () => onPress(rank),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: orange,
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Text(
                  "누적판매량보기",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          true),
    ],
  );
}
