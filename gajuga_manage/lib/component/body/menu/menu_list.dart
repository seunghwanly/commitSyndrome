import 'package:flutter/material.dart';
import 'package:gajuga_manage/model/menu_model.dart';
import 'package:gajuga_manage/util/borders.dart';
import 'package:gajuga_manage/util/firebase_method.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_locale.dart';
import 'package:gajuga_manage/util/to_text.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animations/loading_animations.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  // needed MenuList
  var menuDatabaseFetched;

  final List<String> data = <String>['A', 'B', 'C', 'D'];
  final _formKey = GlobalKey<FormState>();
  File _menuImage;
  final picker = ImagePicker();

  void _menuUpdated() {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: new Text("메뉴 수정이 완료되었습니다.")));
  }

  @override
  void initState() {
    super.initState();
    menuDatabaseFetched = FirebaseMethod().getMenuData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // ------------------------------------------ DATABASE 에서 가져온 데이터
      future: menuDatabaseFetched,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          /*
              database : 
              - manager
                  ㄴ menu
                      ㄴ category           -> this.menuDatabaseFetched로 받아온 데이터 덩어리
                          ㄴ  pizza []
                          ㄴ  beverage []
           
          ~ 2020/11/22
           TODO : beverage 를 받아올 때 오류가 날 수 있습니다 ! 아직 데이터 베이스 수정을 안해서 하면 알려드릴게요 !
            
            주영님 꺼
            TODO: 검색어 입력됐을 때 검색하면 수정할 메뉴를 띄워 주는 게 구현하기 편한가요? 아니면 해당 메뉴 색칠되는게 편한가요 ?
            둘중에 편한 걸로 해주세요 !
           */
          // pizza []
          List<Information> pizza = Menu.fromJson(snapshot.data).pizza;
          // beverage []
          List<Information> beverage = Menu.fromJson(snapshot.data).beverage;

          return Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  makeSubTitle('피자', ' PIZZA'),
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03,
                    ),
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: pizza.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _listItem(
                          pizza[index].name,
                          AssetImage('images/${pizza[index].engName}.png'),
                          pizza[index].desc,
                          pizza[index].cost,
                          context,
                        );
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  makeSubTitle('파스타', ' PASTA'),
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03,
                    ),
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _listItem(
                          data[index],
                          AssetImage('images/${data[index]}.png'),
                          'desc',
                          12900,
                          context,
                        );
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  makeSubTitle('음료', ' BEVERAGE'),
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03,
                    ),
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _listItem(
                          data[index],
                          AssetImage('images/${data[index]}.png'),
                          'desc',
                          12900,
                          context,
                        );
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return LoadingBouncingGrid.circle(
            borderColor: orange,
            size: 50.0,
            backgroundColor: Colors.transparent,
            duration: Duration(milliseconds: 5000),
          );
        }
      },
    );
  }

  Widget _listItem(String title, AssetImage image, String desc, int cost,
      BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width * 0.18;
    double itemHeight = MediaQuery.of(context).size.width * 0.35;

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
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: image,
            radius: 35,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              Text(
                desc,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: lightgrey,
                    fontSize: 11.0),
                textAlign: TextAlign.center,
              ),
              Text(
                '${toLocaleString(cost)} 원',
                style:
                    TextStyle(fontWeight: FontWeight.normal, color: darkblue),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          FlatButton(
            color: orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () {
              showMenuEditDialog(context);
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "수정하기",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future showMenuEditDialog(BuildContext context) {
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
                                text: '메뉴',
                                style: TextStyle(color: darkgrey),
                              ),
                              TextSpan(
                                text: ' 수정',
                                style: TextStyle(color: orange),
                              ),
                            ],
                          ),
                        ),
                        menuImageView(),
                        SizedBox(height: 20),
                        nameField(),
                        priceField(),
                        extraField(),
                        SizedBox(height: 10),
                        FlatButton(
                          color: orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            _menuUpdated();
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

  Widget menuImageView() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: CircleAvatar(
              radius: 65.0,
              backgroundImage: _menuImage == null
                  ? AssetImage('images/A.png')
                  : FileImage(_menuImage),
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
                  // getMenuImage();
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

  Future getMenuImage() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery); // TODO: app crash 해결해야함

    setState(() {
      if (pickedFile != null) {
        _menuImage = File(pickedFile.path);
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
                enabledBorder: roundInputBorder,
                focusedBorder: roundInputBorder,
                hintText: '이름 입력',
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget priceField() {
    return Row(
      children: [
        Text(
          '가       격',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                enabledBorder: roundInputBorder,
                focusedBorder: roundInputBorder,
                hintText: '가격 입력',
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget extraField() {
    return Row(
      children: [
        Text(
          '추가사항',
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
                enabledBorder: roundInputBorder,
                focusedBorder: roundInputBorder,
                hintText: '추가사항 입력',
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
