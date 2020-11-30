import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/staff/staff_activity.dart';
import 'package:gajuga_manage/component/body/staff/staff_list.dart';
import 'package:gajuga_manage/util/borders.dart';
import 'package:gajuga_manage/util/main_container.dart';
import 'package:gajuga_manage/util/palette.dart';

class StaffPage extends StatefulWidget {
  static String selectedUid = '';
  static int selectedRole = 0;

  @override
  _StaffPageState createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
  TextEditingController _searchController = new TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  String query = '';
  var allStaffs = [];
  var searchResult = [];
  Widget staffs = StaffList(type: 'default');

  final staffReference = FirebaseDatabase.instance.reference().child('manager/employee/staff');
  final chefReference = FirebaseDatabase.instance.reference().child('manager/employee/chef');

  @override
  void initState() {
    super.initState();
    getAllStaffs();
  }

  @override
  void dispose() {
    _searchFocus.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  searchBar(),
                  SizedBox(height: 40),
                  staffs,
                ],
              ),
            ),
            StaffActivity(),
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
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
                  style: TextStyle(color: darkgrey, fontSize: 26),
                ),
                TextSpan(
                  text: ' 검색',
                  style: TextStyle(color: orange, fontSize: 26),
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
                      setState(() {
                        staffs = StaffList(type: 'search', searchResult: searchResult);
                      });
                    },
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  _searchFocus.unfocus();
                  search(query);
                  setState(() {
                    staffs = StaffList(type: 'search', searchResult: searchResult);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  getAllStaffs() {
    allStaffs.clear();

    staffReference.once().then((DataSnapshot snapshot) {
      snapshot.value.forEach((k, v) {
        allStaffs.add(v);
        allStaffs.last['role'] = 1;
      });
    });

    chefReference.once().then((DataSnapshot snapshot) {
      snapshot.value.forEach((k, v) {
        allStaffs.add(v);
        allStaffs.last['role'] = 0;
      });
    });
  }

  search(String searchQuery) {
    searchResult.clear();

    allStaffs.forEach((element) {
      if (element['name'].contains(searchQuery)) searchResult.add(element);
    });

    print('검색 결과 ${searchResult.length}개');
    
    return searchResult;
  }
}
