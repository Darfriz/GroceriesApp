import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/models/food.dart';

class Cart extends ChangeNotifier {
  // List of food for sale
  final List<Food> foodFood = [
    Food(
      name: 'Flour',
      price: 5.0,
      description: 'High Protein Refined Flour 1KG.',
      imagePath: 'lib/images/flour.jpg',
    ),
    Food(
      name: 'Coconut',
      price: 4.5,
      description: 'Fresh coconut milk.',
      imagePath: 'lib/images/coconut.jpg',
    ),
    Food(
      name: 'Bread',
      price: 4.5,
      description: 'Soft slices of bread.',
      imagePath: 'lib/images/bread.jpg',
    ),
    Food(
      name: 'Eggs',
      price: 12.9,
      description: 'High Protein Raw Eggs 30pcs.',
      imagePath: 'lib/images/egg.jpeg',
    ),
    Food(
      name: 'Tomato',
      price: 12.9,
      description: 'High In Vitamic C',
      imagePath: 'lib/images/tomato.jpg',
    ),
    Food(
      name: 'Salmon',
      price: 8.0,
      description: 'Raw Norwegian Salmon 350g.',
      imagePath: 'lib/images/salmon.jpg',
    ),
    Food(
      name: 'Beef',
      price: 40.0,
      description: 'Halal and nutritious protein.',
      imagePath: 'lib/images/beef.png',
    ),
    Food(
      name: 'Chicken',
      price: 15.90,
      description: 'Grassfed chicken.',
      imagePath: 'lib/images/chicken.png',
    ),
    Food(
      name: 'Rice',
      price: 22.0,
      description: 'Rice 10KG.',
      imagePath: 'lib/images/rice.jpg',
    ),
    Food(
      name: 'Garlic',
      price: 5.0,
      description: 'Good for cancer',
      imagePath: 'lib/images/garlic.jpg',
    ),
    Food(
      name: 'Onion',
      price: 5.0,
      description: 'Grown and picked from Holland',
      imagePath: 'lib/images/onion.jpg',
    ),
    Food(
      name: 'Ginger',
      price: 5.0,
      description: 'Perfect for soup',
      imagePath: 'lib/images/ginger.jpg',
    ),
    Food(
      name: 'Chillies',
      price: 5.0,
      description: 'Hot and spicy fresh chillies 250G.',
      imagePath: 'lib/images/chillies.jpg',
    ),
    Food(
      name: 'Mayonaise',
      price: 9.5,
      description: 'Made from vegetable oil.',
      imagePath: 'lib/images/mayo.jpg',
    ),
    Food(
      name: 'Cooking Oil',
      price: 30.0,
      description: 'Healthy cooking oil.',
      imagePath: 'lib/images/oil.jpg',
    ),
    Food(
      name: 'Soybean Sauce',
      price: 6.0,
      description: 'Sweet Soybean Sauce.',
      imagePath: 'lib/images/soy.jpg',
    ),
    Food(
      name: 'Salt',
      price: 5.0,
      description: 'Refined Salt, high In Sodium.',
      imagePath: 'lib/images/salt.jpg',
    ),
    Food(
      name: 'Sugar',
      price: 5.0,
      description: 'Sugar 1KG.',
      imagePath: 'lib/images/sugar.jpg',
    ),
  ];

  // List of items in user cart
  final List<Food> userCart = [];

  // Get list of food for sale
  List<Food> getFoodList() {
    return foodFood;
  }

  // Get cart
  List<Food> getUserCart() {
    return userCart;
  }

  // Add item to cart
  void addItemToCart(Food food) {
    userCart.add(food);
    saveCartToFirestore();
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(Food food) {
    userCart.remove(food);
    saveCartToFirestore();
    notifyListeners();
  }

  // Save cart to Firestore
  void saveCartToFirestore() async {
    final cartCollection = FirebaseFirestore.instance.collection('carts');
    final cartData = userCart.map((food) => food.toJson()).toList();
    await cartCollection.doc('user_cart').set({'items': cartData});
  }
}
