import 'package:flutter/material.dart';
import 'package:gajuga_user/component/body/order_history.dart';
import 'package:gajuga_user/main.dart';
import 'package:gajuga_user/util/palette.dart';
import 'package:gajuga_user/util/to_text.dart';
import 'package:gajuga_user/component/body/login.dart';
import '../body/shopping_cart.dart';
import 'package:badges/badges.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../util/to_text.dart';
import '../../util/palette.dart';
import 'package:gajuga_user/main.dart';

//_CustomHeaderState headerState = new _CustomHeaderState();

class CustomHeader extends StatefulWidget {
  CustomHeader({@required this.body});

  final body;

  @override
  _CustomHeaderState createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  final DBRef = FirebaseDatabase.instance.reference();
  final String userid = 'UserCode-01';

  int shoppingCartCount = 0;

  void readData() {
    if (shoppingCartCount == 1 || shoppingCartCount == 0) {
      setState(() {});
    }
    bool changeDataflag = false;
    DBRef.child('user/userInfo/' + userid + '/shoppingCart')
        .orderByChild('cost')
        .once()
        .then((DataSnapshot dataSnapshot) {
      //print('뭐라뜰까 : ' + dataSnapshot.value.toString());
      if (dataSnapshot.value == null) {
        setState(() {
          shoppingCartCount = 0;
        });
      } else {
        changeDataflag = true;
        Map<dynamic, dynamic> values = dataSnapshot.value;
        setState(() {
          shoppingCartCount = values.length;
        });
      }
      // if (changeDataflag == false) {
      //   setState(() {
      //     shoppingCartCount = 0;
      //   });
      // }
    });

    // print('count : ' + shoppingCartCount.toString());
  }

  void startListener() {
    // FirebaseDatabase.instance
    //     .reference()
    //     .child('user/userInfo/' + userid + '/shoppingCart')
    //     .o
    //     .listen((event) {
    //   print('1개 추가됨 ! ');
    //   // DBRef.child('user/userInfo/' + userid + '/shoppingCart')
    //   //     .orderByChild('cost')
    //   //     .once()
    //   //     .then((DataSnapshot dataSnapshot) {
    //   //   Map<dynamic, dynamic> values = dataSnapshot.value;
    //   //   setState(() {
    //   //     shoppingCartCount = values.length;
    //   //   });
    //   // });
    //   // process event
    // });
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUp');
    readData();
  }

  @override
  void didChangeDependencies() {
    print('didChange');
    readData();
  }

  @override
  void initState() {
    super.initState();
    // _messageStream = FirebaseDatabase.instance
    //     .reference()
    //     .child('user/userInfo/' + userid + '/shoppingCart')
    //     .onChildAdded
    //     .listen((event) {
    //   print('1개 추가됨 ! ');
    //   // DBRef.child('user/userInfo/' + userid + '/shoppingCart')
    //   //     .orderByChild('cost')
    //   //     .once()
    //   //     .then((DataSnapshot dataSnapshot) {
    //   //   Map<dynamic, dynamic> values = dataSnapshot.value;
    //   //   setState(() {
    //   //     shoppingCartCount = values.length;
    //   //   });
    //   // });
    //   // process event
    // });

    readData();
  }

  @override
  void dispose() {
    //_messageStream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //startListener();
    void _openDrawer() {}

    void _resetAndOpenPage(BuildContext context) {
      // Navigator.popUntil(context, (route) => false)
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => MainScreen()),
        ModalRoute.withName('/main'),
      );
    }

    void _gotoCart() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ShoppingCartRoute()));
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
          shoppingCartCount < 10
              ? Badge(
                  padding: EdgeInsets.all(5),
                  animationType: BadgeAnimationType.scale,
                  borderRadius: BorderRadius.circular(5),
                  position: BadgePosition.topEnd(top: 7, end: 5),
                  badgeContent: Text('${shoppingCartCount}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      )),
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: _gotoCart,
                    alignment: Alignment.centerRight,
                  ),
                )
              : Badge(
                  padding: EdgeInsets.all(3.5),
                  animationType: BadgeAnimationType.scale,
                  borderRadius: BorderRadius.circular(3),
                  position: BadgePosition.topEnd(top: 7, end: 5),
                  badgeContent: Text('${shoppingCartCount}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                      )),
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
