import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/box_shadow.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_text.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class StaffProfile extends StatefulWidget {
  @override
  _StaffProfileState createState() => _StaffProfileState();
}

class _StaffProfileState extends State<StaffProfile> {
  final List<String> data = <String>['김관우', '박종하', '이승환', '이주영'];
  TextEditingController searchController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  OutlineInputBorder _formBorder = OutlineInputBorder(borderRadius: BorderRadius.circular(40), borderSide: BorderSide(color: Colors.grey[300]));
  File _profileImage;
  final picker = ImagePicker();

  void _profileUpdated() {
    Scaffold.of(context).showSnackBar(SnackBar(content: new Text("직원 프로필 수정이 완료되었습니다.")));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Colors.white,
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                makeTitle('직원', ' 프로필 수정'),
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  onPressed: () { },
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                  ),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _listItem(
                        data[index],
                        AssetImage('images/default_profile.jpg'),
                        '직원',
                        '010-1234-1234',
                        context,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listItem(String name, AssetImage image, String position, String phone, BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width * 0.2;
    double itemHeight = MediaQuery.of(context).size.width * 0.5;

    return Container(
      width: itemWidth,
      height: itemHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 40, bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: image,
            radius: 35,
          ),
          staffProfileText(position, name, phone),
          FlatButton(
            color: orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () {
              showProfileDialog(context);
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "수정하기",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future showProfileDialog(BuildContext context) {
    return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              right: -40.0,
              top: -40.0,
              child: InkResponse(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.red,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                        children: [
                          TextSpan(
                            text: '직원',
                            style: TextStyle(color: darkgrey),
                          ),
                          TextSpan(
                            text: ' 프로필 수정',
                            style: TextStyle(color: orange),
                          ),
                        ],
                      ),
                    ),
                    userImageView(),
                    SizedBox(height: 20),
                    nameField(),
                    phoneField(),
                    addressField(),
                    accountNumberField(),
                    SizedBox(height: 10),
                    FlatButton(
                      color: orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        _profileUpdated();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "저장하고 닫기",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget userImageView() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: CircleAvatar(
              radius: 65.0,
              backgroundImage: _profileImage == null
                  ? AssetImage('images/default_profile.jpg')
                  : FileImage(_profileImage),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xFFe0e0e0)),
                borderRadius: BorderRadius.circular(50.0)),
              padding: EdgeInsets.all(0),
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () {
                  // getProfileImage();
                },
                icon: Icon(
                  Icons.camera_alt,
                  size: 20,
                  color: Color(0xFFbbbbbb),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery); // TODO: app crash 해결해야함

    setState(() {
      if (pickedFile != null) {
        _profileImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Widget nameField() {
    return Row(
      children: [
        Text(
          '이       름',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(
                enabledBorder: _formBorder,
                hintText: '이름',
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget phoneField() {
    return Row(
      children: [
        Text(
          '전화번호',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(
                enabledBorder: _formBorder,
                hintText: '전화번호',
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget addressField() {
    return Row(
      children: [
        Column(
          children: [
            Text(
              '주       소',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
        Flexible(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    enabledBorder: _formBorder,
                    hintText: '우편번호',
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3,
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    enabledBorder: _formBorder,
                    hintText: '상세주소',
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget accountNumberField() {
    return Row(
      children: [
        Column(
          children: [
            Text(
              '계좌번호',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 50),
          ],
        ),
        Flexible(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    enabledBorder: _formBorder,
                    hintText: '은행',
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    enabledBorder: _formBorder,
                    hintText: '계좌번호',
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
