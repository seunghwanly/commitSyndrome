import 'package:flutter/material.dart';
import 'package:gajuga_user/component/body/order_history.dart';
import 'package:gajuga_user/main.dart';
import 'package:gajuga_user/util/palette.dart';
import 'package:gajuga_user/util/to_text.dart';
import 'package:gajuga_user/component/body/login.dart';
import '../body/shopping_cart.dart';

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

    void _gotoCart() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ShoppingCart()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GAJUGA.',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: _gotoCart,
            alignment: Alignment.centerRight,
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromRGBO(234, 230, 218, 1.0),
        padding: EdgeInsets.only(top: 1),
        child: widget.body,
      ),
      drawer: Drawer(
        child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(bottom: 20.0),
            decoration: BoxDecoration(
                color: pale,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    DrawerHeader(
                      child: makeTitleSize("GAJUGA", ' 가주가', 10, 24, false),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(33, 33, 31, 0.7),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                    ),
                    ListTile(
                      leading: Icon(Icons.home, color: darkblue, size: 30),
                      // title: makeTitle('주문', '내역'),
                      title:
                          makeTextSizepadding('메인 화면', darkblue, 0.0, 0.0, 18),
                      subtitle: Text(' main / home',
                          style: TextStyle(color: lightgrey, fontSize: 12)),
                      selected: true,
                      contentPadding: EdgeInsets.only(left: 20.0),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.receipt, color: darkblue, size: 30),
                      // title: makeTitle('주문', '내역'),
                      title:
                          makeTextSizepadding('주문 내역', darkblue, 0.0, 0.0, 18),
                      subtitle: Text(' e-Reciept / History',
                          style: TextStyle(color: lightgrey, fontSize: 12)),
                      selected: true,
                      contentPadding: EdgeInsets.only(left: 20.0),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderHistory()));
                      },
                    ),
                  ],
                ),
                ListTile(
                  leading: Icon(Icons.power_settings_new),
                  title:
                      makeTextSizepadding('로그인/로그아웃', darkblue, 0.0, 0.0, 16),
                  subtitle: Text('김관우 in the area'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginWidget()));
                  },
                )
              ],
            )),
      ),
      // floatingActionButton: Container(width: 30, height: 30, color: Colors.red,),
    );
  }
}
