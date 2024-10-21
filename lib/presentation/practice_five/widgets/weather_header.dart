import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../application/weather/weather_bloc.dart';
import '../practice_five_search_screen.dart';

class WeatherHeader extends StatelessWidget {
  const WeatherHeader(
      {super.key,
      required this.cityName,
      required this.destination,
      required this.date});

  final String cityName;
  final String destination;
  final String date;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(date.replaceAll(' ', 'T'));
    String formattedDate = DateFormat('d MMMM, EEEE').format(dateTime);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cityName,
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              destination,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              formattedDate,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            color: Colors.grey.withOpacity(0.2),
            child: IconButton(
              icon: const Icon(Icons.search_sharp),
              color: Colors.white,
              iconSize: 28.sp,
              onPressed: () async {
                await context.pushNamed(PracticeFiveSearchScreen.name).then(
                  (value) {
                    if (value != null) {
                      context.read<WeatherBloc>().add(
                            WeatherEvent.getWeather(
                              cityId: value.toString(),
                            ),
                          );
                    }
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
