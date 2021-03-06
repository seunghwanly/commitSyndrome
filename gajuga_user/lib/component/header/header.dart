import 'package:flutter/material.dart';
import 'package:gajuga_user/component/body/order_history.dart';
import 'package:gajuga_user/main.dart';
import 'package:gajuga_user/provider/provider.dart';
import 'package:gajuga_user/util/palette.dart';
import 'package:gajuga_user/util/to_text.dart';
import 'package:gajuga_user/component/body/login.dart';
import '../body/shopping_cart.dart';
import 'package:badges/badges.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../util/to_text.dart';
import '../../util/palette.dart';
import 'package:provider/provider.dart';
import 'package:gajuga_user/model/firebase_provider.dart';
import '../body/auth_unAuth_modal.dart';

class CustomHeader extends StatefulWidget {
  CustomHeader({@required this.body});

  final body;

  @override
  _CustomHeaderState createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  FirebaseAuthService _auth;

  //get current shoppingCart data from Database
  DatabaseReference _shoppingCartRef = FirebaseDatabase.instance
      .reference()
      .child('user/userInfo/' + MainScreen.userid + '/shoppingCart');
  int _currentCount;

  @override
  void initState() {
    super.initState();

    // init _currentCount
    _shoppingCartRef.once().then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        setState(() {
          _currentCount = snapshot.value.length;
        });
      } else {
        setState(() {
          _currentCount = 0;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _shoppingCartRef.onDisconnect();
  }

  @override
  Widget build(BuildContext context) {
    _auth = Provider.of<FirebaseAuthService>(context);

    void _resetAndOpenPage(BuildContext context) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => mainBody()));
    }

    void _gotoCart() {
      if (MainScreen.userid != '') {
        if (ModalRoute.of(context).settings.name != '/shoppingCart') {
          Navigator.pushNamed(context, '/shoppingCart');
        }
      } else {
        showAuthModal(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
            onTap: () {
              _resetAndOpenPage(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'GAJUGA.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )),
        elevation: 0,
        centerTitle: true,
        actions: [
          Badge(
            padding: EdgeInsets.all(5),
            animationType: BadgeAnimationType.scale,
            borderRadius: BorderRadius.circular(5),
            position: BadgePosition.topEnd(top: 7, end: 5),
            badgeContent: StreamBuilder(
              stream: _shoppingCartRef.onValue,
              builder: (context, AsyncSnapshot<Event> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                      snapshot.data.snapshot.value != null
                          ? snapshot.data.snapshot.value.length.toString()
                          : '0',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ));
                } else {
                  return Text(_currentCount.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ));
                }
              },
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: _gotoCart,
              alignment: Alignment.centerRight,
            ),
          )
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
        //------------------------------------------------------------------------- DRAWER
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
                      title: makeTextSizepadding(
                          _auth.getUser() != null
                              ? _auth.getUser().email
                              : '로그인 정보 없음',
                          darkblue,
                          0.0,
                          0.0,
                          18),
                      subtitle: Text(_auth.getUser() != null ? '님 안녕하세요' : '',
                          style: TextStyle(color: lightgrey, fontSize: 12)),
                      selected: true,
                      contentPadding: EdgeInsets.only(left: 20.0),
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
                      //메인으로 이동 기능 변경
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mainBody()));
                        //Navigator.popUntil(context,
                        //    ModalRoute.withName(Navigator.defaultRouteName));
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
                        Navigator.pop(context);
                        if (MainScreen.userid != '') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderHistory()));
                        } else {
                          showAuthModal(context);
                        }
                      },
                    ),
                  ],
                ),
                ListTile(
                  leading: Icon(Icons.power_settings_new),
                  title: makeTextSizepadding(
                      _auth.getUser() != null ? '로그아웃' : '로그인',
                      darkblue,
                      0.0,
                      0.0,
                      16),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginWidget()));
                  },
                )
              ],
            )),
      ),
    );
  }
}
