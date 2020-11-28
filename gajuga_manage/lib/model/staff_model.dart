// firebase staff model
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';

class Staff {
  final staffReference =
      FirebaseDatabase.instance.reference().child('manager/employee/staff');

  final chefReference =
      FirebaseDatabase.instance.reference().child('manager/employee/chef');

  void updateStaff(String _id, int role, String _name, String _address,
      String _phone) async {
    if (role == 1) {
      await staffReference.once().then((DataSnapshot dataSnapshot) {
        for (var value in dataSnapshot.value.values) {
          if (value["id"] == _id) {
            print(value["uid"]);
            final sReference = FirebaseDatabase.instance
                .reference()
                .child('manager/employee/staff/' + value["uid"]);
            sReference.update(
                {'name': _name, 'address': _address, 'phoneNumber': _phone});
          }
        }
      });
    } else {
      await chefReference.once().then((DataSnapshot dataSnapshot) {
        for (var value in dataSnapshot.value.values) {
          if (value["id"] == _id) {
            print(value["uid"]);
            final sReference = FirebaseDatabase.instance
                .reference()
                .child('manager/employee/chef/' + value["uid"]);
            sReference.update(
                {'name': _name, 'address': _address, 'phoneNumber': _phone});
          }
        }
      });
    }
  }
}
