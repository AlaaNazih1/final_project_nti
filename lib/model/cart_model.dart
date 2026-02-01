class CartItem {
  final String title;
  final String description;
  final double price;
  final String image;
  int quantity;

  CartItem({
    required this.price,
    required this.title,
    required this.description,
    required this.image,
    this.quantity = 1,
  });
}
