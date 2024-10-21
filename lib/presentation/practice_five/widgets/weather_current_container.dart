import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practice/utils/string_extension.dart';

import '../../common/image_cached.dart';

class WeatherTempAndCondition extends StatelessWidget {
  const WeatherTempAndCondition({super.key, required this.temp, required this.condition, required this.image});

  final double temp;
  final String condition;
  final String image;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$temp°',
              style: TextStyle(
                fontSize: 80.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              width: 200.w,
              child: Text(
                condition,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white70,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
        ImageCached(
          height: 150.h,
          width: 150.h,
          image: convertUrl(image),
        )
      ],
    );
  }
}

