import 'package:flutter/material.dart';
import 'package:gajuga_user/util/box_shadow.dart';
import '../../util/box_shadow.dart';
import '../../util/palette.dart';
import '../header/header.dart';
import '../body/order_state.dart';

class ApprovalOrder extends StatelessWidget {
  void _goOrderState(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OrderState()));
  }

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: <Widget>[
            Center(
                child: Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Text(
                      '주문승인 대기 중',
                      style: TextStyle(
                          color: Color.fromRGBO(33, 33, 31, 1.0),
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width / 9),
                      textAlign: TextAlign.center,
                    ))),
            Center(
                child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text(
                '가게에서 주문 확인 중입니다',
                style: TextStyle(
                    color: Color.fromRGBO(33, 33, 31, 1.0),
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width / 16),
                textAlign: TextAlign.center,
              ),
            )),
            Center(
                child: Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Column(
                      children: [
                        Text(
                          '가게 사정에 따라 주문이 취소될 수 있습니다',
                          style: TextStyle(
                              color: Color.fromRGBO(33, 33, 31, 1.0),
                              fontWeight: FontWeight.w500,
                              fontSize: MediaQuery.of(context).size.width / 25),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '접수되면 알려드릴게요',
                          style: TextStyle(
                              color: Color.fromRGBO(33, 33, 31, 1.0),
                              fontWeight: FontWeight.w500,
                              fontSize: MediaQuery.of(context).size.width / 25),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ))),
            Text(
              '주문 상황은 주문내역에서',
              style: TextStyle(
                  color: Color.fromRGBO(33, 33, 31, 1.0),
                  fontWeight: FontWeight.w500,
                  fontSize: MediaQuery.of(context).size.width / 25),
              textAlign: TextAlign.center,
            ),
            Text(
              '언제든 확인하실 수 있습니다',
              style: TextStyle(
                  color: Color.fromRGBO(33, 33, 31, 1.0),
                  fontWeight: FontWeight.w500,
                  fontSize: MediaQuery.of(context).size.width / 25),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * (50 / 812)),
              width: MediaQuery.of(context).size.width * (60 / 375),
              height: MediaQuery.of(context).size.width * (60 / 375),
              decoration: BoxDecoration(
                  color: white,
                  boxShadow: [customeBoxShadow()],
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * (60 / 375))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.refresh),
                    color: Color.fromRGBO(0, 0, 0, 1.0),
                    onPressed: () => _goOrderState(context),
                    iconSize: MediaQuery.of(context).size.width * (40 / 375),
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * (345 / 375),
              height: MediaQuery.of(context).size.height * (70 / 812),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(218, 155, 104, 0.95),
                  boxShadow: [customeBoxShadow()],
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '홈으로 돌아가기',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width / 21),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '주문내역 보기',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width / 21),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}
