import '../body/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:gajuga_user/util/palette.dart';
import '../header/header.dart';
import 'package:gajuga_user/main.dart';

class LoginWidget extends StatelessWidget {
  String userName = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return CustomHeader(
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                // padding: EdgeInsets.fromLTRB(32.0, 50.0, 32.0, 0.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(32.0, 20.0, 32.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // padding: EdgeInsets.fromLTRB(32.0, 50.0, 32.0, 0.0),
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          TextField(
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(15.0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  hintText: '아이디 입력'),
                              onChanged: (String str) {
                                userName = str;
                              }),
                          SizedBox(
                            height: 25.0,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  hintText: '비밀번호 입력'),
                              onChanged: (String str) {
                                password = str;
                              }),
                          SizedBox(
                            height: 50.0,
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
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                color: orange,
                                //로그인 기능 수정 필요
                                onPressed: () {
                                  if (userName == 'dart' &&
                                      password == 'flutter') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainScreen()));
                                  } else
                                    showLoginFail(context);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: Text('로그인',
                                      style: TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0,
                                      )),
                                ),
                              )),
                          SizedBox(
                            height: 40.0,
                          ),
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '아이디 찾기',
                                style: TextStyle(
                                    color: Color.fromRGBO(119, 119, 119, 1.0),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                '|',
                                style: TextStyle(
                                    color: Color.fromRGBO(119, 119, 119, 1.0),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                '비밀번호 찾기',
                                style: TextStyle(
                                    color: Color.fromRGBO(119, 119, 119, 1.0),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                textAlign: TextAlign.left,
                              )
                            ],
                          )),
                        ],
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '가져가가 처음이신가요?',
                                style: TextStyle(
                                    color: Color.fromRGBO(119, 119, 119, 1.0),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpWidget()));
                                  },
                                  child: Text(
                                    '회원가입',
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(218, 155, 104, 1.0),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    // textAlign: TextAlign.left,
                                  )),
                            ],
                          )),
                    ],
                  ),
                ))));
  }
}

void showLoginFail(BuildContext context) {
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
                  fontSize: 18,
                ),
              ),
            ),
          ),
          content: new SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Column(children: <Widget>[
                      Text(
                        "아이디 또는 비밀번호가",
                        style: TextStyle(
                          color: Color.fromRGBO(119, 119, 119, 1.0),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "올바르지 않습니다.",
                        style: TextStyle(
                          color: Color.fromRGBO(119, 119, 119, 1.0),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
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
                              fontSize: 16.0,
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
