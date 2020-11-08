import 'package:flutter/material.dart';
import '../../util/to_text.dart';
import '../../util/palette.dart';
import '../../util/custom_check_box.dart';
import '../../util/to_locale.dart';
import '../../model/option_model.dart';

class SubMenuModal extends StatefulWidget {
  
  List<Map<String, dynamic>> parsedOptionList;
  final option1, option2;

  SubMenuModal({this.parsedOptionList, this.option1, this.option2});

  @override
  SubMenuModalState createState() => SubMenuModalState();
}

class SubMenuModalState extends State<SubMenuModal> { 

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
            CustomCheckboxGroup(
              parsedOptionList: widget.parsedOptionList,
              category: opt.category,
              optionList: subOpt,
              size: 30,
              iconSize: 24,
              selectedColor: orange,
              selectedIconColor: white,
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
          listOption(widget.option1, context, 0),
          Divider(),
          listOption(widget.option2, context, 1),
        ],
      ),
    ));
  }
}

Future showSubMenuModal(BuildContext c, List<Map<String, dynamic>> parsedOptionList, final option1, final option2) {
  return showModalBottomSheet(
      context: c,
      builder: (BuildContext context) {
        return SubMenuModal(parsedOptionList: parsedOptionList, option1: option1, option2: option2);
      },
      backgroundColor: Color(0x00000000),
      );
}
