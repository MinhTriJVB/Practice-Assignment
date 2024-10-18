import 'package:flutter/material.dart';
import 'package:practice/utils/widget_extension.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/shopping_item.dart';
import '../provider/shopping_provider.dart';

class CartItem extends StatelessWidget {
  final ShoppingItem item;

  const CartItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ShoppingProvider>();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              item.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  item.category,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${item.price}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Counter Widget (Increment/Decrement)
          CounterWidget(
            quantity: provider.shoppingItems[item] ?? 0,
            onIncrement: () {
              provider.addShoppingItem(item);
            },
            onDecrement: () {
              provider.removeShoppingItem(item);
            },
          ),
        ],
      ),
    ).paddingSymmetric(vertical: 8);
  }
}

class CounterWidget extends StatelessWidget {
  final int quantity;
  final Function() onIncrement;
  final Function() onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            onDecrement();
          },
          icon: const Icon(Icons.remove_circle_outline, color: Colors.black),
        ),
        Text(
          '$quantity',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {
            onIncrement();
          },
          icon: const Icon(Icons.add_circle_outline, color: Colors.black),
        ),
      ],
    );
  }

  const CounterWidget({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });
}
