import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/box_shadow.dart';
import 'package:gajuga_manage/util/palette.dart';

class Menu {
  final String title;
  bool selected;

  Menu({this.title, this.selected = false});
}

class HeaderButton extends StatefulWidget {
  @override
  _HeaderButtonState createState() => _HeaderButtonState();
}

class _HeaderButtonState extends State<HeaderButton> {
  final List<Menu> menuList = [
    Menu(title: '메뉴관리', selected: true),
    Menu(title: '직원관리'),
    Menu(title: '매출관리'),
    Menu(title: '재고관리'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: menuList.length,
      shrinkWrap: true,
      childAspectRatio: 2/1,
      children: List.generate(menuList.length, (index) {
        return InkWell(
          onTap: () {
            setState(() {
              for (int i = 0; i < menuList.length; i++) {
                menuList[i].selected = false;
              }
              menuList[index].selected = !menuList[index].selected;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              boxShadow: [customBoxShadow()],
              color: menuList[index].selected ? orange : darkgrey,
            ),
            child: Center(
              child: Text(
                menuList[index].title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.width / 32,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
