import 'package:flutter/material.dart';
import 'package:gajuga_user/component/body/approval_order.dart';
import 'package:gajuga_user/util/palette.dart';

/* 아임포트 결제 모듈을 불러옵니다. */
import 'package:iamport_flutter/iamport_payment.dart';
/* 아임포트 결제 데이터 모델을 불러옵니다. */
import 'package:iamport_flutter/model/payment_data.dart';
import 'package:loading_animations/loading_animations.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IamportPayment(
      appBar: new AppBar(
        title: new Text('아임포트 결제'),
      ),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: pale,
        child: Text('Loading .. . ..', style: TextStyle(color: white),),
        ),

      /* [필수입력] 가맹점 식별코드 */
      userCode: 'imp30810955',
      /* [필수입력] 결제 데이터 */
      data: PaymentData.fromJson({
        'pg': 'kakaopay',                                          // PG사
        'payMethod': 'card',                                           // 결제수단
        'name': '가주가 GAJUGA',                                  // 주문명
        'merchantUid': 'mid_${new DateTime.now().millisecondsSinceEpoch}', // 주문번호
        'amount': 3000,                                               // 결제금액
        'buyerName': '홍길동',                                           // 구매자 이름
        'buyerTel': '01012345678',                                     // 구매자 연락처
        'buyerEmail': 'example@naver.com',                             // 구매자 이메일
        'buyerAddr': '서울시 강남구 신사동 661-16',                         // 구매자 주소
        'buyerPostcode': '06018',                                      // 구매자 우편번호
        'appScheme': 'example',                                        // 앱 URL scheme
        'display' : {
          'cardQuota' : [2,3]                                            //결제창 UI 내 할부개월수 제한
        }
      }),
      /* [필수입력] 콜백 함수 */
      callback: (Map<String, String> result) {
        // Navigator.pushReplacementNamed(
        //   context,
        //   '/result',
        //   arguments: result,
        // );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ApprovalOrder(),), result: result);
      },
    );
  }
}