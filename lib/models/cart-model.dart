class CartItem {
  final String name;
  final String variant;
  final double price;
  int quantity;
  final String image;

  CartItem({
    required this.name,
    required this.variant,
    required this.price,
    required this.quantity,
    required this.image,
  });
}
