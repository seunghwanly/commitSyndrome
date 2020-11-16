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
        margin: EdgeInsets.only(
          top: 20,
        ),
        decoration: customBoxDecoration(),
        child: Column(children: [
          Expanded(
            flex: 1,
            child: Container(
                alignment: Alignment.center,
                child: datePicker(context, setDate, selectedDate)),
          ),
          Expanded(
            flex: 8,
            child: Row(
              children: [
                itemWithIcon(
                    context, 'A', "보자보자어디보자", 12900, 2, handleOnPressed),
                itemWithIcon(
                    context, 'B', "보자보자어디보자", 12900, 1, handleOnPressed),
                itemWithIcon(
                    context, 'C', "보자보자어디보자", 12900, 3, handleOnPressed),
              ],
            ),
          )
        ]));
  }
}

Widget itemWithIcon(BuildContext context, String menuTitle, String menuDesc,
    int menuCost, int rank, Function onPress) {
  String imagePath = '';
  if (rank == 2)
    imagePath = imagePath + '_silver';
  else if (rank == 3) imagePath = imagePath + '_brown';

  return Expanded(
    flex: 3,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Image(image: AssetImage('images/icon/crown${imagePath}.png')),
        ),
        Expanded(
            flex: 8,
            child: customBoxContainer(
                MediaQuery.of(context).size.width / 6,
                MediaQuery.of(context).size.height / 3,
                Column(children: [
                  Expanded(
                    flex: 4,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/${menuTitle}.png'),
                      radius: 40,
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            menuTitle,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: darkblue),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            menuDesc,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, color: lightgrey),
                            textAlign: TextAlign.center,
                          ),
                          Text(toLocaleString(menuCost) + " 원",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, color: darkblue),
                              textAlign: TextAlign.center),
                        ],
                      )),
                  Expanded(
                    flex: 2,
                    child: FlatButton(
                      onPressed: onPress,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: orange,
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
                  ),
                ]),
                true))
      ],
    ),
  );
}
