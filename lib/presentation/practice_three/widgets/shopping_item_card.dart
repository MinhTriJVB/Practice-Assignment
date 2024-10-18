import 'package:flutter/material.dart';
import 'package:practice/presentation/practice_three/provider/shopping_provider.dart';
import 'package:practice/utils/string_extension.dart';
import 'package:practice/utils/widget_extension.dart';
import 'package:provider/provider.dart';

import '../../../domain/model/shopping_item.dart';
import '../practice_three_item_screen.dart';

class ShoppingItemCard extends StatelessWidget {
  const ShoppingItemCard({super.key, required this.item});

  final ShoppingItem item;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ShoppingProvider>();
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            item.image,
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
          item.name.size20.black.w800,
          '\$${item.price}'.size18.black.w400,
        ],
      ),
    ).onTap(
      () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ChangeNotifierProvider.value(
                value: provider,
                child: PracticeThreeItemScreen(
                  item: item
                ),
              );
            }
          ),
        );
      },
    );
  }
}
