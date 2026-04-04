class ProductModel {
  int? id;
  List<dynamic>? reviews;
  String? name;
  String? description;
  String? price;
  String? brand;
  String? category;
  String? ratings;
  int? stock;
  DateTime? createAt;
  String? image;
  int? user;

  ProductModel({
    this.id,
    this.reviews,
    this.name,
    this.description,
    this.price,
    this.brand,
    this.category,
    this.ratings,
    this.stock,
    this.createAt,
    this.image,
    this.user,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'] as int?,
    reviews: json['reviews'] as List<dynamic>?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    price: json['price'] as String?,
    brand: json['brand'] as String?,
    category: json['category'] as String?,
    ratings: json['ratings'] as String?,
    stock: json['stock'] as int?,
    createAt:
        json['createAt'] == null
            ? null
            : DateTime.parse(json['createAt'] as String),
    image: json['image'] as String?,
    user: json['user'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'reviews': reviews,
    'name': name,
    'description': description,
    'price': price,
    'brand': brand,
    'category': category,
    'ratings': ratings,
    'stock': stock,
    'createAt': createAt?.toIso8601String(),
    'image': image,
    'user': user,
  };
}
