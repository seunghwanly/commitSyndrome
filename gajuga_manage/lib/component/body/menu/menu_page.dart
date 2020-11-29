import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/menu/menu_list.dart';
import 'package:gajuga_manage/model/menu_model.dart';
import 'package:gajuga_manage/util/borders.dart';
import 'package:gajuga_manage/util/firebase_method.dart';
import 'package:gajuga_manage/util/main_container.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_text.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<dynamic> totalMenu = [];
  List<Information> searchResult = [];
  final TextEditingController _searchController = new TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  String query = '';
  Widget menus = MenuList(type: 'default');

  @override
  void dispose() {
    _searchFocus.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      body: Column(
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
                      controller: _searchController,
                      focusNode: _searchFocus,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      decoration: new InputDecoration(
                        enabledBorder: roundInputBorder,
                        focusedBorder: roundInputBorder,
                        hintText: '검색어를 입력해주세요',
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      ),
                      onChanged: (text) {
                        setState(() {
                          query = text;
                        });
                      },
                      onSubmitted: (value) {
                        searchMenu(value);
                        setState(() {
                          menus = MenuList(searchResult: searchResult);
                        });
                      },
                    ),
                  ),
                  IconButton( // 검색
                    icon: Icon(Icons.search),
                    onPressed: () {
                      _searchFocus.unfocus();
                      searchMenu(query);
                      setState(() {
                        menus = MenuList(searchResult: searchResult);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          Divider(height: 20, thickness: 3, indent: 14, color: darkgrey),
          SizedBox(height: 10),
          menus,
        ],
      ),
    );
  }

  searchMenu(String searchQuery) async {
    searchResult.clear();
    await getAllMenus();

    totalMenu.forEach((menu) {
      if (menu['name'].toString().contains(searchQuery)) searchResult.add(Information.fromJson(menu));
    });

    print('검색 결과 ${searchResult.length}개');

    return searchResult;
  }

  Future<void> getAllMenus() async {
    totalMenu.clear();
    
    var menuDatabaseFetched = await FirebaseMethod().getMenuData();

    totalMenu.addAll(menuDatabaseFetched['pizza']);
    totalMenu.addAll(menuDatabaseFetched['beverage']);
  }
}
