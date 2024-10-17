import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice/utils/string_extension.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.w),
          bottomRight: Radius.circular(30.w),
        ),
      ),
      height: 300.h,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          //Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/home_header.jpg',
              fit: BoxFit.cover,
            ),
          ),
          //Gradient
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: 20.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                'Minh Trí'.size32.white.bold,
                'Flutter Intern'.size26.white.bold,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
