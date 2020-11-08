import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/palette.dart';

class StaffList extends StatefulWidget {
  @override
  _StaffListState createState() => _StaffListState();
}

class _StaffListState extends State<StaffList> {
  final List<String> data = <String>['김관우', '박종하', '이승환', '이주영'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 20, right: 10),
      width: MediaQuery.of(context).size.width / 2.65,
      height: MediaQuery.of(context).size.height / 3,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  children: [
                    TextSpan(
                      text: '직원',
                      style: TextStyle(color: darkgrey),
                    ),
                    TextSpan(
                      text: ' 프로필 수정',
                      style: TextStyle(color: orange),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                onPressed: () { },
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return _listItem(
                  data[index],
                  AssetImage('images/default_profile.jpg'),
                  context,
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listItem(String name, AssetImage image, BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width * 0.15;
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
      margin: EdgeInsets.only(left: 20),
      // padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: image,
            radius: 35,
          ),
          Text(
            '관리자',
            style: TextStyle(fontWeight: FontWeight.bold, color: darkgrey),
            textAlign: TextAlign.center,
          ),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, color: orange),
            textAlign: TextAlign.center,
          ),
          // FlatButton(
          //   color: orange,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   onPressed: () { },
          //   child: Container(
          //     alignment: Alignment.center,
          //     child: Text(
          //       "수정하기",
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontWeight: FontWeight.bold,
          //         fontSize: 12,
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}