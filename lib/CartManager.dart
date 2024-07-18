import 'package:my_styleshpere1/cart.dart';

class CartManager {
  // Singleton instance
  static final CartManager _instance = CartManager._internal();

  // Private constructor
  CartManager._internal();

  // Factory constructor to return the same instance
  factory CartManager() => _instance;

  // List to hold cart items
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    _items.add(item);
  }

  void removeItem(int index) {
    _items.removeAt(index);
  }

  double get totalPrice {
    return _items.fold(0, (total, item) => total + item.price * item.quantity);
  }
}
