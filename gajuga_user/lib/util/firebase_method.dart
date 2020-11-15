import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseMethod {
  final dbRef = FirebaseDatabase.instance.reference();

  // get shopping cart data
  Future<dynamic> getShoppingCart() async {
    try {
      var fetchedData;

      await dbRef
          .child('user/userInfo/' + 'UserCode-01' + '/shoppingCart')
          .once()
          .then((DataSnapshot dataSnapshot) {
        fetchedData = dataSnapshot.value;
      });

      if (fetchedData != null) return fetchedData;
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
