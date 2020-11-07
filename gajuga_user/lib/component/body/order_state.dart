import 'package:flutter/material.dart';
import '../body/shopping_cart.dart';
import 'package:gajuga_user/util/box_shadow.dart';
import '../../util/to_text.dart';
import '../../util/box_shadow.dart';
import '../../util/palette.dart';
import '../header/header.dart';
import '../body/order_state.dart';

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
            image: AssetImage('images/A.png'),
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('이미지'),
                      makeWhiteText('결제완료', Colors.white, 0, 0,
                          MediaQuery.of(context).size.width / 25),
                      Text('19시35분05초'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('이미지'),
                      Text('주문요청'),
                      Text('19시35분22초'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('이미지'),
                      Text('주문승인'),
                      Text('19시36분05초'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('이미지'),
                      Text('준비완료'),
                      Text('19시38분05초'),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * (340 / 375),
                    height: MediaQuery.of(context).size.height * (120 / 812),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1.00),
                        boxShadow: [customeBoxShadow()],
                        borderRadius: BorderRadius.circular(20)),
                  )
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
