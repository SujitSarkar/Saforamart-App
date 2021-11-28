class CartItem {
  final String id;
  final String productTitle;
  final String productImg;
  final int productQuantity;
  final double productPrice;

  CartItem(
      {required this.id,
      required this.productTitle,
      this.productQuantity = 0,
      required this.productPrice,
      required this.productImg});
}
