import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gajuga_manage/component/header/header.dart';
import 'package:gajuga_manage/component/body/authentification/login.dart';
import 'package:gajuga_manage/component/body/authentification/role_radio.dart';
import 'package:gajuga_manage/component/body/authentification/firebase_provider.dart';
import 'package:gajuga_manage/util/palette.dart';

class SignUpWidget extends StatelessWidget {
  SignUpWidget({Key key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordCkController = TextEditingController();
  final _phoneController = TextEditingController();

  FirebaseAuthService _auth;

  @override
  Widget build(BuildContext context) {
    _auth = Provider.of<FirebaseAuthService>(context);
    return CustomHeader(
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: SingleChildScrollView(
                child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(400.0, 40.0, 400.0, 0.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "직책 선택",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    RoleRadio(),
                    Text(
                      "가져가 아이디",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(children: <Widget>[
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15.0),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            hintText: '이메일 입력',
                          ),
                          controller: _emailController,
                          onSaved: (value) =>
                              _emailController.text = value.trim(),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(3.0),
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
                                  fontSize: 22.0,
                                )),
                            onPressed: () {
                              showIdConfirm(context, _emailController.text);
                            }),
                      )
                    ]),
                    SizedBox(height: 10.0),
                    Text(
                      "가져가 비밀번호",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15.0),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          hintText: '비밀번호 입력'),
                      controller: _passwordController,
                      onSaved: (value) =>
                          _passwordController.text = value.trim(),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15.0),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        hintText: '비밀번호 확인',
                      ),
                      controller: _passwordCkController,
                      onSaved: (value) =>
                          _passwordCkController.text = value.trim(),
                    ),
                    Text(
                      " 6자리 이상의 문자를 입력하세요.",
                      style: TextStyle(
                        color: orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "휴대폰 입력",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(children: <Widget>[
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15.0),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              hintText: '휴대폰 번호 입력'),
                          controller: _phoneController,
                          onSaved: (value) =>
                              _phoneController.text = value.trim(),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(3.0),
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
                                  fontSize: 22.0,
                                )),
                            onPressed: () {
                              showPhoneConfirm(context, _phoneController.text);
                            }),
                      )
                    ]),
                    Text(
                      " - 을 빼고 입력하세요.",
                      style: TextStyle(
                        color: orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 30.0),
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
                          onPressed: () async {
                            int ckError = 0;
                            if (_emailController.text != '' &&
                                _passwordController.text != '' &&
                                _passwordCkController.text != '' &&
                                _phoneController.text != '') {
                              if (_passwordController.text !=
                                  _passwordCkController.text) {
                                ckError = 3;
                                showSignUpFail(
                                    context, ckError); //비밀번호와 비밀번호 확인이 다름
                              }
                              if (ckError != 3) {
                                _signUp(context);
                              }
                            } else {
                              ckError = 4;
                              showSignUpFail(context, ckError);
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: Text('회원가입',
                                style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                )),
                          ),
                        )),
                  ]),
            ))));
  }

  void _signUp(BuildContext context) async {
    int result = await _auth.signUpWithEmail(
        _emailController.text, _passwordController.text);
    if (result == 0) {
      showSignUpSuccess(context);
    } else if (result == null) {
      showSignUpFail(context, 4);
    } else {
      showSignUpFail(context, result);
    }
  }
}

void showIdConfirm(BuildContext context, String id) {
  bool ckEmail = false;
  if (id.isEmpty) {
    ckEmail = false;
  }
  Pattern pattern = r'^\w+@[a-zA-Z]+?\.[a-zA-Z]{2,3}$';
  RegExp exp = RegExp(pattern);

  if (exp.hasMatch(id)) {
    ckEmail = true;
  } else {
    ckEmail = false;
  }

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        if (ckEmail == true) {
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
                          id,
                          style: TextStyle(
                            color: Color.fromRGBO(119, 119, 119, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "이메일 형식이 맞습니다.",
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Text('사용하기',
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
        } else {
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
                          id,
                          style: TextStyle(
                            color: Color.fromRGBO(119, 119, 119, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "이메일 형식이 올바르지 않습니다.",
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Text('다시입력',
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
        }
      });
}

void showPhoneConfirm(BuildContext context, String phone) {
  bool ckPhone = false;
  if (phone.isEmpty) {
    ckPhone = false;
  }

  Pattern pattern = r'^\d{3}\d{3,4}\d{4}$';
  RegExp exp = RegExp(pattern);

  if (exp.hasMatch(phone)) {
    ckPhone = true;
  } else {
    ckPhone = false;
  }
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        if (ckPhone == true) {
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
                          phone,
                          style: TextStyle(
                            color: Color.fromRGBO(119, 119, 119, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "번호가 올바르게 입력되었습니다.",
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
        } else {
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
                          phone,
                          style: TextStyle(
                            color: Color.fromRGBO(119, 119, 119, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "번호가 올바르지 않습니다.",
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
                          child: Text('다시입력',
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
        }
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
                        "환영합니다!",
                        style: TextStyle(
                          color: Color.fromRGBO(119, 119, 119, 1.0),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "이메일 인증 후 사용하세요.",
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
                          print(RoleRadio.role);
                          Navigator.pop(context);
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

void showSignUpFail(BuildContext context, int error) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        //중복된 이메일 존재 오류
        if (error == 1) {
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
                          "중복된 이메일이",
                          style: TextStyle(
                            color: Color.fromRGBO(119, 119, 119, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "존재합니다!",
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
        }
        //비밀번호 보안이 약함 오류
        if (error == 2) {
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
                          "비밀번호가",
                          style: TextStyle(
                            color: Color.fromRGBO(119, 119, 119, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "너무 약합니다!",
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
        }

//비밀번호 일치 확인 오류
        if (error == 3) {
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
                          "입력한 비밀번호와",
                          style: TextStyle(
                            color: Color.fromRGBO(119, 119, 119, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "다시 입력한 비밀번호가 다릅니다!",
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
        }

        //빈칸 오류
        if (error == 4) {
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
                          "모든 정보를",
                          style: TextStyle(
                            color: Color.fromRGBO(119, 119, 119, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "올바르게 입력하세요!",
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
        }
      });
}
