import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/box_shadow.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_text.dart';

class StockManage extends StatefulWidget {
  @override
  _StockManageState createState() => _StockManageState();
}

class _StockManageState extends State<StockManage> {
  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Colors.white,
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                makeTitle('재고', ' 확인'),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
