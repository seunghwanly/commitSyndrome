

class Option {
  final String category;
  final List<Sub> sub;

  Option({ this.category, this.sub });

  factory Option.fromJson(Map<String, dynamic> parsedJson) {

    var list = parsedJson['sub'] as List;
    List<Sub> subList = list.map((i) => Sub.fromJson(i)).toList();

    return Option(
      category: parsedJson['category'],
      sub: subList
    );
  }
}

class Sub {
  final String name;
  final String eng_name;
  final String detail;
  final int cost;

  Sub({this.name, this.eng_name, this.detail, this.cost});

  factory Sub.fromJson(Map<String, dynamic> parsedJson) {
    return Sub(
      name: parsedJson["name"],
      eng_name: parsedJson["eng_name"],
      detail: parsedJson["detail"],
      cost: parsedJson["cost"]
    );
  }
}