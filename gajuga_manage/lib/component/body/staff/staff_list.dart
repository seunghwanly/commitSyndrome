import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/staff/staff_profile.dart';
import 'package:gajuga_manage/util/palette.dart';

class StaffList extends StatefulWidget {
  @override
  _StaffListState createState() => _StaffListState();
}

class _StaffListState extends State<StaffList> {
  final List<String> data = <String>['김관우', '박종하', '이승환', '이주영'];
  List<bool> _isSelected = List.filled(4, false);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 20, right: 10),
      width: MediaQuery.of(context).size.width / 2.6,
      height: MediaQuery.of(context).size.height / 1.78,
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
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StaffProfile()));
            },
            child: Row(
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
          ),
          SizedBox(height: 10),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    for (int i = 0; i < _isSelected.length; i++) _isSelected[i] = false;
                    setState(() {
                      _isSelected[index] = true;
                    });
                  },
                  child: _listItem(
                    data[index],
                    AssetImage('images/default_profile.jpg'),
                    context,
                    index
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listItem(String name, AssetImage image, BuildContext context, int index) {
    double itemWidth = MediaQuery.of(context).size.width * 0.12;
    double itemHeight = MediaQuery.of(context).size.width * 0.35;

    return Container(
        width: itemWidth,
        height: itemHeight,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _isSelected[index] ? darkgrey : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        margin: EdgeInsets.only(left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: image,
              radius: 35,
            ),
            Text(
              '관리자',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _isSelected[index] ? Colors.white : darkgrey,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, color: orange),
              textAlign: TextAlign.center,
            ),
          ],
        ),
    );
  }
}