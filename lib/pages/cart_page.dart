import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:groceries_app/components/cart_item.dart';
import 'package:groceries_app/models/food.dart';
import 'package:groceries_app/models/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            const Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),

            const SizedBox(height: 10),

            // Cart items
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  // Get individual food
                  Food individualFood = value.getUserCart()[index];

                  // Return the cart item
                  return CartItem(food: individualFood);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
