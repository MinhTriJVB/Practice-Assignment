import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice/presentation/practice_two/widgets/home_shopping_item.dart';
import 'package:practice/utils/widget_extension.dart';

import '../../domain/model/shopping_item.dart';

class PracticeTwoCategoryScreen extends StatelessWidget {
  const PracticeTwoCategoryScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            mainAxisSpacing: 10,
          ),
          itemCount: shoppingItems.length,
          itemBuilder: (context, index) {
            return HomeShoppingItem(
              item: shoppingItems[index],
            );
          },
        ).paddingSymmetric(
          horizontal: 10.w,
        ),
      ),
    );
  }
}
