class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double quantity;
  final String category;
  final String imageUrl;
  final bool isFavorite;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.quantity,
      required this.category,
      required this.imageUrl,
      this.isFavorite = false});
}
