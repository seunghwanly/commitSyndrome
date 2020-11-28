import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gajuga_manage/model/staff_model.dart';
import 'package:gajuga_manage/util/borders.dart';
import 'package:gajuga_manage/util/modal.dart';
import 'package:gajuga_manage/util/palette.dart';

class StaffSearch extends StatefulWidget {
  @override
  _StaffSearchState createState() => _StaffSearchState();
}

class _StaffSearchState extends State<StaffSearch> {
  TextEditingController _searchController = new TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  String query = '';
  List<Staff> staffs = [];
  List<Staff> searchResult = [];

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
                  _searchFocus.unfocus();
                  search(query);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  getAllStaffs() {
    staffs.clear();

    staffReference.once().then((DataSnapshot snapshot) {
      snapshot.value.forEach((k, v) {
        staffs.add(Staff.fromJson(v));
      });
    });

    chefReference.once().then((DataSnapshot snapshot) {
      snapshot.value.forEach((k, v) {
        staffs.add(Staff.fromJson(v));
      });
    });
  }

  search(String searchQuery) {
    searchResult.clear();

    staffs.forEach((element) {
      if (element.name.contains(searchQuery)) searchResult.add(element);
    });

    print('검색 결과 ${searchResult.length}개');
    // if (searchResult.length == 0) Modal(modalText: '직원 정보가 없습니다.');
    if (searchResult.length == 0) showModal();
    else return searchResult;
  }

  showModal() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 16.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: white,
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 5,
            padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '직원 정보가 없습니다.',
                  style: TextStyle(
                    color: darkblue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: orange,
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 12,
                    height: MediaQuery.of(context).size.height / 20,
                    child: Text(
                      '확인',
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
