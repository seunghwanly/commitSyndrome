Map<String, int> calculateSales(
    Map<String, dynamic> menuData, DateTime selectedDate) {
  // data length
  int ggz = 0;
  int ptt = 0;
  int ppr = 0;
  int bgg = 0;

  menuData.forEach((key, value) {
    // key compareTo selectedDate
    if (DateTime.parse(key).compareTo(selectedDate) <= 0) {
      // before and same

      // autoKey: Order
      if (value.runtimeType != int) {
        // 11-22 : 1
        var fetchedOrderInfo = Map<dynamic, dynamic>.from(value);
        fetchedOrderInfo.forEach((key, value) {
          // contents
          var contentList = List<Map<dynamic, dynamic>>.from(value['contents']);
          // list
          contentList.forEach((element) {
            switch (element['name']) {
              case "고르곤졸라피자":
                ggz += element['count'] * element['cost'];
                break;
              case "포테이토피자":
                ptt += element['count'] * element['cost'];
                break;
              case "페퍼로니피자":
                ppr += element['count'] * element['cost'];
                break;
              case "불고기피자":
                bgg += element['count'] * element['cost'];
                break;
              default:
            }
          });
        });
      }
    }
  });

  Map<String, int> result = {
    "고르곤졸라피자": ggz,
    "포테이토피자": ptt,
    "페퍼로니피자": ppr,
    "불고기피자": bgg
  };

  return result;
}

Map<String, int> calculateMonthSales(
    Map<String, dynamic> menuData, DateTime selectedDate) {
  // data length
  int ggz = 0;
  int ptt = 0;
  int ppr = 0;
  int bgg = 0;
  int cdr = 0;
  int cke = 0;

  menuData.forEach((key, value) {
    // key compareTo selectedDate
    if(DateTime.parse(key).month.compareTo(selectedDate.month) == 0) {

      // autoKey: Order
      if (value.runtimeType != int) {
        // 11-22 : 1
        var fetchedOrderInfo = Map<dynamic, dynamic>.from(value);
        fetchedOrderInfo.forEach((key, value) {
          // contents
          var contentList = List<Map<dynamic, dynamic>>.from(value['contents']);
          // list
          contentList.forEach((element) {
            switch (element['name']) {
              case "고르곤졸라피자":
                ggz += element['count'] * element['cost'];
                break;
              case "포테이토피자":
                ptt += element['count'] * element['cost'];
                break;
              case "페퍼로니피자":
                ppr += element['count'] * element['cost'];
                break;
              case "불고기피자":
                bgg += element['count'] * element['cost'];
                break;
              case "사이다":
                cdr += element['count'] * element['cost'];
                break;
              case "콜라":
                cke += element['count'] * element['cost'];
                break;
              default:
            }
          });
        });
      }
    }
  });

  Map<String, int> result = {
    "고르곤졸라피자": ggz,
    "포테이토피자": ptt,
    "페퍼로니피자": ppr,
    "불고기피자": bgg,
    "사이다" : cdr,
    "콜라": cke
  };

  return result;
}
