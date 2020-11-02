import 'package:flutter/material.dart';
import './palette.dart';
import './box_shadow.dart';

class CustomCheckbox extends StatefulWidget {
  final bool isChecked;
  final double size;
  final double iconSize;
  final Color selectedColor;
  final Color selectedIconColor;

  CustomCheckbox({this.isChecked, this.size, this.iconSize, this.selectedColor, this.selectedIconColor});

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {

  bool _isSelected = false;

  @override
  void initState() {
    _isSelected = widget.isChecked ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: _isSelected ? widget.selectedColor ?? orange : white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [ customeBoxShadow() ]
        ),
        width: widget.size ?? 30,
        height: widget.size ?? 30,
        margin: EdgeInsets.only(left:15, right:10),
        child: _isSelected ? Icon(
          Icons.check,
          color: widget.selectedIconColor ?? Colors.white,
          size: widget.iconSize ?? 20,
        ) : null,
      ),
    );
  }
}