import 'package:get/get.dart';
import 'package:safora_mart/models/cartItem.dart';

class CartController extends GetxController {
  Map<int, CartItem> _items = {};

  Map<int, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get TotalAmount {
    var total = 0.0;

    _items.forEach((key, cartItem) {
      total += cartItem.productPrice * cartItem.productQuantity;
    });

    return total;
  }

  void addItem(
      int productId, double price, String title, int quantity, String img) {
    if (_items.containsKey(productId)) {
      removeitem(productId);
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          productTitle: title,
          productQuantity: 1,
          productPrice: price,
          productImg: img,
        ),
      );
    }
    update();
  }

  int itemQuantity(int productId) {
    int amount = 0;
    _items.forEach((key, value) {
      if (key == productId) {
        amount = value.productQuantity;
      }
    });
    return amount;
  }

  var productQuantity = 0.obs;

  void removeitem(int productId) {
    _items.remove(productId);
    update();
  }

  void increaseQuantity(int productId) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (value) => CartItem(
          id: value.id,
          productTitle: value.productTitle,
          productQuantity: value.productQuantity + 1,
          productPrice: value.productPrice,
          productImg: value.productImg,
        ),
      );
    }
    update();
  }

  void decreaseQuantity(int productId) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (value) => CartItem(
          id: value.id,
          productTitle: value.productTitle,
          productQuantity: value.productQuantity - 1,
          productPrice: value.productPrice,
          productImg: value.productImg,
        ),
      );
    }
    update();
  }

  void clear() {
    _items = {};
    update();
  }
}
