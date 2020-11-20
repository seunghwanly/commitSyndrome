import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//0 : 관리자, 1 : 직원, 2 : 셰프, 3 : 사용자
class RoleAuth extends StatelessWidget {
  CollectionReference users = FirebaseFirestore.instance.collection('admin');

  Future<void> saveRole(
      int role, String email, String password, String phone) async {
    if (role == 0) {
      CollectionReference users =
          FirebaseFirestore.instance.collection('gajuga-aeb32/manager/admin');
      return users
          .doc(email)
          .set({
            'address': "강동구",
            'id': email,
            'password': password,
            'phoneNumber': phone
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
