// lib/screens/menu_page.dart
import 'package:flutter/material.dart';
import '../models/food_item.dart';
import '../widgets/food_item_widget.dart';
import 'confirm_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final foodItems = [
      FoodItem(id: '1', name: 'Pizza', price: 200),
      FoodItem(id: '2', name: 'Burger', price: 300),
      FoodItem(id: '3', name: 'Pasta', price: 200),
      FoodItem(id: '4', name: 'Salad', price: 400),
    ];

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/menu_background.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: foodItems.length,
                    itemBuilder: (context, index) {
                      return FoodItemWidget(foodItem: foodItems[index]);
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ConfirmPage()),
                    );
                  },
                  child: const Text('Confirm Order'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}