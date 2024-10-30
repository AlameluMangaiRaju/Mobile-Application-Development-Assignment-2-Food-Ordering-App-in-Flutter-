// lib/screens/order_display_page.dart
import 'package:flutter/material.dart';

class OrderDisplayPage extends StatelessWidget {
  const OrderDisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example order details
    final Map<String, dynamic> orderDetails = {
      'items': [
        {'name': 'Pizza', 'quantity': 2, 'price': 200, 'image': 'assets/images/pizza.jpg'},
        {'name': 'Burger', 'quantity': 1, 'price': 300, 'image': 'assets/images/burger.jpg'},
        {'name': 'Pasta', 'quantity': 3, 'price': 200, 'image': 'assets/images/pasta.jpg'},
      ],
      'totalAmount': 1300,
      'address': 'Madurai',
    };

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/order_background.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  color: Colors.white.withOpacity(0.8),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Order Summary',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Display the list of ordered items with images
                        if (orderDetails['items'] != null)
                          ...List<Widget>.from(
                            (orderDetails['items'] as List<dynamic>).map<Widget>((item) {
                              return Row(
                                children: [
                                  Image.asset(
                                    item['image'] ?? '',
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['name'] ?? 'Unknown',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Quantity: ${item['quantity'] ?? 0}',
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          '${((item['quantity'] ?? 0) * (item['price'] ?? 0)).toStringAsFixed(2)}',
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                        const SizedBox(height: 20),
                        // Display total amount
                        Text(
                          'Total Amount: ${(orderDetails['totalAmount'] ?? 0).toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Display delivery address
                        Text(
                          'Delivery Address: ${orderDetails['address'] ?? 'No Address Provided'}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.popUntil(context, ModalRoute.withName('/'));
                            },
                            child: const Text('Back to Home'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}