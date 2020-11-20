import 'package:flutter/material.dart';
import 'package:gajuga_manage/util/palette.dart';

class RoleRadio extends StatefulWidget {
  static int role;
  @override
  _RoleRadioState createState() => _RoleRadioState();
}

class _RoleRadioState extends State<RoleRadio> {
  int _role;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () => {setState(() => _role = 0), RoleRadio.role = _role},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: _role == 0 ? orange : Color.fromRGBO(234, 230, 218, 1.0),
              ),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.height * 0.12,
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              child: Column(children: <Widget>[
                Image(image: AssetImage('images/icon/adminCheck.png')),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "관리자",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: _role == 0
                        ? Colors.white
                        : Color.fromRGBO(119, 119, 119, 1.0),
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(width: 50.0),
          GestureDetector(
            onTap: () => {
              setState(() => _role = 1),
              RoleRadio.role = _role,
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: _role == 1 ? orange : Color.fromRGBO(234, 230, 218, 1.0),
              ),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.height * 0.12,
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              child: Column(children: <Widget>[
                Image(image: AssetImage('images/icon/empCheck.png')),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "직원",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: _role == 1
                        ? Colors.white
                        : Color.fromRGBO(119, 119, 119, 1.0),
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(width: 50.0),
          GestureDetector(
            onTap: () => {setState(() => _role = 2), RoleRadio.role = _role},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: _role == 2 ? orange : Color.fromRGBO(234, 230, 218, 1.0),
              ),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.height * 0.12,
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              child: Column(children: <Widget>[
                Image(image: AssetImage('images/icon/chefCheck.png')),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "셰프",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: _role == 2
                        ? Colors.white
                        : Color.fromRGBO(119, 119, 119, 1.0),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
