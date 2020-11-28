import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/palette.dart';

showDeleteModal(BuildContext cc) {
    return showDialog(
        context: cc,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
            child:
          Container(
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.width / 6,
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("삭제하시겠습니까?", style: TextStyle(fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: superlight,
                      child: Text("취소", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    RaisedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: orange,
                      child: Text("삭제", style: TextStyle(fontWeight: FontWeight.bold),),
                    )
                  ],
                )
              ],
            ),
          ));
        });
  }