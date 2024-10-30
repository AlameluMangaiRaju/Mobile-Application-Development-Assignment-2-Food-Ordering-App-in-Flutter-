// lib/widgets/food_item_widget.dart
import 'package:flutter/material.dart';
import '../models/food_item.dart';

class FoodItemWidget extends StatefulWidget {
  final FoodItem foodItem;

  const FoodItemWidget({super.key, required this.foodItem});

  @override
  _FoodItemWidgetState createState() => _FoodItemWidgetState();
}

class _FoodItemWidgetState extends State<FoodItemWidget> {
  void _incrementCount() {
    setState(() {
      widget.foodItem.count++;
    });
  }

  void _decrementCount() {
    setState(() {
      if (widget.foodItem.count > 0) {
        widget.foodItem.count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.foodItem.name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('${widget.foodItem.price.toStringAsFixed(2)}'),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: _decrementCount,
                  icon: const Icon(Icons.remove),
                ),
                Text(widget.foodItem.count.toString()),
                IconButton(
                  onPressed: _incrementCount,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}