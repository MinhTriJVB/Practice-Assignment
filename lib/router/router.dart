import 'package:go_router/go_router.dart';
import 'package:practice/presentation/home/home_screen.dart';
import 'package:practice/presentation/practice_one/PracticeOneScreen.dart';

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
    )
  ],
);
