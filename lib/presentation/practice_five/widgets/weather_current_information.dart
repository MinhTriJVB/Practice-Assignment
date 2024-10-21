import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/utils/string_extension.dart';

class WeatherCurrentInformation extends StatelessWidget {
  const WeatherCurrentInformation({super.key, required this.windSpeed, required this.humidity, required this.precipitation});

  final double windSpeed;
  final int humidity;
  final double precipitation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: '#202328'.color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildWeatherDetailItem(
            icon: 'wind',
            value: '$windSpeed m/s',
            label: 'Wind',
          ),
          buildWeatherDetailItem(
            icon: 'water_drop',
            value: '$humidity%',
            label: 'Humidity',
          ),
          buildWeatherDetailItem(
            icon: 'rain',
            value: '$precipitation mm',
            label: 'precipitation',
          ),
        ],
      ),
    );
  }
}

Widget buildWeatherDetailItem({
  required String icon,
  required String value,
  required String label,
}) {
  return Column(
    children: [
      SvgPicture.asset(
        icon.svg,
        // color: Colors.white,
        // size: 28.sp,
        height: 30.h,
      ),
      SizedBox(height: 8.h),
      Text(
        value,
        style: TextStyle(
          fontSize: 18.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        label,
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.white70,
        ),
      ),
    ],
  );
}
