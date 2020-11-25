import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService with ChangeNotifier {
  FirebaseAuthService({auth}) : _auth = auth ?? FirebaseAuth.instance;

  FirebaseAuth _auth;
  User _user;

//getter
  User getUser() {
    return _user;
  }

//setter
  void setUser(User value) {
    _user = value;
  }

  //파이어베이스 로그인
  Future<User> signInWithEmailAndPassword(
      {@required String email, @required String password}) async {
    final credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    final authResult = await _auth.signInWithCredential(credential);
    setUser(authResult.user);
    return authResult.user;
  }

  //파이어베이스 로그아웃
  Future<void> signOut() async {
    await _auth.signOut();
    setUser(null);
  }

  //파이어베이스 회원가입
  Future<int> signUpWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        result.user.sendEmailVerification();
        signOut();
        return 0;
      }
      return 4;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 1;
      } else if (e.code == 'weak-password') {
        return 2;
      }
    } catch (e) {
      print(e);
      return 5;
    }
  }

//비밀번호 재설정 메일 전송
  Future<void> sendPasswordResetEmail(String email) async {
    _auth.sendPasswordResetEmail(email: email);
  }
}
