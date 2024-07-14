import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:groceries_app/models/food.dart';
import 'package:groceries_app/models/cart.dart';

class CartItem extends StatefulWidget {
  final Food food; // Changed to final for better practice
  const CartItem({
    super.key,
    required this.food,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // Remove item from cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.food);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.food.imagePath),
        title: Text(widget.food.name),
        subtitle: Text(
            '\RM${widget.food.price.toString()}'), // Corrected price display
        trailing: IconButton(
          icon: const Icon(Icons.delete), // Corrected Icon declaration
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}
