class ShoppingItem {
  final String name;
  final String category;
  final double rating;
  final double ratingNumbers;
  final String image;
  final double price;

  const ShoppingItem({
    required this.name,
    required this.category,
    required this.rating,
    required this.ratingNumbers,
    required this.image,
    required this.price,
  });
}

const List<ShoppingItem> shoppingItems = [
  ShoppingItem(
    name: 'Smartphone',
    category: 'Electronics',
    rating: 4.5,
    ratingNumbers: 120,
    image: 'assets/images/w1.jpg',
    price: 299.99,
  ),
  ShoppingItem(
    name: 'Men\'s Jacket',
    category: 'Clothing',
    rating: 4.0,
    ratingNumbers: 85,
    image: 'assets/images/w2.jpg',
    price: 49.99,
  ),
  ShoppingItem(
    name: 'Decorative',
    category: 'Home Decor',
    rating: 4.8,
    ratingNumbers: 150,
    image: 'assets/images/w3.jpg',
    price: 79.99,
  ),
  ShoppingItem(
    name: 'Skincare Set',
    category: 'Beauty',
    rating: 3.9,
    ratingNumbers: 65,
    image: 'assets/images/w4.jpg',
    price: 19.99,
  ),
  ShoppingItem(
    name: 'Yoga Mat',
    category: 'Sports',
    rating: 4.6,
    ratingNumbers: 210,
    image: 'assets/images/w5.jpg',
    price: 129.99,
  ),
  ShoppingItem(
    name: 'Mystery Novel',
    category: 'Books',
    rating: 4.3,
    ratingNumbers: 300,
    image: 'assets/images/w6.jpg',
    price: 15.99,
  ),
  ShoppingItem(
    name: 'Blender',
    category: 'Kitchen',
    rating: 4.1,
    ratingNumbers: 90,
    image: 'assets/images/w7.jpg',
    price: 39.99,
  ),
  ShoppingItem(
    name: 'Action Figure',
    category: 'Toys',
    rating: 4.7,
    ratingNumbers: 130,
    image: 'assets/images/w8.jpg',
    price: 24.99,
  ),
  ShoppingItem(
    name: 'Dumbbell Set',
    category: 'Fitness',
    rating: 4.4,
    ratingNumbers: 150,
    image: 'assets/images/w9.jpg',
    price: 99.99,
  ),
  ShoppingItem(
    name: 'Smartwatch',
    category: 'Gadgets',
    rating: 3.8,
    ratingNumbers: 40,
    image: 'assets/images/w10.jpg',
    price: 199.99,
  ),
];


