import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/palette.dart';

class StaffSearch extends StatefulWidget {
  @override
  _StaffSearchState createState() => _StaffSearchState();
}

class _StaffSearchState extends State<StaffSearch> {
  TextEditingController searchController = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width / 2.65,
      height: MediaQuery.of(context).size.height / 6,
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
                TextSpan(
                  text: ' 및',
                  style: TextStyle(color: darkgrey),
                ),
                TextSpan(
                  text: ' 활동 확인',
                  style: TextStyle(color: orange),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                '직원이름 검색',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: MediaQuery.of(context).size.width / 5,
                child: TextField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(color: Colors.grey[300]),
                    ),
                    hintText: '검색어를 입력해주세요',
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () { },
              ),
            ],
          ),
        ],
      ),
    );
  }
}