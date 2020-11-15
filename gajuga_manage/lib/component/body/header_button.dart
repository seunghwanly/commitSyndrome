import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/menu/menu_manage.dart';
import 'package:gajuga_manage/component/body/sales/sales_manage.dart';
import 'package:gajuga_manage/component/body/staff/staff_manage.dart';
import 'package:gajuga_manage/component/body/stock/stock_manage.dart';
import 'package:gajuga_manage/util/box_button.dart';
import 'package:gajuga_manage/util/box_shadow.dart';
import 'package:gajuga_manage/util/palette.dart';

class HeaderButton extends StatefulWidget {
  @override
  _HeaderButtonState createState() => _HeaderButtonState();
}

class _HeaderButtonState extends State<HeaderButton> {
  int pageIndex = 0;

  void handlePage(int goto) {
    setState(() {
      pageIndex = goto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              menuButton(),
              staffButton(),
              salesButton(),
              stockButton(),
            ],
          ),
        ),
        // SizedBox(height: 20),
        // Expanded(
        //   child: mainBody(this.pageIndex),
        // ),
        Container(
          height: MediaQuery.of(context).size.height - 307,
          padding: EdgeInsets.fromLTRB(40, 20, 40, 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: Colors.white,
          ),
          width: double.infinity,
          child: mainBody(this.pageIndex),
        ),
      ],
    );
  }

  Widget menuButton() {
    return tapButton(
      () => handlePage(0),
      this.pageIndex == 0 ? orange : darkgrey,
      orange,
      '메뉴관리',
      white,
      30,
      MediaQuery.of(context).size.width * 0.12,
      MediaQuery.of(context).size.width * 0.12,
      MediaQuery.of(context).size.height * 0.01,
      MediaQuery.of(context).size.width * 0.01,
      0.0,
    );
  }

  Widget staffButton() {
    return tapButton(
      () => handlePage(1),
      this.pageIndex == 1 ? orange : darkgrey,
      orange,
      '직원관리',
      white,
      30,
      MediaQuery.of(context).size.width * 0.12,
      MediaQuery.of(context).size.width * 0.12,
      MediaQuery.of(context).size.height * 0.01,
      MediaQuery.of(context).size.width * 0.01,
      0.0,
    );
  }

  Widget salesButton() {
    return tapButton(
      () => handlePage(2),
      this.pageIndex == 2 ? orange : darkgrey,
      orange,
      '매출관리',
      white,
      30,
      MediaQuery.of(context).size.width * 0.12,
      MediaQuery.of(context).size.width * 0.12,
      MediaQuery.of(context).size.height * 0.01,
      MediaQuery.of(context).size.width * 0.01,
      0.0,
    );
  }
  
  Widget stockButton() {
    return tapButton(
      () => handlePage(3),
      this.pageIndex == 3 ? orange : darkgrey,
      orange,
      '재고관리',
      white,
      30,
      MediaQuery.of(context).size.width * 0.12,
      MediaQuery.of(context).size.width * 0.12,
      MediaQuery.of(context).size.height * 0.01,
      MediaQuery.of(context).size.width * 0.01,
      0.0,
    );
  }
}

Widget mainBody(int pageIndex) {
  switch (pageIndex) {
    case 0:
      return MenuManage();
    case 1:
      return StaffManage();
    case 2:
      return SalesManage();
    case 3:
      return StockManage();
  }
}
