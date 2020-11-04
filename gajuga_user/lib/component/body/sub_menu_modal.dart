import 'package:flutter/material.dart';
import '../../util/to_text.dart';
import '../../util/palette.dart';
import '../../util/custom_check_box.dart';
import '../../util/to_locale.dart';
import '../../model/option_model.dart';

class SubMenuModal extends StatefulWidget {
  final option1, option2;

  SubMenuModal({this.option1, this.option2});

  @override
  SubMenuModalState createState() => SubMenuModalState();
}

class SubMenuModalState extends State<SubMenuModal> {
  final contentSize = {
    "category": "SIZE/사이즈 선택",
    "sub": [
      {"name": "레귤러", "eng_name": "regular", "detail": "13inch", "cost": 0},
      {"name": "라지", "eng_name": "large", "detail": "17inch", "cost": 4000}
    ]
  };

  final contentDough = {
    "category": "DOUGH/도우 선택",
    'sub': [
      {'name': "기본", 'eng_name': "standard", 'detail': '', 'cost': 0},
      {'name': "치즈", 'eng_name': "cheese", 'detail': '', 'cost': 2000},
      {'name': "고구마", 'eng_name': "sweet potato", 'detail': '', 'cost': 2000},
    ]
  };

  var checkedOption = [false, false];

  Container customRow(String optionDesc, String optionDesc2, bool option,
      int cost, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      height: MediaQuery.of(context).size.height * 0.04,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomCheckbox(
                  isChecked: option,
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

  // Column selectSize() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     crossAxisAlignment: CrossAxisAlignment.stretch,
  //     children: [
  //       Container(
  //         margin: EdgeInsets.only(top: 5, bottom: 5),
  //         child: Text("옵션1에대한선택", style: TextStyle(color: darkblue)),
  //       ),
  //       customRow("옵션1", "option1", checkedOption1, 300),
  //       customRow("옵션2", "option2", checkedOption2, 800),
  //     ],
  //   );
  // }

  // Column selectCrust() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     crossAxisAlignment: CrossAxisAlignment.stretch,
  //     children: [
  //       Container(
  //         margin: EdgeInsets.only(top: 5, bottom: 5),
  //         child: Text("옵션2에대한선택", style: TextStyle(color: darkblue)),
  //       ),
  //       customRow("옵션1", "option1", checkedOption1, 300),
  //       customRow("옵션2", "option2", checkedOption2, 800),
  //     ],
  //   );
  // }

  Container listOption(final option, BuildContext context, int optionNum) {
    var opt = Option.fromJson(option);
    List<Sub> subOpt = opt.sub;

    return Container(
        alignment: Alignment.center,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 25,
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: Text(opt.category, style: TextStyle(color: darkblue)),
            ),
            new ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: subOpt.length,
              itemBuilder: (BuildContext context, int index) {
                return customRow(
                      subOpt[index].name + ' / ' + subOpt[index].eng_name,
                      subOpt[index].detail,
                      checkedOption[optionNum],
                      subOpt[index].cost,
                      context);
              },
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
        // height: MediaQuery.of(context).size.height * 0.9,
        child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(30),
              topRight: const Radius.circular(30))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          listOption(contentSize, context, 0),
          Divider(),
          listOption(contentDough, context, 1),
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
