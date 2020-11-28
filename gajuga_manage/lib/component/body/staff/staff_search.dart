import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/borders.dart';
import 'package:gajuga_manage/util/palette.dart';

class StaffSearch extends StatefulWidget {
  @override
  _StaffSearchState createState() => _StaffSearchState();
}

class _StaffSearchState extends State<StaffSearch> {
  TextEditingController _searchController = new TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      width: MediaQuery.of(context).size.width / 2.5,
      height: MediaQuery.of(context).size.height / 5.5,
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
                  text: ' 검색',
                  style: TextStyle(color: orange),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width / 5,
                  child: TextField(
                    controller: _searchController,
                    focusNode: _searchFocus,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    decoration: new InputDecoration(
                      enabledBorder: roundInputBorder,
                      focusedBorder: roundInputBorder,
                      hintText: '직원 이름을 입력해주세요...',
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                    ),
                    onChanged: (text) {
                      setState(() {
                        query = text;
                      });
                    },
                    onSubmitted: (value) {
                      search(value);
                    },
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  search(query);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  search(String query) {
    print('search');
  }
}
