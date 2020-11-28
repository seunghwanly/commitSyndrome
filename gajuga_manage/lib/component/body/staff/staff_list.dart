import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/staff/staff_page.dart';
import 'package:gajuga_manage/component/body/staff/staff_activity.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:gajuga_manage/model/staff_model.dart';
import 'package:gajuga_manage/util/borders.dart';
import 'package:gajuga_manage/util/loading.dart';
import 'package:gajuga_manage/util/palette.dart';

List<bool> s_isSelected = List.filled(10, false);
List<bool> c_isSelected = List.filled(10, false);

class StaffList extends StatefulWidget {
  @override
  _StaffListState createState() => _StaffListState();
}

class _StaffListState extends State<StaffList> {
  Timer _timer;
  int _start = 1;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  final staffReference =
      FirebaseDatabase.instance.reference().child('manager/employee/staff');
  final chefReference =
      FirebaseDatabase.instance.reference().child('manager/employee/chef');
  final List staffList = new List();
  final List chefList = new List();

  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    s_isSelected.setAll(0, [false]);
    c_isSelected.setAll(0, [false]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_start < 1) {
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
              Row(
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
                ],
              ),
              SizedBox(height: 10),
              FutureBuilder(
                  future: staffReference.once(),
                  builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                    if (snapshot.hasData) {
                      staffList.clear();
                      Map<dynamic, dynamic> values = snapshot.data.value;
                      values.forEach((key, values) {
                        staffList.add(values);
                      });
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.23,
                        width: double.infinity,
                        child: ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount: staffList == null ? 0 : staffList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                StaffPage.selectedUid = staffList[index]["uid"];
                                StaffPage.selectedRole = 1;
                                for (int i = 0; i < staffList.length; i++)
                                  s_isSelected[i] = false;
                                setState(() {
                                  s_isSelected[index] = true;
                                });
                                for (int j = 0; j < chefList.length; j++)
                                  c_isSelected[j] = false;
                              },
                              child: _listItem(
                                  staffList,
                                  1,
                                  AssetImage('images/default_profile.jpg'),
                                  context,
                                  index),
                            );
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                      );
                    } else {
                      return Container(
                          alignment: Alignment.center,
                          child: customLoadingBouncingGrid(orange));
                    }
                  }),
              FutureBuilder(
                  future: chefReference.once(),
                  builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                    if (snapshot.hasData) {
                      chefList.clear();
                      Map<dynamic, dynamic> values = snapshot.data.value;
                      values.forEach((key, values) {
                        chefList.add(values);
                      });
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.23,
                        width: double.infinity,
                        child: ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount: chefList == null ? 0 : chefList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                StaffPage.selectedUid = chefList[index]["uid"];
                                StaffPage.selectedRole = 2;
                                for (int i = 0; i < chefList.length; i++)
                                  c_isSelected[i] = false;
                                setState(() {
                                  c_isSelected[index] = true;
                                });
                                for (int j = 0; j < staffList.length; j++)
                                  s_isSelected[j] = false;
                              },
                              child: _listItem(
                                  chefList,
                                  2,
                                  AssetImage('images/default_profile.jpg'),
                                  context,
                                  index),
                            );
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                      );
                    } else {
                      return Container(
                          alignment: Alignment.center,
                          child: customLoadingBouncingGrid(orange));
                    }
                  })
            ],
          ));
    } else {
      startTimer();
      return Container(
          alignment: Alignment.center,
          child: customLoadingBouncingGrid(orange));
    }
  }

  Widget _listItem(
      List staff, int role, AssetImage image, BuildContext context, int index) {
    String name = staff[index]["name"];
    String address = staff[index]["address"];
    String phoneNumber = staff[index]["phoneNumber"];
    String id = staff[index]["id"];
    double itemWidth = MediaQuery.of(context).size.width * 0.12;
    double itemHeight = MediaQuery.of(context).size.width * 0.35;

    return Container(
      width: itemWidth,
      height: itemHeight,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: (s_isSelected[index] && role == 1) ||
                (c_isSelected[index] && role == 2)
            ? darkgrey
            : Colors.white,
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
            role == 1 ? '직원' : '셰프',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: (s_isSelected[index] && role == 1) ||
                      (c_isSelected[index] && role == 2)
                  ? Colors.white
                  : darkgrey,
              //color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, color: orange),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              showStaffEditDialog(
                  context, name, address, phoneNumber, id, role);
            },
            child: Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: orange,
              ),
              child: Text(
                "수정하기",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
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
                  key: _formKey,
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
                                text: ' 수정',
                                style: TextStyle(color: orange),
                              ),
                            ],
                          ),
                        ),
                        staffImageView("images/default_profile.jpg"),
                        SizedBox(height: 10),
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
                            Staff().updateStaff(id, role, _nameController.text,
                                _addressController.text, _phoneController.text);
                            Navigator.of(context).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StaffPage()));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "저장하고 닫기",
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
    _nameController.text = _name;
    return Row(
      children: [
        Text(
          '이       름',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(
                enabledBorder: roundInputBorder,
                focusedBorder: roundInputBorder,
                hintText: '이름 입력',
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              ),
              controller: _nameController,
              onSaved: (value) => _nameController.text = value.trim(),
            ),
          ),
        ),
      ],
    );
  }

  Widget addressField(String _address) {
    _addressController.text = _address;
    return Row(
      children: [
        Text(
          '주       소',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(
                enabledBorder: roundInputBorder,
                focusedBorder: roundInputBorder,
                hintText: '주소 입력',
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              ),
              controller: _addressController,
              onSaved: (value) => _addressController.text = value.trim(),
            ),
          ),
        ),
      ],
    );
  }

  Widget phoneField(String _phone) {
    _phoneController.text = _phone;
    return Row(
      children: [
        Text(
          '전화번호',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(
                enabledBorder: roundInputBorder,
                focusedBorder: roundInputBorder,
                hintText: '전화번호 입력',
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              ),
              controller: _phoneController,
              onSaved: (value) => _phoneController.text = value.trim(),
            ),
          ),
        ),
      ],
    );
  }
}
