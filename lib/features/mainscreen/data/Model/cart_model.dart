import 'package:flutter_application_1/core/api_servcies.dart/api_response_parser.dart';
import 'package:flutter_application_1/features/mainscreen/data/Model/cart_item_model.dart';

class CartModel {
  final List<CartItemModel> items;
  final double totalPrice;

  const CartModel({
    required this.items,
    required this.totalPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final raw = json['items'];
    final list = <CartItemModel>[];
    if (raw is List) {
      for (final e in raw) {
        if (e is Map<String, dynamic>) {
          list.add(CartItemModel.fromJson(e));
        }
      }
    }
    return CartModel(
      items: list,
      totalPrice: parsePriceToDouble(json['total_price']),
    );
  }

  int get itemCount =>
      items.fold(0, (sum, item) => sum + item.quantity);
}
