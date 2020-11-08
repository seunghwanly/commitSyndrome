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
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.85,
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(32.0, 40.0, 32.0, 0.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "가져가 아이디",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Row(children: <Widget>[
                        Flexible(
                          child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
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
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text('확인',
                                  style: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  )),
                              onPressed: () {
                                showIdConfirm(context, userName);
                              }),
                        )
                      ]),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "가져가 비밀번호",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              hintText: '비밀번호 입력'),
                          onChanged: (String str) {
                            password = str;
                          }),
                      TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15.0),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              hintText: '비밀번호 입력'),
                          onChanged: (String str) {
                            passwordCheck = str;
                          }),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "휴대폰 인증",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Row(children: <Widget>[
                        Flexible(
                          child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
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
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text('인증',
                                  style: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  )),
                              onPressed: () {
                                showPhoneConfirm(context, phone);
                              }),
                        )
                      ]),
                      Container(
                        padding: EdgeInsets.only(right: 110.0),
                        child: TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                hintText: '인증 번호 입력'),
                            onChanged: (String str) {
                              authNum = str;
                            }),
                      ),
                      SizedBox(
                        height: 8.0,
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
                          onPressed: () {
                            showSignUpSuccess(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Text('회원가입',
                                style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0,
                                )),
                          ),
                        ),
                      ),
                    ]),
              ),
            )));
  }
}

void showIdConfirm(BuildContext context, String id) {
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
                        id,
                        style: TextStyle(
                          color: Color.fromRGBO(119, 119, 119, 1.0),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "는 사용가능한 아이디 입니다.",
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
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text('사용하기',
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

void showPhoneConfirm(BuildContext context, String phone) {
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
                        phone,
                        style: TextStyle(
                          color: Color.fromRGBO(119, 119, 119, 1.0),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "로 인증번호가 전송되었습니다.",
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

void showSignUpSuccess(BuildContext context) {
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
                        "회원가입이",
                        style: TextStyle(
                          color: Color.fromRGBO(119, 119, 119, 1.0),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "성공적으로 되었습니다.",
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginWidget()));
                        }),
                  ),
                ]),
          ),
        );
      });
}
