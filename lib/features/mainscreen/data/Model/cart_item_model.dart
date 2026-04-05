import 'package:flutter_application_1/core/api_servcies.dart/api_response_parser.dart';

class CartItemModel {
  final int id;
  final int product;
  final String productName;
  final int quantity;
  final double price;

  const CartItemModel({
    required this.id,
    required this.product,
    required this.productName,
    required this.quantity,
    required this.price,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'] as int,
      product: json['product'] as int,
      productName: json['product_name'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 0,
      price: parsePriceToDouble(json['price']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product,
        'product_name': productName,
        'quantity': quantity,
        'price': price.toStringAsFixed(2),
      };

  CartItemModel copyWith({
    int? id,
    int? product,
    String? productName,
    int? quantity,
    double? price,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      product: product ?? this.product,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }
}
