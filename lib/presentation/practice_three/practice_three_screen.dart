import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/presentation/practice_three/practice_three_cart_screen.dart';
import 'package:practice/presentation/practice_three/provider/shopping_provider.dart';
import 'package:practice/presentation/practice_three/widgets/shopping_item_card.dart';
import 'package:practice/utils/string_extension.dart';
import 'package:practice/utils/widget_extension.dart';
import 'package:provider/provider.dart';

import '../../domain/model/shopping_item.dart';

class PracticeThreeScreen extends StatelessWidget {
  const PracticeThreeScreen({super.key});

  static const String path = '/practice-three';
  static const String name = 'Practice Three';

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ShoppingProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            badge.Badge(
              badgeContent: Text(
                context.watch<ShoppingProvider>().count.toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              position: badge.BadgePosition.topEnd(top: -17.h, end: -12.w),
              child: SvgPicture.asset(
                'shopping_cart'.svg,
              )
            ).paddingOnly(
                right: 20.w
            ).onTap(() {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) {
                      return ChangeNotifierProvider.value(
                        value: provider,
                        child: PracticeThreeCartScreen(),
                      );
                    }
                ),
              );
            }),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              10.h.spaceSize,
              Row(
                children: [
                  'Discovery products'.size20.black.w800,
                  const Spacer(),
                  SvgPicture.asset(
                    'filter'.svg,
                    height: 25.h,
                  ),
                ],
              ),
              20.h.spaceSize,
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 5.w,
                ),
                itemCount: shoppingItems.length,
                itemBuilder: (context, index) {
                  return ShoppingItemCard(
                    item: shoppingItems[index],
                  );
                },
              ),
            ],
          ).paddingSymmetric(
            horizontal: 20.h,
          ),
        ),
      ),
    );
  }
}
