import 'package:flutter/material.dart';
import '../header/header.dart';
import '../body/login.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      body: Container(
        padding: EdgeInsets.fromLTRB(32.0, 50.0, 32.0, 0.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginWidget()));
                },
                child: Text(
                  "회원가입 페이지",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
