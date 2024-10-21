import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:practice/utils/string_extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../domain/model/weather_model.dart';
import '../../common/image_cached.dart';

class WeatherHourlyContainer extends StatelessWidget {
  const WeatherHourlyContainer({super.key, required this.hours, required this.isLoading});

  final List<Hour> hours;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        itemCount: isLoading ? 3 :hours.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return buildWeatherCard(
            time: isLoading ? "2024-10-22 00:00" :hours[index].time,
            icon: isLoading ? fakeImagePath() : convertUrl(hours[index].condition.icon),
            temperature: isLoading ? '52' : '${hours[index].temp_c}°',
          );
        },
      ),
    );
}

Widget buildWeatherCard({
  required String time,
  required String icon,
  required String temperature,
}) {
  DateTime dateTime = DateTime.parse(time.replaceAll(' ', 'T'));
  String formattedTime = DateFormat('h a').format(dateTime);

  if (formattedTime == '12 AM') {
    formattedTime = '0 AM';
  }

  return Container(
    padding: EdgeInsets.all(16.w),
    margin: EdgeInsets.only(right: 20.w),
    width: 100.w,
    decoration: BoxDecoration(
      color: '#202328'.color,
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          formattedTime,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.white70,
          ),
        ),
        SizedBox(height: 8.h),
        ImageCached(
          image: icon,
          width: 28.h,
          height: 28.h,
        ),
        SizedBox(height: 8.h),
        Text(
          temperature,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
}