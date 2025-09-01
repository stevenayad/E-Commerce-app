class Product {
  final String name;
  final String category;
  final double price;
  final double oldPrice;
  final String imageUrl;
  final String description;
  final bool isfavourite;

  const Product({
    required this.isfavourite,
    required this.name,
    required this.category,
    required this.price,
    this.oldPrice = 0,
    required this.imageUrl,
    required this.description,
  });
}

final List<Product> products = [
  const Product(
    isfavourite: true,
    name: 'Shoes',
    category: 'Footwear',
    price: 69.00,
    oldPrice: 189.00,
    imageUrl: 'assets/images/shoe.jpg',
    description: 'This is a description of the product 1',
  ),
  const Product(
    isfavourite: false,
    name: 'Shoes',
    category: 'Footwear',
    price: 69.00,
    oldPrice: 189.00,
    imageUrl: 'assets/images/shoes2.jpg',
    description: 'This is a description of the product 1',
  ),
  const Product(
    isfavourite: true,
    name: 'Laptop',
    category: 'Electronics',
    price: 69.00,
    oldPrice: 189.00,
    imageUrl: 'assets/images/laptop.jpg',
    description: 'This is a description of the product 2',
  ),
  const Product(
    isfavourite: false,
    name: 'Shoes',
    category: 'Footwear',
    price: 69.00,
    oldPrice: 189.00,
    imageUrl: 'assets/images/shoe2.jpg',
    description: 'This is a description of the product 1',
  ),
];
