import 'package:bluemart/models/carts.dart';
import 'package:bluemart/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Header Text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('My Cart',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  //Check-out button logic
                },
                label: const Text(
                  'Checkout',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                icon: const Icon(
                  Icons.shopping_cart_checkout,
                  color: Colors.white,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                  Colors.blue.shade400
                  )
                ),
              ),
            ],
          ),

          const SizedBox(height: 10,),

          Expanded(
            child: ListView.builder(
              itemCount: value.getUserCart().length,
              itemBuilder: (context, index) {
                // get the individual shoe
                Shoe individualShoe = value.getUserCart() [index];

                // return the cart item
                return CartItem(shoe: individualShoe,);
              }
            )
          ),
        ],
      ),
    ),);
  }
}