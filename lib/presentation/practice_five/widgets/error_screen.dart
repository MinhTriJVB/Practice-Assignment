import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practice/data/models/app_dio_exception.dart';
import 'package:practice/utils/string_extension.dart';

import '../../../application/weather/weather_bloc.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.exception, required this.cityId});

  final AppDioException exception;
  final String cityId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'error'.svg,
            width: 200.w,
            height: 200.h,
          ),
          SizedBox(height: 20.h),
          Text(
            'Error Code: ${exception.statusCode}',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            exception.message,
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          ElevatedButton(
            onPressed: () {
              context.read<WeatherBloc>().add(WeatherEvent.getWeather(cityId: cityId));
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
