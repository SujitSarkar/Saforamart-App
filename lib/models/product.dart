class Product {
  final int id;
  final String productTitle;
  final String imageUrl;
  final String description;
  final double price;
  final double discount;
  double? discountPrice;
  bool isFavourite;

  Product(
      {required this.id,
      required this.productTitle,
      required this.imageUrl,
      required this.description,
      required this.price,
      required this.discount,
      this.discountPrice = 0.00,
      this.isFavourite = false});
}
