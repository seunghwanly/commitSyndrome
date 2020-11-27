import 'package:flutter/material.dart';
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

  void handleOnPressed() {}

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
                  if (menuData.keys.contains(
                      "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}")) {
                    menuData.forEach((key, value) {
                      if (key ==
                          "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}") {
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

                    //sort
                    //rank
                    double max = 0.0;
                    String firstRank = '';
                    String firstRankImage = '';

                    var newMap = Map.fromEntries(todayData.entries.toList()
                      ..sort((e1, e2) => (e1.value).compareTo(e2.value)));

                    print(newMap.entries.elementAt(3).key);

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
                          itemWithIcon(context, changeImage(newMap.entries.elementAt(2).key), "두 번째로 가장 많이 팔린 메뉴입니다.", 12900, 2,
                              handleOnPressed),
                          itemWithIcon(context, changeImage(newMap.entries.elementAt(3).key), "첫 번째로 가장 많이 팔린 메뉴입니다.", 12900, 1,
                              handleOnPressed),
                          itemWithIcon(context, changeImage(newMap.entries.elementAt(1).key), "세 번째로 가장 많이 팔린 메뉴입니다.", 12900, 3,
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

Widget itemWithIcon(BuildContext context, String menuTitle, String menuDesc,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    menuTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: darkblue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    menuDesc,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: lightgrey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    toLocaleString(menuCost) + " 원",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: darkblue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              FlatButton(
                onPressed: onPress,
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
