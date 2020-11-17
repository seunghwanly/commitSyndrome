import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/box_shadow.dart';
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
            child: Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  itemWithIcon(context, 'A', "보자보자어디보자", 12900, 2, handleOnPressed),
                  itemWithIcon(context, 'B', "보자보자어디보자", 12900, 1, handleOnPressed),
                  itemWithIcon(context, 'C', "보자보자어디보자", 12900, 3, handleOnPressed),
                ],
              ),
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
  if (rank == 2) imagePath = imagePath + '_silver';
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
