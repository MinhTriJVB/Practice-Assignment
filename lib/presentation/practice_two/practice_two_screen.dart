import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice/presentation/practice_two/widgets/custom_app_bar.dart';
import 'package:practice/presentation/practice_two/widgets/home_shopping_container.dart';
import 'package:practice/utils/widget_extension.dart';

class PracticeTwoScreen extends StatelessWidget {
  const PracticeTwoScreen({super.key});

  static const path = '/practice_two';
  static const name = 'practice_two';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              20.h.spaceSize,
              const CustomAppBar(),
              10.h.spaceSize,
              const HomeShoppingContainer(
                title: 'Best Sale Product',
                index: 0,
              ),
              const HomeShoppingContainer(
                title: 'Top Rated Products',
                index: 2,
              ),
              const HomeShoppingContainer(
                title: 'New Arrivals',
                index: 4,
              ),

              const HomeShoppingContainer(
                title: 'Trending Now',
                index: 6,
              ),

              const HomeShoppingContainer(
                title: 'Best Deals Today',
                index: 8,
              )

            ],
          ),
        ),
      ),
    );
  }
}
