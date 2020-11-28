import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/borders.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:firebase_database/firebase_database.dart';

class StaffSearch extends StatefulWidget {
  @override
  _StaffSearchState createState() => _StaffSearchState();
}

class _StaffSearchState extends State<StaffSearch> {
  final staffReference =
      FirebaseDatabase.instance.reference().child('manager/employee/staff');

  final chefReference =
      FirebaseDatabase.instance.reference().child('manager/employee/chef');

  TextEditingController _searchController = new TextEditingController();
  final FocusNode _searchFocus = FocusNode();

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
                  text: ' 프로필 확인',
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
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width / 5,
                  child: TextFormField(
                    focusNode: _searchFocus,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      enabledBorder: roundInputBorder,
                      focusedBorder: roundInputBorder,
                      hintText: '직원 이름을 입력해주세요...',
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                    ),
                    controller: _searchController,
                    onSaved: (value) => _searchController.text = value.trim(),
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    staffReference.once().then((DataSnapshot dataSnapshot) {
                      for (var value in dataSnapshot.value.values) {
                        if (value["name"] == _searchController.text) {
                          showStaffEditDialog(context, value["name"],
                              value["address"], value["phone"], value["id"], 1);
                        }
                      }
                    });
                    chefReference.once().then((DataSnapshot dataSnapshot) {
                      for (var value in dataSnapshot.value.values) {
                        if (value["name"] == _searchController.text) {
                          showStaffEditDialog(context, value["name"],
                              value["address"], value["phone"], value["id"], 2);
                        }
                      }
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }

  Future showStaffEditDialog(BuildContext context, String name, String address,
      String phone, String id, int role) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  right: -40.0,
                  top: -40.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                Form(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            children: [
                              TextSpan(
                                text: '프로필',
                                style: TextStyle(color: darkgrey),
                              ),
                              TextSpan(
                                text: ' 정보',
                                style: TextStyle(color: orange),
                              ),
                            ],
                          ),
                        ),
                        staffImageView("images/default_profile.jpg"),
                        SizedBox(height: 20),
                        Text(
                          id,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        nameField(name),
                        addressField(address),
                        phoneField(phone),
                        SizedBox(height: 10),
                        FlatButton(
                          color: orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "확인",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget staffImageView(String _imageTitle) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: CircleAvatar(
                radius: 65.0, backgroundImage: AssetImage(_imageTitle)),
          ),
        ],
      ),
    );
  }

  Widget nameField(String _name) {
    return Row(
      children: [
        Text(
          '이       름' + _name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget addressField(String _address) {
    return Row(
      children: [
        Text(
          '주       소' + _address,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget phoneField(String _phone) {
    return Row(
      children: [
        Text(
          '전화번호' + _phone,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
