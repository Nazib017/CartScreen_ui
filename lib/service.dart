class CartItem {
  String TshirtTitle;
  String TshirtColor;
  String TshirtSize;
  int TshirtQuantity;
  int perTshirtPrice;

  CartItem(
      {required this.TshirtTitle,
      required this.TshirtColor,
      required this.TshirtSize,
      required this.TshirtQuantity,
      required this.perTshirtPrice});
  int get totalPrice {
    return TshirtQuantity * perTshirtPrice;
  }

}
