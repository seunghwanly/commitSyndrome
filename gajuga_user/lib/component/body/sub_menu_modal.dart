import 'package:flutter/material.dart';
import '../../util/to_text.dart';
import '../../util/palette.dart';
import '../../util/custom_check_box.dart';
import '../../util/to_locale.dart';

class SubMenuModal extends StatefulWidget {
  final option1, option2;

  SubMenuModal({@required this.option1, @required this.option2});

  @override
  SubMenuModalState createState() => SubMenuModalState();
}

class SubMenuModalState extends State<SubMenuModal> {
  bool checkedOption1 = false;
  bool checkedOption2 = false;

  Container customRow(
      String optionDesc, String optionDesc2, bool option1, int cost) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomCheckbox(
                  isChecked: checkedOption1,
                  iconSize: 20.0,
                  size: 30.0,
                  selectedColor: orange,
                  selectedIconColor: white),
              Row(
                children: [
                  Text(
                    optionDesc,
                    style: TextStyle(
                        color: darkblue,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "  " + optionDesc2,
                    style: TextStyle(
                        color: darkgrey,
                        fontSize: 10,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
          Text(
            "+" + toLocaleString(cost) + "원",
            style: TextStyle(
                color: darkblue, fontSize: 14, fontWeight: FontWeight.w600),
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }

  Column selectSize() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(top:5, bottom:5),
          child: Text("옵션1에대한선택", style: TextStyle(color: darkblue)),
        ),
        customRow("옵션1", "option1", checkedOption1, 300),
        customRow("옵션2", "option2", checkedOption2, 800),
      ],
    );
  }

  Column selectCrust() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(top:5, bottom:5),
          child: Text("옵션2에대한선택", style: TextStyle(color: darkblue)),
        ),
        customRow("옵션1", "option1", checkedOption1, 300),
        customRow("옵션2", "option2", checkedOption2, 800),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 360,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(30),
                  topRight: const Radius.circular(30))),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  makeText("추가사항", darkblue, 0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: lightgrey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Image(
                      image: AssetImage('images/icon/close.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  )
                ],
              ),
              Divider(),
              selectSize(),
              Divider(),
              selectCrust()
            ],
          ),
        ));
  }
}

Future showSubMenuModal(BuildContext c, final option1, final option2) {
  return showModalBottomSheet(
    context: c,
    builder: (BuildContext context) {
      return SubMenuModal(option1: option1, option2: option2);
    },
    backgroundColor: Color(0x00000000),
  );
}
