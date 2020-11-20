class Data {
  final List<Order> order;

  Data({this.order});

  factory Data.fromJson(List<dynamic> parsedJson) {
    List<Order> orderList = new List<Order>();
    orderList = parsedJson.map((index) => Order.fromJson(index)).toList();

    return Data(order: orderList);
  }
}

class Order {
  final String customerInfo;
  final List<Content> content;
  final String orderNumber;
  final String orderState;
  final int totalCost;
  final OrderTimes orderTimes;

  Order(
      {this.customerInfo,
      this.content,
      this.orderNumber,
      this.orderState,
      this.totalCost,
      this.orderTimes});

  factory Order.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['content'] as List;
    List<Content> contentList =
        list.map((index) => Content.fromJson(index)).toList();

    return Order(
      customerInfo: parsedJson['customerInfo'],
      //  orderTime: parsedJson['order_time'],
      content: contentList,
      orderNumber: parsedJson['orderNumber'],
      orderState: parsedJson['orderState'],
      totalCost: parsedJson['totalCost'],
      orderTimes: parsedJson['orderTimes'],
    );
  }

  Map toJson() {
    List<Map> content = this.content != null
        ? this.content.map((i) => i.toJson()).toList()
        : null;

    return {
      'customerInfo': customerInfo,
      // 'orderTime': orderTime.toString(),
      'contents': content,
      'orderNumber': orderNumber,
      'orderState': orderState,
      'totalCost': totalCost,
      'orderTimes': orderTimes.toJson(),
    };
  }
}

class OrderTimes {
  //final DateTime orderTime;
  final DateTime requestTime;
  final DateTime confirmTime;
  final DateTime readyTime;

  OrderTimes({this.requestTime, this.confirmTime, this.readyTime});

  Map toJson() {
    return {
      //  'orderTime': orderTime,
      'requestTime': requestTime.toString(),
      'confirmTime': confirmTime.toString(),
      'readyTime': readyTime.toString(),
    };
  }

  factory OrderTimes.fromJson(Map<String, dynamic> parsedJson) {
    return OrderTimes(
      requestTime: parsedJson['requestTime'],
      confirmTime: parsedJson['confirmTime'],
      readyTime: parsedJson['readyTime'],
    );
  }
}

class Content {
  final String name;
  final int cost;
  final Option option;

  Content({this.name, this.cost, this.option});

  factory Content.fromJson(Map<String, dynamic> parsedJson) {
    return Content(
      name: parsedJson['name'],
      cost: parsedJson['cost'],
      option: new Option(
          dough: parsedJson['option']['dough'],
          size: parsedJson['option']['size']),
    );
  }
  Map toJson() {
    return {
      'name': name,
      'cost': cost,
      'option': {
        'dough': option.dough,
        'size': option.size,
      }
    };
  }
}

class Option {
  final String size;
  final String dough;

  Option({this.size, this.dough});

  factory Option.fromJson(Map<dynamic, dynamic> parsedJson) {
    return Option(size: parsedJson['size'], dough: parsedJson['dough']);
  }
}
