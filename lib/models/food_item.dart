// lib/models/food_item.dart
class FoodItem {
  final String id;
  final String name;
  final double price;
  int count;

  FoodItem({
    required this.id,
    required this.name,
    required this.price,
    this.count = 0,
  });
}