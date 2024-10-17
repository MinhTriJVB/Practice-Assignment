import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice/utils/string_extension.dart';
import 'package:practice/utils/widget_extension.dart';

import '../../../domain/model/shopping_item.dart';
import '../practice_two_category_screen.dart';
import 'home_shopping_item.dart';

class HomeShoppingContainer extends StatelessWidget {
  const HomeShoppingContainer(
      {super.key, required this.title, required this.index});

  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            title.size24.black.bold,
            const Spacer(),
            'See more'.size20.color('#5cac98'.color).onTap(
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PracticeTwoCategoryScreen(
                          title: title,
                        ),
                      ),
                    );
                  },
                ),
          ],
        ),
        15.h.spaceSize,
        Row(
          children: [
            Expanded(
              child: HomeShoppingItem(
                item: shoppingItems[index],
              ),
            ),
            10.w.spaceSize,
            Expanded(
              child: HomeShoppingItem(
                item: shoppingItems[index + 1],
              ),
            ),
          ],
        ),
      ],
    ).paddingSymmetric(horizontal: 20.w, vertical: 10.h);
  }
}
