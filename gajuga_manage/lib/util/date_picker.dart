import 'package:flutter/material.dart';
//date picker
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

customDatePicker(BuildContext c) {
  return showRoundedDatePicker(
      context: c,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      textActionButton: "달력이지롱",
      textPositiveButton: "확인",
      textNegativeButton: "닫기",
      height: 150,
      borderRadius: 30,
      // theme: ThemeData(primarySwatch: Colors.white),
      imageHeader: AssetImage('images/A.png'),
      styleDatePicker: MaterialRoundedDatePickerStyle(
        textStyleDayButton: TextStyle(fontSize: 36, color: Colors.white),
        textStyleYearButton: TextStyle(
          fontSize: 52,
          color: Colors.white,
        ),
        textStyleDayHeader: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
        textStyleCurrentDayOnCalendar: TextStyle(
            fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
        textStyleDayOnCalendar: TextStyle(fontSize: 28, color: Colors.white),
        textStyleDayOnCalendarSelected: TextStyle(
            fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
        textStyleDayOnCalendarDisabled:
            TextStyle(fontSize: 28, color: Colors.white.withOpacity(0.1)),
        textStyleMonthYearHeader: TextStyle(
            fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
        paddingDatePicker: EdgeInsets.all(0),
        paddingMonthHeader: EdgeInsets.all(32),
        paddingActionBar: EdgeInsets.all(16),
        paddingDateYearHeader: EdgeInsets.all(32),
        sizeArrow: 50,
        colorArrowNext: Colors.white,
        colorArrowPrevious: Colors.white,
        marginLeftArrowPrevious: 16,
        marginTopArrowPrevious: 16,
        marginTopArrowNext: 16,
        marginRightArrowNext: 32,
        textStyleButtonAction: TextStyle(fontSize: 28, color: Colors.white),
        textStyleButtonPositive: TextStyle(
            fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
        textStyleButtonNegative:
            TextStyle(fontSize: 28, color: Colors.white.withOpacity(0.5)),
        decorationDateSelected:
            BoxDecoration(color: Colors.orange[600], shape: BoxShape.circle),
        backgroundPicker: Colors.deepPurple[400],
        backgroundActionBar: Colors.deepPurple[300],
        backgroundHeaderMonth: Colors.deepPurple[300],
      ),
      styleYearPicker: MaterialRoundedYearPickerStyle(
        textStyleYear: TextStyle(fontSize: 40, color: Colors.white),
        textStyleYearSelected: TextStyle(
            fontSize: 56, color: Colors.white, fontWeight: FontWeight.bold),
        heightYearRow: 100,
        backgroundPicker: Colors.deepPurple[400],
      ));
}
