// firebase menu model
class Menu {
  final List<Information> pizza;
  final List<Information> beverage;

  Menu({this.pizza, this.beverage});

  factory Menu.fromJson(Map<String, dynamic> parsedJson) {
    var pizzaDatalist = parsedJson['pizza'] as List;
    var beverageDatalist = parsedJson['beverage'] as List;

    List<Information> pizzaList =
        pizzaDatalist.map((i) => Information.fromJson(i)).toList();
    List<Information> beverageList =
        beverageDatalist.map((i) => Information.fromJson(i)).toList();

    return Menu(pizza: pizzaList, beverage: beverageList);
  }

  int getPizzaLength() {
    return pizza.length;
  }

  int getBeverageLength() {
    return beverage.length;
  }
}

//common
class Information {
  int cost;
  String desc;
  String engName;
  String name;
  Ingredients ingredients;

  Information(
      {this.cost, this.desc, this.engName, this.ingredients, this.name});

  //parse from json data to Map<String, dynamic>
  factory Information.fromJson(Map<dynamic, dynamic> parsedJson) {
    return Information(
        cost: parsedJson['cost'] as int,
        desc: parsedJson['desc'] as String,
        engName: parsedJson['eng_name'] as String,
        name: parsedJson['name'] as String,
        ingredients: Ingredients.fromJson(parsedJson['ingredients']));
  }
}

class Ingredients {
  final int sourceA;
  final int sourceB;
  final int sourceC;
  final int sourceD;
  final int sourceE;
  final int sourceF;

  Ingredients(
      {this.sourceA,
      this.sourceB,
      this.sourceC,
      this.sourceD,
      this.sourceE,
      this.sourceF});

  factory Ingredients.fromJson(Map<dynamic, dynamic> parsedJson) {
    return Ingredients(
        sourceA: parsedJson['재료A'],
        sourceB: parsedJson['재료B'],
        sourceC: parsedJson['재료C'],
        sourceD: parsedJson['재료D'],
        sourceE: parsedJson['재료E'],
        sourceF: parsedJson['재료F']);
  }

  Map toJson() => {
    "재료A" : sourceA,
    "재료B" : sourceB,
    "재료C" : sourceC,
    "재료D" : sourceD,
    "재료E" : sourceE,
    "재료F" : sourceF
  };
}

class BeverageIngredients {
  final int cider;
  final int coke;

  BeverageIngredients({this.cider, this.coke});

  Map toJson() => {
    '사이다': cider,
    '콜라': coke
  };
}
