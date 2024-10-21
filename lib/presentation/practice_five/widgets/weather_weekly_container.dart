import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:practice/presentation/common/image_cached.dart';

import '../../../domain/model/weather_model.dart';
import '../../../utils/string_extension.dart';

class WeatherWeeklyContainer extends StatelessWidget {
  const WeatherWeeklyContainer({super.key, required this.forecastDays, required this.isLoading});

  final List<ForecastDay> forecastDays;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: isLoading ? 3 : forecastDays.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: SizedBox(
            height: 50.h,
            width: double.infinity,
            child: Stack(
              children: [
                Text(
                  formatToDayInWeek(isLoading ? "2024-10-22" : forecastDays[index].date, index),
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  left: 145.w,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${isLoading ? "0" : forecastDays[index].day.mintemp_c}°',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white54,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      SizedBox(
                        width: 80.w,
                        height: 8.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2.5.r),
                          child: LinearProgressIndicator(
                            value: isLoading ? 0 : forecastDays[index].day.daily_chance_of_rain / 100,
                            backgroundColor: Colors.black54,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.cyan,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        isLoading ? "50" : '${forecastDays[index].day.maxtemp_c}°',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  child: ImageCached(
                    image: convertUrl(isLoading ? fakeImagePath() : forecastDays[index].day.condition.icon),
                    height: 24.sp,
                    width: 24.sp,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
