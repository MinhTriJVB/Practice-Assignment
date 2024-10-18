import 'package:go_router/go_router.dart';
import 'package:practice/presentation/home/home_screen.dart';
import 'package:practice/presentation/practice_one/PracticeOneScreen.dart';
import 'package:provider/provider.dart';

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
  ],
);
