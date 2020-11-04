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
  final String customer;
  final String orderTime;
  final List<Content> content;

  Order({this.customer, this.orderTime, this.content});

  factory Order.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['content'] as List;
    List<Content> contentList =
        list.map((index) => Content.fromJson(index)).toList();

    return Order(
        customer: parsedJson['customer'],
        orderTime: parsedJson['order_time'],
        content: contentList);
  }
}

class Content {
  final String name;
  final int cost;
  final List<Option> option;

  Content({this.name, this.cost, this.option});

  factory Content.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['option'] as List;
    List<Option> optionList =
        list.map((index) => Option.fromJson(index)).toList();

    return Content(
        name: parsedJson['name'], cost: parsedJson['cost'], option: optionList);
  }
}

class Option {
  final String size;
  final String dough;

  Option({this.size, this.dough});

  factory Option.fromJson(Map<String, dynamic> parsedJson) {
    return Option(size: parsedJson['size'], dough: parsedJson['dough']);
  }
}
