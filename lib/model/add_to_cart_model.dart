class AddToCartModel {
  String name;
  String image;
  double price;
  int qty;

  AddToCartModel({
    required this.name,
    required this.image,
    required this.price,
    required this.qty,
  });
}

List<AddToCartModel> newList = [];