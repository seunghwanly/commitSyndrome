import 'package:flutter/material.dart';
//date picker
import 'package:flutter_rounded_date_picker/rounded_picker.dart';


import 'package:gajuga_manage/util/palette.dart';

customDatePicker(BuildContext c, DateTime fetchedDateTime) async{

  return await showRoundedDatePicker(
      context: c,
      initialDate: fetchedDateTime == null ? DateTime.now() : fetchedDateTime,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      textActionButton: "날짜 선택 후 확인을 눌러주세요",
      textPositiveButton: "확인",
      textNegativeButton: "닫기",
      // height: MediaQuery.of(c).size.height / 3,
      borderRadius: 30,
      // theme: ThemeData(primarySwatch: Colors.white),
      imageHeader: AssetImage('images/A.png'),
      //---------------------------------------------------------------------------------header
      styleDatePicker: MaterialRoundedDatePickerStyle(
        textStyleDayButton: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
        textStyleYearButton: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        textStyleDayHeader: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        //---------------------------------------------------------------------------------body
        textStyleCurrentDayOnCalendar: TextStyle(
            fontSize: 18, color: darkblue, fontWeight: FontWeight.bold),
        textStyleDayOnCalendar: TextStyle(fontSize: 18, color: darkblue),
        textStyleDayOnCalendarSelected: TextStyle(
            fontSize: 18, color: white, fontWeight: FontWeight.bold),
        textStyleDayOnCalendarDisabled:
            TextStyle(fontSize: 20, color: darkblue.withOpacity(0.1)),
        textStyleMonthYearHeader: TextStyle(
            fontSize: 18, color: darkblue, fontWeight: FontWeight.bold),
        //---------------------------------------------------------------------------------padding & margin
        paddingDatePicker: EdgeInsets.all(0),
        paddingMonthHeader: EdgeInsets.fromLTRB(20, 40, 20, 40),
        paddingActionBar: EdgeInsets.all(10),
        paddingDateYearHeader: EdgeInsets.all(20),
        marginTopArrowPrevious: 25,
        marginLeftArrowPrevious: 25,
        marginTopArrowNext: 25,
        marginRightArrowNext: 25,
        //---------------------------------------------------------------------------------header arrow
        sizeArrow: 25,
        colorArrowNext: darkblue,
        colorArrowPrevious: darkblue,
        //---------------------------------------------------------------------------------action bar
        textStyleButtonAction: TextStyle(fontSize: 16, color: lightgrey),
        textStyleButtonPositive: TextStyle(
            fontSize: 16, color: darkblue, fontWeight: FontWeight.bold),
        textStyleButtonNegative:
            TextStyle(fontSize: 16, color: darkblue.withOpacity(0.5)),
        
        //---------------------------------------------------------------------------------color    
        decorationDateSelected:
            BoxDecoration(color: orange, shape: BoxShape.circle),
        backgroundPicker: white,
        backgroundActionBar: white,
        backgroundHeaderMonth: white,
      ),      
      styleYearPicker: MaterialRoundedYearPickerStyle(
        textStyleYear: TextStyle(fontSize: 30, color: darkblue),
        textStyleYearSelected: TextStyle(
            fontSize: 30, color: darkblue, fontWeight: FontWeight.bold),
        heightYearRow: 50,
        backgroundPicker: white,
      ));
}
