import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/borders.dart';
import 'package:gajuga_manage/util/to_text.dart';

class MenuHeader extends StatefulWidget {
  @override
  _MenuHeaderState createState() => _MenuHeaderState();
}

class _MenuHeaderState extends State<MenuHeader> {
  final TextEditingController _searchController = new TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  @override
  void dispose() {
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        makeTitle('메뉴', ' 수정'),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 5,
              child: TextField(
                controller: _searchController,
                focusNode: _searchFocus,
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  enabledBorder: roundInputBorder,
                  focusedBorder: roundInputBorder,
                  hintText: '검색어를 입력해주세요',
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                ),
              ),
            ),
            IconButton( // 검색
              icon: Icon(Icons.search),
              onPressed: () {
                _searchFocus.dispose();
                print('search');
              },
            ),
          ],
        ),
      ],
    );
  }
}
