import 'package:flutter/material.dart';
import '../body/shopping_cart.dart';
import 'package:gajuga_user/util/box_shadow.dart';
import '../../util/to_text.dart';
import '../../util/box_shadow.dart';
import '../../util/palette.dart';
import '../header/header.dart';
import 'ready_order_modal.dart';

class OrderState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomHeader(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * (44 / 812),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              makeTitle('주문', ' 내역'),
            ],
          ),
        ),
        Container(
          //color: Colors.black54,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * (650 / 812),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/bulgogi.png'),
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Text('이미지'),
                        CircleAvatar(
                          radius:
                              MediaQuery.of(context).size.width * (15 / 375),
                          backgroundColor: Color.fromRGBO(0xff, 0xee, 0xe4, 1),
                        ),
                        makeWhiteText('결제완료', Colors.white, 0, 0,
                            MediaQuery.of(context).size.width / 26),
                        makeWhiteText('19시 35분 05초', Colors.white, 0, 5,
                            MediaQuery.of(context).size.width / 26),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius:
                                MediaQuery.of(context).size.width * (15 / 375),
                            backgroundColor:
                                Color.fromRGBO(0xf1, 0x7f, 0x42, 1),
                          ),
                          makeWhiteText('주문요청', Colors.white, 0, 5,
                              MediaQuery.of(context).size.width / 26),
                          makeWhiteText('19시 35분 22초', Colors.white, 0, 5,
                              MediaQuery.of(context).size.width / 26),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius:
                                MediaQuery.of(context).size.width * (15 / 375),
                            backgroundColor:
                                Color.fromRGBO(0xce, 0x6d, 0x39, 1),
                          ),
                          makeWhiteText('주문승인', Colors.white, 0, 5,
                              MediaQuery.of(context).size.width / 26),
                          makeWhiteText('19시 36분 05초', Colors.white, 0, 5,
                              MediaQuery.of(context).size.width / 26),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius:
                                MediaQuery.of(context).size.width * (15 / 375),
                            backgroundColor:
                                Color.fromRGBO(0x00, 0x00, 0x00, 1),
                          ),
                          makeWhiteText('준비완료', Colors.white, 0, 5,
                              MediaQuery.of(context).size.width / 26),
                          makeWhiteText('19시 38분 05초', Colors.white, 0, 5,
                              MediaQuery.of(context).size.width / 26),
                        ],
                      )),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        showReadyModal(context);
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width:
                              MediaQuery.of(context).size.width * (340 / 375),
                          height:
                              MediaQuery.of(context).size.height * (120 / 812),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1.00),
                              boxShadow: [customeBoxShadow()],
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    (340 / 375) *
                                    0.3,
                                height: MediaQuery.of(context).size.height *
                                    (120 / 812),
                                //color: Colors.black26,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius:
                                          MediaQuery.of(context).size.height *
                                              (40 / 812),
                                      backgroundImage:
                                          AssetImage('images/potato.png'),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width *
                                    (340 / 375) *
                                    0.7,
                                height: MediaQuery.of(context).size.height *
                                    (120 / 812),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    makeWhiteText(
                                        '주문번호 : A-123',
                                        Color.fromRGBO(33, 33, 31, 1),
                                        0,
                                        5,
                                        MediaQuery.of(context).size.width / 25),
                                    makeWhiteText(
                                        '루꼴라피자 외 2개',
                                        Color.fromRGBO(33, 33, 31, 1),
                                        0,
                                        5,
                                        MediaQuery.of(context).size.width / 27),
                                    makeWhiteText(
                                        '총 금액 : 42,700 Won',
                                        Color.fromRGBO(119, 119, 119, 1),
                                        0,
                                        5,
                                        MediaQuery.of(context).size.width / 27),
                                  ],
                                ),
                                //color: Colors.black87,
                              )
                            ],
                          )))
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
