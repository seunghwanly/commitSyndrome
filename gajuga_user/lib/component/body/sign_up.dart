import 'package:flutter/material.dart';
import '../header/header.dart';
import '../body/login.dart';
import 'package:gajuga_user/util/palette.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String userName;
    String password;
    String passwordCheck;
    String phone;
    String authNum;

    return CustomHeader(
      body: Container(
        padding: EdgeInsets.fromLTRB(32.0, 20.0, 32.0, 0.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Text(
            "가져가 아이디",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(children: <Widget>[
            Flexible(
              child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      hintText: '아이디 입력'),
                  onChanged: (String str) {
                    userName = str;
                  }),
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              padding: EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20.0),
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
                        fontSize: 20.0,
                      )),
                  //로그인 기능 수정 필요
                  onPressed: () {
                    if (userName == 'dart' && password == 'flutter') {
                      Scaffold.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text('로그인 성공')));
                    } else
                      Scaffold.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text('로그인 실패')));
                  }),
            )
          ]),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "가져가 비밀번호",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15.0),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  hintText: '비밀번호 입력'),
              onChanged: (String str) {
                password = str;
              }),
          SizedBox(
            height: 8.0,
          ),
          TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15.0),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  hintText: '비밀번호 입력'),
              onChanged: (String str) {
                passwordCheck = str;
              }),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "휴대폰 인증",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(children: <Widget>[
            Flexible(
              child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      hintText: '휴대폰 번호 입력'),
                  onChanged: (String str) {
                    phone = str;
                  }),
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              padding: EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: ([
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  )
                ]),
              ),
              child: FlatButton(
                  child: Text('인증',
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      )),
                  //로그인 기능 수정 필요
                  onPressed: () {
                    if (userName == 'dart' && password == 'flutter') {
                      Scaffold.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text('로그인 성공')));
                    } else
                      Scaffold.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text('로그인 실패')));
                  }),
            )
          ]),
          SizedBox(
            height: 8.0,
          ),
          Container(
            padding: EdgeInsets.only(right: 105.0),
            child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15.0),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    hintText: '인증 번호 입력'),
                onChanged: (String str) {
                  authNum = str;
                }),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
              padding: EdgeInsets.all(5.0),
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
              child: Center(
                  child: FlatButton(
                      padding: EdgeInsets.fromLTRB(120.0, 10.0, 120.0, 10.0),
                      color: orange,
                      child: Text('회원가입',
                          style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          )),
                      //로그인 기능 수정 필요
                      onPressed: () {
                        if (userName == 'dart' && password == 'flutter') {
                          Scaffold.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(SnackBar(content: Text('로그인 성공')));
                        } else
                          Scaffold.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(SnackBar(content: Text('로그인 실패')));
                      }))),
        ]),
      ),
    );
  }
}
