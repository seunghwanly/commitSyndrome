import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gajuga_manage/component/body/stock/stock_page.dart';
import 'package:gajuga_manage/model/menu_model.dart';
import 'package:gajuga_manage/util/firebase_method.dart';
import 'package:gajuga_manage/util/loading.dart';
import 'package:gajuga_manage/util/palette.dart';
import 'package:gajuga_manage/util/to_text.dart';

class AddStock extends StatefulWidget {
  final formKey, onCancel, pageIdx;

  AddStock({this.formKey, this.onCancel, this.pageIdx});

  @override
  AddStockState createState() => AddStockState();
}

class AddStockState extends State<AddStock> {
  // final scrollbar
  final ScrollController _pizzaController = new ScrollController();
  // textController
  final List<TextEditingController> _pizzaTextController =
      new List<TextEditingController>();
  final List<TextEditingController> _beverageTextController =
      new List<TextEditingController>();

  // stock reference
  var stockDatabaseFetched;

  @override
  void initState() {
    super.initState();
    stockDatabaseFetched = FirebaseMethod().getCurrentStockData();
  }

  // firebase update
  updateDatabase(Ingredients pizzaUploadData,
      BeverageIngredients beverageUploadData) async {
    await FirebaseMethod()
        .stockReference
        .child('pizza')
        .set(pizzaUploadData.toJson())
        .then((value) {
      print("pizza current Stock updated !");

      FirebaseMethod()
          .stockReference
          .child('beverage')
          .set(beverageUploadData.toJson())
          .then((value) {
        print("beverage data uploaded!");
      }).catchError(() {
        print("beverage upload error :(");
      });
    }).catchError(() {
      print("pizza current stock error :(");
    });
  }

  void handleSaveButton() {
    var checkPizzaText = 0;

    _pizzaTextController.forEach((element) {
      if (element.text.trim() != "") checkPizzaText++;
    });

    if (checkPizzaText == _pizzaTextController.length) {
      var pizzaIngrendients = Ingredients(
        sourceA: int.parse(_pizzaTextController[0].text.trim()),
        sourceB: int.parse(_pizzaTextController[1].text.trim()),
        sourceC: int.parse(_pizzaTextController[2].text.trim()),
        sourceD: int.parse(_pizzaTextController[3].text.trim()),
        sourceE: int.parse(_pizzaTextController[4].text.trim()),
        sourceF: int.parse(_pizzaTextController[5].text.trim()),
      );

      var beverageIngredients = BeverageIngredients(
          cider: int.parse(_beverageTextController[0].text.trim()),
          coke: int.parse(_beverageTextController[1].text.trim()));

      if (widget.formKey.currentState.validate()) {
        print("validate!");

        updateDatabase(pizzaIngrendients, beverageIngredients);
        showModal("성공적으로 업데이트 했습니다 !", 1);
        // ?
        //         : showModal("업데이트 실패 :(", 0)
      }
    } else
      showModal("모두 입력해주세요 !", 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    flex: 4,
                    child: RaisedButton(
                      onPressed: widget.onCancel,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: superlight,
                      child: Text(
                        "취소",
                        style: TextStyle(
                            color: darkblue, fontWeight: FontWeight.bold),
                      ),
                    )),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                Expanded(
                    flex: 4,
                    child: RaisedButton(
                      onPressed: handleSaveButton,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: orange,
                      child: Text(
                        "저장",
                        style: TextStyle(
                            color: white, fontWeight: FontWeight.bold),
                      ),
                    ))
              ],
            )),
        Expanded(
          flex: 9,
          child: mainScreen(),
        )
      ],
    );
  }

  Form mainScreen() {
    return Form(
        key: widget.formKey,
        child: FutureBuilder(
            future: stockDatabaseFetched,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                //data
                Map<dynamic, dynamic> pizza = snapshot.data['pizza'];
                // sort by key
                var pizzaList = pizza.entries.toList()
                  ..sort((item1, item2) =>
                      item1.key.toString().compareTo(item2.key.toString()));
                if (_pizzaTextController.length < pizzaList.length) {
                  for (int i = 0; i < pizzaList.length; ++i)
                    _pizzaTextController
                        .add(new TextEditingController(text: ""));
                }

                Map<dynamic, dynamic> beverage = snapshot.data['beverage'];
                if (_beverageTextController.length < beverage.length) {
                  for (int i = 0; i < beverage.length; ++i)
                    _beverageTextController.add(new TextEditingController());
                }

                return Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: makeTitleSize("피자", "PIZZA", 10.0, 20.0, false),
                    ),
                    Expanded(
                        ///////////////////////////////////////////////////////////////////// PIZZA
                        flex: 4,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                    color: Color.fromRGBO(238, 238, 238, 1.0))),
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  10,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20.0)),
                                                color: orange,
                                              ),
                                              padding: EdgeInsets.fromLTRB(
                                                  30.0, 10.0, 0.0, 10.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "항 목",
                                                    style: TextStyle(
                                                        color: white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: white)
                                                ],
                                              )),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  10,
                                              padding: EdgeInsets.fromLTRB(
                                                  30.0, 10.0, 0.0, 10.0),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(20.0)),
                                                color: orange,
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "개 수",
                                                    style: TextStyle(
                                                        color: white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: white)
                                                ],
                                              )),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                  flex: 9,
                                  child: Scrollbar(
                                      isAlwaysShown: true,
                                      controller: _pizzaController,
                                      child: ListView.builder(
                                        controller: _pizzaController,
                                        itemCount: pizzaList.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          // focus node List
                                          List<FocusNode> _pizzaFocusNodes =
                                              new List<FocusNode>(pizza.length);

                                          final node = FocusScope.of(context);

                                          return Column(
                                            children: [
                                              Container(
                                                  margin: index == 0
                                                      ? EdgeInsets.only(
                                                          top: 10.0)
                                                      : EdgeInsets.only(
                                                          top: 0.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 5,
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  30.0,
                                                                  10.0,
                                                                  0.0,
                                                                  10.0),
                                                          child: Text(
                                                            pizzaList[index]
                                                                .key,
                                                            style: TextStyle(
                                                                color: darkblue,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  30.0,
                                                                  10.0,
                                                                  0.0,
                                                                  10.0),
                                                          child: Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  14,
                                                              child:
                                                                  new TextFormField(
                                                                //-------------------------------------------------------------------TEXTFIELD
                                                                enableInteractiveSelection:
                                                                    false,
                                                                validator:
                                                                    (value) {
                                                                  if (value
                                                                      .isEmpty) {
                                                                    // value cannot be null
                                                                    return "개수를 입력해주세요";
                                                                  } else
                                                                    return null;
                                                                },
                                                                controller:
                                                                    _pizzaTextController[
                                                                        index],
                                                                decoration: InputDecoration(
                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(
                                                                            30),
                                                                        borderSide: BorderSide(
                                                                            color:
                                                                                mandarin,
                                                                            width:
                                                                                2)),
                                                                    errorBorder: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(
                                                                            30),
                                                                        borderSide: BorderSide(
                                                                            color:
                                                                                mandarin,
                                                                            width:
                                                                                2)),
                                                                    enabledBorder: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(
                                                                            30),
                                                                        borderSide: BorderSide(
                                                                            color:
                                                                                lightgrey,
                                                                            width:
                                                                                2)),
                                                                    focusedBorder: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                30),
                                                                        borderSide: BorderSide(
                                                                            color: orange,
                                                                            width: 2)),
                                                                    errorStyle: TextStyle(color: mandarin, fontSize: 10.0, fontWeight: FontWeight.w600),
                                                                    hintText: "현재 : " + pizzaList[index].value.toString(),
                                                                    hintStyle: TextStyle(color: lightgrey, fontSize: 12.0, fontWeight: FontWeight.w600),
                                                                    labelText: pizzaList[index].value.toString(),
                                                                    labelStyle: TextStyle(color: lightgrey, fontSize: 14.0, fontWeight: FontWeight.w600)),
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                keyboardType: TextInputType
                                                                    .numberWithOptions(
                                                                        decimal:
                                                                            true),
                                                                focusNode:
                                                                    _pizzaFocusNodes[
                                                                        index],
                                                                onEditingComplete:
                                                                    () => node
                                                                        .nextFocus(),
                                                              )),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: SizedBox(),
                                                      )
                                                    ],
                                                  )),
                                              Divider()
                                            ],
                                          );
                                        },
                                      )),
                                )
                              ],
                            ))),
                    ///////////////////////////////////////////////////////////////////// END OF PIZZA
                    Expanded(
                      flex: 1,
                      child: makeTitleSize("음료", "BEVERAGE", 10.0, 20.0, false),
                    ),
                    //////////////////////////////////////////////////////////////////////// BEVERAGE
                    Expanded(
                        flex: 2,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                    color: Color.fromRGBO(238, 238, 238, 1.0))),
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  10,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20.0)),
                                                color: orange,
                                              ),
                                              padding: EdgeInsets.fromLTRB(
                                                  30.0, 10.0, 0.0, 10.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "항 목",
                                                    style: TextStyle(
                                                        color: white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: white)
                                                ],
                                              )),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  10,
                                              padding: EdgeInsets.fromLTRB(
                                                  30.0, 10.0, 0.0, 10.0),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(20.0)),
                                                color: orange,
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "개 수",
                                                    style: TextStyle(
                                                        color: white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: white)
                                                ],
                                              )),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                  flex: 7,
                                  child: ListView.builder(
                                    itemCount: beverage.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      // focus Node
                                      List<FocusNode> _beverageFocusNodes =
                                          new List<FocusNode>(beverage.length);

                                      return Column(
                                        children: [
                                          Container(
                                              margin: index == 0
                                                  ? EdgeInsets.only(top: 10.0)
                                                  : EdgeInsets.only(top: 0.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 5,
                                                    child: Container(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                30.0,
                                                                10.0,
                                                                0.0,
                                                                10.0),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              beverage.keys
                                                                  .elementAt(
                                                                      index),
                                                              style: TextStyle(
                                                                  color:
                                                                      darkblue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 16),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              12,
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              30.0,
                                                              10.0,
                                                              0.0,
                                                              10.0),
                                                      child: new TextFormField(
                                                        //-------------------------------------------------------------------TEXTFIELD
                                                        enableInteractiveSelection:
                                                            false, // NO COPY & PASTE
                                                        controller:
                                                            _beverageTextController[
                                                                index],
                                                        validator: (value) {
                                                          if (value.isEmpty) {
                                                            // value cannot be null
                                                            return "개수를 입력해주세요";
                                                          } else
                                                            return null;
                                                        },
                                                        decoration: InputDecoration(
                                                            focusedErrorBorder: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        30),
                                                                borderSide: BorderSide(
                                                                    color:
                                                                        mandarin,
                                                                    width: 2)),
                                                            errorBorder: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        30),
                                                                borderSide: BorderSide(
                                                                    color:
                                                                        mandarin,
                                                                    width: 2)),
                                                            enabledBorder: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        30),
                                                                borderSide: BorderSide(
                                                                    color:
                                                                        lightgrey,
                                                                    width: 2)),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(30),
                                                                    borderSide: BorderSide(color: orange, width: 2)),
                                                            errorStyle: TextStyle(color: mandarin, fontSize: 10.0, fontWeight: FontWeight.w600),
                                                            hintText: "현재 : " + beverage.values.elementAt(index).toString(),
                                                            hintStyle: TextStyle(color: lightgrey, fontSize: 14.0, fontWeight: FontWeight.w600),
                                                            labelText: beverage.values.elementAt(index).toString(),
                                                            labelStyle: TextStyle(color: lightgrey, fontSize: 14.0, fontWeight: FontWeight.w600)),
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        keyboardType: TextInputType
                                                            .numberWithOptions(
                                                                decimal: true),
                                                        focusNode:
                                                            _beverageFocusNodes[
                                                                index],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: SizedBox(),
                                                  )
                                                ],
                                              )),
                                          Divider()
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                // Expanded(
                                //   flex: 2,
                                //   child: SizedBox(),
                                // )
                              ],
                            ))),
                    ///////////////////////////////////////////////////////////////////// END OF BEVRAGE
                  ],
                );
              } else {
                return customLoadingBouncingGrid(orange);
              }
            }));
  }

  showModal(String title, int flag) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        
        setHandle() {
          Navigator.of(context).pop();
          if (flag == 1) {
            widget.onCancel();
          }
        }

        return Dialog(
          elevation: 16.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: white,
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 5,
            padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: darkblue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                RaisedButton(
                  onPressed: setHandle,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: orange,
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 12,
                    height: MediaQuery.of(context).size.height / 20,
                    child: Text(
                      '확인',
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
