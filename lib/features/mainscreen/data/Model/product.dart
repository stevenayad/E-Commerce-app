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
    name: 'Nike Air Zoom Pegasus 39',
    category: 'Footwear',
    price: 120.00,
    oldPrice: 150.00,
    imageUrl: 'assets/images/shoe.jpg',
    description:
        'A lightweight running shoe designed for comfort and speed. Features breathable mesh and Zoom Air cushioning.',
  ),
  const Product(
    isfavourite: false,
    name: 'Adidas Ultraboost 22',
    category: 'Footwear',
    price: 180.00,
    oldPrice: 220.00,
    imageUrl: 'assets/images/shoes2.jpg',
    description:
        'High-performance running shoes with responsive Boost midsole and Primeknit upper for a sock-like fit.',
  ),
  const Product(
    isfavourite: true,
    name: 'Apple MacBook Air M2',
    category: 'Electronics',
    price: 1199.00,
    oldPrice: 1299.00,
    imageUrl: 'assets/images/laptop.jpg',
    description:
        'The latest MacBook Air with Apple M2 chip, 13.6-inch Liquid Retina display, and up to 18 hours of battery life.',
  ),
  const Product(
    isfavourite: false,
    name: 'Puma RS-X Efekt',
    category: 'Footwear',
    price: 110.00,
    oldPrice: 140.00,
    imageUrl: 'assets/images/shoe2.jpg',
    description:
        'Bold, chunky sneakers with retro vibes and modern cushioning. Perfect for streetwear enthusiasts.',
  ),
];
