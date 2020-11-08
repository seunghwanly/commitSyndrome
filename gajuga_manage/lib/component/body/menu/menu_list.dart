import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_locale.dart';
import 'package:gajuga_manage/util/to_text.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  final List<String> data = <String>['A', 'B', 'C', 'D'];
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            makeSubTitle('피자', ' PIZZA'),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.03,
              ),
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return _listItem(
                    data[index],
                    AssetImage('images/${data[index]}.png'),
                    'desc',
                    12900,
                    context,
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            makeSubTitle('파스타', ' PASTA'),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.03,
              ),
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return _listItem(
                    data[index],
                    AssetImage('images/${data[index]}.png'),
                    'desc',
                    12900,
                    context,
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            makeSubTitle('음료', ' BEVERAGE'),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.03,
              ),
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return _listItem(
                    data[index],
                    AssetImage('images/${data[index]}.png'),
                    'desc',
                    12900,
                    context,
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listItem(String title, AssetImage image, String desc, int cost, BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width * 0.2;
    double itemHeight = MediaQuery.of(context).size.width * 0.35;

    return Container(
      width: itemWidth,
      height: itemHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 40, bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: image,
            radius: 35,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          Text(
            desc,
            style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          Text(
            '${toLocaleString(cost)} 원',
            style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            color: orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () { },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "수정하기",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
