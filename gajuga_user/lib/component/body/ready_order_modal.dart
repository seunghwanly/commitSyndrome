import 'package:flutter/material.dart';
import '../../util/to_text.dart';
import '../../util/palette.dart';
import '../../util/box_shadow.dart';
import 'package:gajuga_user/main.dart';

showReadyModal(BuildContext c) {
  return showDialog(
      context: c,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)), //this right here
          child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(bottom: 20),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  makeTextSize(
                                      "GAJUGA 알림",
                                      Color.fromRGBO(51, 51, 51, 1),
                                      0.0,
                                      MediaQuery.of(context).size.width / 16),
                                ])),
                        Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(bottom: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  makeTextSize(
                                      "주문하신 메뉴가 준비되었습니다",
                                      lightgrey,
                                      0.0,
                                      MediaQuery.of(context).size.width / 25),
                                  makeTextSize("매장에서 픽업해가세요", lightgrey, 0.0,
                                      MediaQuery.of(context).size.width / 25)
                                ])),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => mainBody()));
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width *
                                    (120 / 375),
                                height: MediaQuery.of(context).size.height *
                                    (45 / 812),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(218, 155, 104, 0.95),
                                    boxShadow: [customeBoxShadow()],
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '확인',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1.0),
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                26),
                                        textAlign: TextAlign.center,
                                      ),
                                    ]))),
                      ],
                    ),
                    padding: EdgeInsets.all(30.0),
                  )
                ],
              )),
        );
      });
}
