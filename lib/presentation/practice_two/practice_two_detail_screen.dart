import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practice/utils/string_extension.dart';
import 'package:practice/utils/widget_extension.dart';

import '../../domain/model/shopping_item.dart';

class PracticeTwoDetailScreen extends StatelessWidget {
  const PracticeTwoDetailScreen({super.key, required this.item});

  final ShoppingItem item;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: SvgPicture.asset(
                'heart'.svg,
                height: 25.h,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(
                'share'.svg,
                height: 25.h,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: badge.Badge(
                badgeContent: const Text(
                  '1',
                  style: TextStyle(color: Colors.white),
                ),
                child: SvgPicture.asset(
                  'shopping_bag'.svg,
                  height: 25.h,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.h.spaceSize,
            Image.asset(
              item.image,
              height: 500.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            10.h.spaceSize,
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
                '${item.rating} Ratings'.toString().size18.color(Colors.grey),
                const Spacer(),
                SizedBox(
                  height: 25.h,
                  width: 2.w,
                  child: const VerticalDivider(
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                '${item.ratingNumbers} Reviews'
                    .toString()
                    .size18
                    .color(Colors.grey),
              ],
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Total Price'.size20.color(Colors.grey),
                    5.h.spaceSize,
                    '\$${item.price}'.size24.bold.color('5CAC98'.color),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 60.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    color: '#4ab299'.color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      bottomLeft: Radius.circular(10.r),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'shopping_bag'.svg,
                          height: 20.h,
                          colorFilter: ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        8.w.spaceSize,
                        '1'.size18.white.bold
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                    color: '2B2D40'.color,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                  ),
                  child: Center(
                    child: 'Buy Now'.size18.white.bold,
                  ),
                ),
              ],
            ),
            20.h.spaceSize,
          ],
        ).paddingSymmetric(
          horizontal: 20.w,
        ),
      ),
    );
  }
}
