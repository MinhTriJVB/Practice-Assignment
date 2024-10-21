import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice/presentation/practice_five/widgets/error_screen.dart';
import 'package:practice/presentation/practice_five/widgets/weather_current_container.dart';
import 'package:practice/presentation/practice_five/widgets/weather_current_information.dart';
import 'package:practice/presentation/practice_five/widgets/weather_header.dart';
import 'package:practice/presentation/practice_five/widgets/weather_weekly_container.dart';
import 'package:practice/utils/string_extension.dart';
import 'package:practice/utils/widget_extension.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../application/weather/weather_bloc.dart';
import 'widgets/weather_hourly_container.dart';

class PracticeFiveScreen extends StatelessWidget {
  const PracticeFiveScreen({super.key});

  static const String path = '/practice-five';
  static const String name = 'Practice Five';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: '1B1D1F'.color,
      ),
    );

    return Scaffold(
        backgroundColor: '1B1D1F'.color,
        extendBodyBehindAppBar: true,
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return state.when(
              error: (message, cityId) => ErrorScreen(
                exception: message,
                cityId: cityId,
              ),
              initial: (weatherModel, isLoading) {
                return Skeletonizer(
                  enabled: isLoading,
                  enableSwitchAnimation: true,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        MediaQuery.of(context).padding.top.spaceSize,
                        15.h.spaceSize,
                        WeatherHeader(
                          cityName: isLoading
                              ? BoneMock.title
                              : weatherModel.location.name,
                          destination: isLoading
                              ? BoneMock.country
                              : weatherModel.location.country,
                          date: isLoading
                              ? "2024-10-21 09:02"
                              : weatherModel.location.localtime,
                        ),
                        15.h.spaceSize,
                        WeatherTempAndCondition(
                          temp: weatherModel.current.temp_c,
                          condition: isLoading
                              ? BoneMock.name
                              : weatherModel.current.condition.text,
                          image: isLoading
                              ? fakeImagePath()
                              : weatherModel.current.condition.icon,
                        ),
                        25.h.spaceSize,
                        WeatherCurrentInformation(
                          windSpeed: weatherModel.current.wind_kph,
                          humidity: weatherModel.current.humidity,
                          precipitation: weatherModel.current.precip_mm,
                        ),
                        25.h.spaceSize,
                        WeatherHourlyContainer(
                          hours: weatherModel
                                  .forecast.forecastDay.firstOrNull?.hour ??
                              [],
                          isLoading: isLoading,
                        ),
                        25.h.spaceSize,
                        WeatherWeeklyContainer(
                          forecastDays: weatherModel.forecast.forecastDay,
                          isLoading: isLoading,
                        ),
                      ],
                    ).paddingSymmetric(
                      horizontal: 20.w,
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
