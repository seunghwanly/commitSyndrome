import 'package:flutter/material.dart';
import 'package:gajuga_user/model/option_model.dart';
import './palette.dart';
import './box_shadow.dart';
import '../util/to_locale.dart';

class CustomCheckboxGroup extends StatefulWidget {
  final List<Sub> optionList;
  final double size;
  final double iconSize;
  final Color selectedColor;
  final Color selectedIconColor;

  CustomCheckboxGroup(
      {this.optionList,
      this.size,
      this.iconSize,
      this.selectedColor,
      this.selectedIconColor});

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckboxGroup> {
  List<bool> _isSelectedList;
  int selectedAfterIndex = -1;

  @override
  void initState() {
    _isSelectedList = new List<bool>.filled(widget.optionList.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.optionList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            height: MediaQuery.of(context).size.height * 0.04,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedAfterIndex == -1) {
                            // selected nothing
                            selectedAfterIndex = index;
                            _isSelectedList[selectedAfterIndex] =
                                !_isSelectedList[selectedAfterIndex];
                          } else {
                            if (selectedAfterIndex == index) {
                              // same thing : true -> false
                              _isSelectedList[selectedAfterIndex] =
                                  !_isSelectedList[selectedAfterIndex];
                            } else {
                              // another index : prev -> false , new -> true
                              if (selectedAfterIndex != index) {
                                // 다른애를 취소해야되는데...
                                _isSelectedList[selectedAfterIndex] =
                                    !_isSelectedList[selectedAfterIndex];
                                selectedAfterIndex = index;
                                _isSelectedList[selectedAfterIndex] =
                                    !_isSelectedList[selectedAfterIndex];
                              }
                            }
                          }
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        decoration: BoxDecoration(
                            color: _isSelectedList[index]
                                ? widget.selectedColor ?? orange
                                : white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [customeBoxShadow()]),
                        width: widget.size ?? 30,
                        height: widget.size ?? 30,
                        margin: EdgeInsets.only(left: 15, right: 10),
                        child: _isSelectedList[index]
                            ? Icon(
                                Icons.check,
                                color: widget.selectedIconColor ?? Colors.white,
                                size: widget.iconSize ?? 20,
                              )
                            : null,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          widget.optionList[index].name +
                              ' / ' +
                              widget.optionList[index].eng_name,
                          style: TextStyle(
                              color: darkblue,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "  " + widget.optionList[index].detail,
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
                  "+" + toLocaleString(widget.optionList[index].cost) + "원",
                  style: TextStyle(
                      color: darkblue,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.end,
                )
              ],
            ),
          );
        });
  }
}
