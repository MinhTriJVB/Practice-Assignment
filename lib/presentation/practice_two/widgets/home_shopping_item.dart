import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/utils/string_extension.dart';
import 'package:practice/utils/widget_extension.dart';

import '../../../domain/model/shopping_item.dart';
import '../practice_two_detail_screen.dart';

class HomeShoppingItem extends StatelessWidget {
  const HomeShoppingItem({super.key, required this.item});

  final ShoppingItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            item.image,
            height: 150.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          5.h.spaceSize,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              item.category.size14.color(Colors.grey),
              5.h.spaceSize,
              item.name.size20.bold.black,
              8.h.spaceSize,
              Row(
                children: [
                  SvgPicture.asset(
                    'star'.svg,
                    height: 10.h,
                  ),
                  5.w.spaceSize,
                  item.rating.toString().size14.color(Colors.grey),
                  2.w.spaceSize,
                  VerticalDivider(
                    color: Colors.grey,
                    width: 1.w,
                  ),
                  2.w.spaceSize,
                  item.ratingNumbers.toString().size14.color(Colors.grey),
                  const Spacer(),
                  '\$${item.price}'.size16.bold.color('#75b9a7'.color),
                ],
              )
            ],
          ).paddingSymmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
        ],
      ),
    ).onTap(
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PracticeTwoDetailScreen(item: item),
        ),
      ),
    );
  }
}
