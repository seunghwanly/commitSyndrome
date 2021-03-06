import 'package:flutter/material.dart';
import '../../util/to_text.dart';
import '../../util/palette.dart';
import '../../util/to_locale.dart';

showOrderHistoryModal(BuildContext c, Map<String, dynamic> list) {
  int totalCost = 0;
  totalCost = list['totalCost'];

  // for (int i = 0; i < list['content'].length; ++i) {
  //   totalCost += list['content'][i]['cost'];
  // }

  return showDialog(
      context: c,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)), //this right here
          child: Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.height * 0.4 <
                      MediaQuery.of(context).size.width
                  ? MediaQuery.of(context).size.height * 0.4
                  : MediaQuery.of(context).size.width * 0.9,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    width: MediaQuery.of(context).size.width * 0.9,
                    top: 5.0,
                    right: 5.0,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      alignment: Alignment.centerRight,
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(bottom: 20),
                            child: Column(children: [
                              makeTextSize("전자영수증", darkblue, 0.0, 24),
                              makeTextSize(
                                  "e-Reciept / History", lightgrey, 0.0, 15)
                            ])),
                        // title and button X //e-Reciept / History
                        Divider(),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              makeTextSize("주문 정보", darkblue, 0.0, 20.0),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 15, top: 5, bottom: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    makeTextSize('주문 번호', lightgrey, 0.0, 14),
                                    makeTextSize(
                                        list['orderNumber'], lightgrey, 0.0, 14)
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 15, top: 5, bottom: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    makeTextSize('주문 시간', lightgrey, 0.0, 14),
                                    Column(
                                      children: [
                                        makeTextSize(
                                            list['orderTimes']['requestTime']
                                                .toString()
                                                .substring(0, 10),
                                            lightgrey,
                                            0.0,
                                            14),
                                        makeTextSize(
                                            list['orderTimes']['requestTime']
                                                .toString()
                                                .substring(
                                                    10,
                                                    list['orderTimes']
                                                                ['requestTime']
                                                            .toString()
                                                            .length -
                                                        7),
                                            lightgrey,
                                            0.0,
                                            14)
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ), //order info : number and orderTime
                        Divider(),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              makeTextSize("주문 내역", darkblue, 0.0, 20.0),
                              Container(
                                height: MediaQuery.of(context).size.height *
                                    (0.04 + 0.02 * list['contents'].length),
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: list['contents'].length,
                                  itemBuilder: (BuildContext context, int idx) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                          left: 15, top: 5, bottom: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          makeTextSize(
                                              list['contents'][idx]['name'],
                                              lightgrey,
                                              0.0,
                                              14),
                                          makeTextSize(
                                              toLocaleString(list['contents']
                                                      [idx]['cost']) +
                                                  ' 원',
                                              lightgrey,
                                              0.0,
                                              14),
                                          makeTextSize(
                                              '*   ' +
                                                  list['contents'][idx]['count']
                                                      .toString(),
                                              lightgrey,
                                              0.0,
                                              14),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ), //order info : content
                        ),
                        Divider(),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              makeTextSize('상품 합계', darkblue, 0.0, 18),
                              makeTextSize(toLocaleString(totalCost) + ' 원',
                                  darkblue, 0.0, 18),
                            ],
                          ),
                        ), //total cost
                        Divider(),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              makeTextSize('결제 합계', orange, 0.0, 18),
                              makeTextSize(toLocaleString(totalCost) + ' 원',
                                  orange, 0.0, 18),
                            ],
                          ),
                        ), //paid cost
                      ],
                    ),
                    padding: EdgeInsets.all(20.0),
                  )
                ],
              )
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [

              //   ],
              // ),
              ),
        );
      });
}
