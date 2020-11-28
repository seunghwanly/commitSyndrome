import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/borders.dart';
import 'package:gajuga_manage/util/firebase_method.dart';
import 'package:gajuga_manage/util/to_text.dart';

class MenuHeader extends StatefulWidget {
  @override
  _MenuHeaderState createState() => _MenuHeaderState();
}

class _MenuHeaderState extends State<MenuHeader> {
  final TextEditingController _searchController = new TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  String query = '';

  @override
  void dispose() {
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Future<void> searchMenu(String searchQuery) async {
  var menuDatabaseFetched = await FirebaseMethod().getMenuData();
  List<dynamic> totalMenu = [];
  List<dynamic> searchResult = [];

  totalMenu.addAll(menuDatabaseFetched['pizza']);
  totalMenu.addAll(menuDatabaseFetched['beverage']);

  totalMenu.forEach((menu) {
    if (menu['name'].toString().contains(searchQuery)) searchResult.add(menu);
  });

  print('검색 결과 ${searchResult.length}개');
  print(searchResult);

  return searchResult;
}
