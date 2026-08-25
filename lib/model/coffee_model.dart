class CoffeeModel {
  int code; // 1
  String name; // late
  String category; // hot coffee
  String type; // coffee
  String image; //https://____.png
  String des; // coffee ...
  String instruction; //suger 50%
  double price; // 2.5
  bool favorite; // true
  List<String> size; // S, M, L

  CoffeeModel({
    required this.code,
    required this.name,
    required this.category,
    required this.type,
    required this.image,
    required this.des,
    required this.instruction,
    required this.price,
    required this.favorite,
    required this.size,
  });
}
