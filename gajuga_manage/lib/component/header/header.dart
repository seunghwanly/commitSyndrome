import 'package:flutter/material.dart';
// import 'package:gajuga_manage/component/body/order_history.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_text.dart';
// import 'package:gajuga_manage/component/body/login.dart';

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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromRGBO(234, 230, 218, 1.0),
        padding: EdgeInsets.only(top: 10),
        child: widget.body,
      ),
      drawer: Drawer(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: pale,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                ],
              ),
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
      // floatingActionButton: Container(width: 30, height: 30, color: Colors.red,),
    );
  }
}
