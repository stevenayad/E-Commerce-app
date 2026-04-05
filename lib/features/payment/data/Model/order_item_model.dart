import 'package:flutter_application_1/core/api_servcies.dart/api_response_parser.dart';

class OrderItemModel {
  final int id;
  final int product;
  final String name;
  final int quantity;
  final double price;

  const OrderItemModel({
    required this.id,
    required this.product,
    required this.name,
    required this.quantity,
    required this.price,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'] as int,
      product: json['product'] as int,
      name: json['name'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 0,
      price: parsePriceToDouble(json['price']),
    );
  }
}
