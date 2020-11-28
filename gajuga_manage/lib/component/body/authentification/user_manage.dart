import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/palette.dart';

//0 - 관리자, 1 - 직원, 2 - 셰프, 3 - 사용자
class UserManage {
  final databaseReference = FirebaseDatabase.instance.reference();
  int authentification;
  void saveUser(
      int role, String uid, String _email, String _password, String _phone) {
    //관리자
    if (role == 0) {
      databaseReference.child("manager").child("admin").child(uid).set({
        'name': "이름",
        'address': "주소",
        'id': _email,
        'password': _password,
        'phoneNumber': _phone
      });
    }
    //직원
    else if (role == 1) {
      databaseReference
          .child("manager")
          .child("employee")
          .child("staff")
          .child(uid)
          .set({
        'name': "이름",
        'address': "주소",
        'id': _email,
        'password': _password,
        'phoneNumber': _phone
      });
    }
    //셰프
    else if (role == 2) {
      databaseReference
          .child("manager")
          .child("employee")
          .child("chef")
          .child(uid)
          .set({
        'name': "이름",
        'address': "주소",
        'id': _email,
        'password': _password,
        'phoneNumber': _phone
      });
    }
  }

  String checkAuth(String uid) {
    databaseReference
        .child("manager")
        .child("admin")
        .child(uid)
        .once()
        .then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
      if (snapshot.value != null) {
        return 'admin';
      }
    });

    databaseReference
        .child("manager")
        .child("employee")
        .child("staff")
        .child(uid)
        .once()
        .then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
      if (snapshot.value != null) {
        return 'staff';
      }
    });

    databaseReference
        .child("manager")
        .child("employee")
        .child("chef")
        .child(uid)
        .once()
        .then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
      if (snapshot.value != null) {
        return 'chef';
      }
    });
  }

  void showNoAuth(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: new Center(
              child: Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  "GAJUGA 알림",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            content: new SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 40.0),
                      child: Column(children: <Widget>[
                        Text(
                          "사용 권한이",
                          style: TextStyle(
                            color: Color.fromRGBO(119, 119, 119, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "없습니다.",
                          style: TextStyle(
                            color: Color.fromRGBO(119, 119, 119, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 0.0),
                      decoration: BoxDecoration(
                        color: orange,
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: ([
                          BoxShadow(
                            color: Colors.black.withOpacity(0.16),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          )
                        ]),
                      ),
                      child: FlatButton(
                          child: Text('확인',
                              style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              )),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                  ]),
            ),
          );
        });
  }
}
