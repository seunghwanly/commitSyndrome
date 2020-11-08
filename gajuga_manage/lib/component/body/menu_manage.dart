import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/menu_list.dart';
import 'package:gajuga_manage/util/box_shadow.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_text.dart';

class MenuManage extends StatefulWidget {
  @override
  _MenuManageState createState() => _MenuManageState();
}

class _MenuManageState extends State<MenuManage> {
  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Colors.white,
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                makeTitle('메뉴', ' 수정'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
            Divider(
              height: 20,
              thickness: 3,
              indent: 14,
              color: darkgrey,
            ),
            SizedBox(height: 10),
            MenuList(),
          ],
        ),
      ),
    );
  }
}
