import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/chef_page.dart';
import 'package:gajuga_manage/component/body/menu/menu_page.dart';
import 'package:gajuga_manage/component/body/order_page.dart';
import 'package:gajuga_manage/component/body/sales/sales_page.dart';
import 'package:gajuga_manage/component/body/staff/staff_page.dart';
import 'package:gajuga_manage/component/body/stock/stock_page.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_text.dart';

class CustomHeader extends StatefulWidget {
  CustomHeader({@required this.body});

  final body;

  @override
  _CustomHeaderState createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    void _openDrawer() {}

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GAJUGA',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap:() => FocusScope.of(context).requestFocus(new FocusNode()),
        child: 
      Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromRGBO(234, 230, 218, 1.0),
        // padding: EdgeInsets.only(top: 10), // -> 주문화면은 다크모드라서 이 부분이 중간에 pale 색깔로 뜨는데 꼭 필요한 코드면 말해주세요...!
        child: widget.body,
      )),
      drawer: Drawer(
        //------------------------------------------------------------------------- DRAWER
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: pale,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DrawerHeader(
                      child: makeTitleSize("GAJUGA", ' 가주가', 10, 20, false),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(33, 33, 31, 0.7),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, top: 10, bottom: 5),
                      child: Text(
                        'Manager/Staff Menu',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: orange,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.restaurant_menu, color: darkblue, size: 30),
                      title: makeTextSizepadding('메뉴 관리', darkblue, 0.0, 0.0, 18),
                      subtitle: Text(
                        ' menu',
                        style: TextStyle(color: lightgrey, fontSize: 12),
                      ),
                      selected: true,
                      contentPadding: EdgeInsets.only(left: 20.0),
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuPage()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.people, color: darkblue, size: 30),
                      title: makeTextSizepadding('직원 관리', darkblue, 0.0, 0.0, 18),
                      subtitle: Text(
                        ' staff',
                        style: TextStyle(color: lightgrey, fontSize: 12),
                      ),
                      selected: true,
                      contentPadding: EdgeInsets.only(left: 20.0),
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StaffPage()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.attach_money, color: darkblue, size: 30),
                      title: makeTextSizepadding('매출 관리', darkblue, 0.0, 0.0, 18),
                      subtitle: Text(
                        ' sales',
                        style: TextStyle(color: lightgrey, fontSize: 12),
                      ),
                      selected: true,
                      contentPadding: EdgeInsets.only(left: 20.0),
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SalesPage()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.apps, color: darkblue, size: 30),
                      title: makeTextSizepadding('재고 관리', darkblue, 0.0, 0.0, 18),
                      subtitle: Text(
                        ' stock',
                        style: TextStyle(color: lightgrey, fontSize: 12),
                      ),
                      selected: true,
                      contentPadding: EdgeInsets.only(left: 20.0),
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StockPage()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.queue, color: darkblue, size: 30),
                      title: makeTextSizepadding('주문 목록', darkblue, 0.0, 0.0, 18),
                      subtitle: Text(
                        ' order',
                        style: TextStyle(color: lightgrey, fontSize: 12),
                      ),
                      selected: true,
                      contentPadding: EdgeInsets.only(left: 20.0),
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OrderPage()));
                      },
                    ),
                    Divider(),
                    Container(
                      padding: EdgeInsets.only(left: 20, top: 10, bottom: 5),
                      child: Text(
                        'Chef Menu',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: orange,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.queue, color: darkblue, size: 30),
                      title: makeTextSizepadding('주문 목록(셰프)', darkblue, 0.0, 0.0, 18),
                      subtitle: Text(
                        ' order / chef',
                        style: TextStyle(color: lightgrey, fontSize: 12),
                      ),
                      selected: true,
                      contentPadding: EdgeInsets.only(left: 20.0),
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChefPage()));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 25),
                ListTile(
                  title: makeTitle('로그인', '로그아웃'),
                  subtitle: Text('       김관우 in the area'),
                  onTap: () {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => LoginWidget()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: Container(width: 30, height: 30, color: Colors.red,),
    );
  }
}
