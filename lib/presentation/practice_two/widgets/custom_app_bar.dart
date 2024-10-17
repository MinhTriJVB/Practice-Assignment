import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/utils/string_extension.dart';
import 'package:practice/utils/widget_extension.dart';
import 'package:badges/badges.dart' as badges;

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: TextField(
            decoration: InputDecoration(
              filled: false,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.h,
                ),
              ),
              prefixIcon: SizedBox(
                height: 15.h,
                width: 15.w,
                child: SvgPicture.asset(
                  'search'.svg,
                  colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ).paddingAll(10.w),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 15.h,
              ),
              hintText: 'Search..',
            ),
          ),
        ),
        15.w.spaceSize,
        badges.Badge(
          badgeContent: Text('1'),
          child: SvgPicture.asset(
            'shopping_cart'.svg,
            height: 30.h,
          ),
        ),
        15.w.spaceSize,
        badges.Badge(
          badgeContent: Text('5'),
          child: SvgPicture.asset(
            'chat'.svg,
            height:30.h,
          ),
        )
      ],
    ).paddingSymmetric(
      horizontal: 20.w,
    );
  }
}
