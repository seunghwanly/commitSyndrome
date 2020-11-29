import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gajuga_manage/main.dart';
import 'package:gajuga_manage/component/header/header.dart';
import 'package:gajuga_manage/component/body/authentification/sign_up.dart';
import 'package:gajuga_manage/component/body/authentification/user_manage.dart';
import 'package:gajuga_manage/component/body/menu/menu_page.dart';
import 'package:gajuga_manage/component/body/authentification/firebase_provider.dart';
import 'package:gajuga_manage/util/palette.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({Key key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  FirebaseAuthService _auth;
  @override
  Widget build(BuildContext context) {
    _auth = Provider.of<FirebaseAuthService>(context);
    //로그인 전 화면
    if (_auth.getUser() == null) {
      return CustomHeader(
          body: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.3,
                        0.0,
                        MediaQuery.of(context).size.width * 0.3,
                        0.0),
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
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              TextFormField(
                                maxLines: 1,
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(18.0),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    hintText: '이메일 입력'),
                                controller: _emailController,
                                onSaved: (value) =>
                                    _emailController.text = value.trim(),
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Text(
                                "가져가 비밀번호",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              TextFormField(
                                obscureText: true,
                                maxLines: 1,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(18.0),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    hintText: '비밀번호 입력'),
                                controller: _passwordController,
                                onSaved: (value) =>
                                    _passwordController.text = value.trim(),
                              ),
                              SizedBox(
                                height: 60.0,
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
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    color: orange,
                                    onPressed: () async => _submit(
                                        _auth,
                                        _emailController.text,
                                        _passwordController.text,
                                        context),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      child: Text('로그인',
                                          style: TextStyle(
                                            color: white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25.0,
                                          )),
                                    ),
                                  )),
                              SizedBox(
                                height: 50.0,
                              ),
                              Container(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '아이디 찾기',
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(119, 119, 119, 1.0),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    '     |     ',
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(119, 119, 119, 1.0),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                    textAlign: TextAlign.left,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      sendResetPasswordEmail(context);
                                    },
                                    child: Text(
                                      '비밀번호 찾기',
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              119, 119, 119, 1.0),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                      textAlign: TextAlign.left,
                                    ),
                                  )
                                ],
                              )),
                            ],
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '가져가가 처음이신가요?',
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(119, 119, 119, 1.0),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.02,
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
                                            color: Color.fromRGBO(
                                                218, 155, 104, 1.0),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )),
                                ],
                              )),
                        ]),
                  ))));
    }
    //로그인 후 화면
    else {
      return CustomHeader(
          body: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.3,
                          0.0,
                          MediaQuery.of(context).size.width * 0.3,
                          0.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'GAJUGA',
                                    style: TextStyle(
                                      color: orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 80,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 70.0,
                                  ),
                                  Text(
                                    '${_auth.getUser()?.email}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    '님 환영합니다!',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 70.0,
                                  ),
                                  FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    color: orange,
                                    onPressed: () async => {
                                      logOut(_auth, context),
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      child: Text('로그아웃',
                                          style: TextStyle(
                                            color: white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25.0,
                                          )),
                                    ),
                                  )
                                ]),
                          ])))));
    }
  }
}

//로그인 이메일 비밀번호 서버에 전송
Future<bool> _submit(FirebaseAuthService auth, String email, String password,
    BuildContext context) async {
  try {
    var result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    if (result != null) {
      auth.setUser(result);
      if (!auth.getUser().emailVerified) {
        auth.signOut();
        showLoginFail(context);
        return false;
      }
      MainScreen.userid = auth.getUser().uid;
      UserManage().checkAuth(MainScreen.userid);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MenuPage()));
      return true;
    } else {
      showLoginFail(context);
      return false;
    }
  } on Exception catch (e) {
    showLoginFail(context);
  }
}

//로그아웃
Future<void> logOut(FirebaseAuthService auth, BuildContext context) async {
  auth.signOut();
  MainScreen.userid = '';
  MainScreen.userAuth = '';
  Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPage()));
}

//로그인 실패 오류 모달
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
                        "아이디 또는 비밀번호가",
                        style: TextStyle(
                          color: Color.fromRGBO(119, 119, 119, 1.0),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "올바르지 않습니다.",
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

void sendResetPasswordEmail(BuildContext context) {
  final _emailControl = TextEditingController();
  FirebaseAuthService auth;
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        auth = Provider.of<FirebaseAuthService>(context);
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
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Column(children: <Widget>[
                      Text(
                        "비밀번호 재 설정 메일 전송",
                        style: TextStyle(
                          color: Color.fromRGBO(119, 119, 119, 1.0),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      TextFormField(
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15.0),
                            filled: true,
                            fillColor: Color.fromRGBO(220, 220, 220, 1.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            hintText: '이메일 입력'),
                        controller: _emailControl,
                        onSaved: (value) => _emailControl.text = value.trim(),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
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
                        child: Text('전송',
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            )),
                        onPressed: () async {
                          await auth.sendPasswordResetEmail(_emailControl.text);
                          Navigator.pop(context);
                        }),
                  ),
                ]),
          ),
        );
      });
}
