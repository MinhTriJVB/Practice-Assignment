import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:practice/presentation/home/home_screen.dart';
import 'package:practice/presentation/practice_one/PracticeOneScreen.dart';
import 'package:provider/provider.dart';

import '../application/weather/search_weather_cubit.dart';
import '../application/weather/weather_bloc.dart';
import '../presentation/practice_five/practice_five_screen.dart';
import '../presentation/practice_five/practice_five_search_screen.dart';
import '../presentation/practice_four/practice_four_screen.dart';
import '../presentation/practice_three/practice_three_screen.dart';
import '../presentation/practice_three/provider/shopping_provider.dart';
import '../presentation/practice_two/practice_two_screen.dart';

final router = GoRouter(
  initialLocation: HomeScreen.path,
  routes: [
    GoRoute(
      path: HomeScreen.path,
      name: HomeScreen.name,
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: PracticeOneScreen.path,
      name: PracticeOneScreen.name,
      builder: (context, state) {
        return const PracticeOneScreen();
      },
    ),
    GoRoute(
      path: PracticeTwoScreen.path,
      name: PracticeTwoScreen.name,
      builder: (context, state) {
        return const PracticeTwoScreen();
      },
    ),
    GoRoute(
      path: PracticeThreeScreen.path,
      name: PracticeThreeScreen.name,
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (context) => ShoppingProvider(),
          child: const PracticeThreeScreen(),
        );
      },
    ),
    GoRoute(
      path: PracticeFourScreen.path,
      name: PracticeFourScreen.name,
      builder: (context, state) {
        return PracticeFourScreen();
      },
    ),
    GoRoute(
      path: PracticeFiveScreen.path,
      name: PracticeFiveScreen.name,
      builder: (context, state) {
        return BlocProvider(
          create: (context) =>
          WeatherBloc()
            ..add(
              const WeatherEvent.getWeather(cityId: '2717932'),
            ),
          child: const PracticeFiveScreen(),
        );
      },
      routes: [
        GoRoute(
          path: PracticeFiveSearchScreen.path,
          name: PracticeFiveSearchScreen.name,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => SearchWeatherCubit(),
              child: PracticeFiveSearchScreen(),
            );
          },
        ),
      ],
    ),
  ],
);
