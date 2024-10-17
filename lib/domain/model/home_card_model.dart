import 'package:practice/presentation/practice_one/PracticeOneScreen.dart';
import 'package:practice/presentation/practice_two/practice_two_screen.dart';

class HomeCardModel {
  final String title;
  final String description;
  final String image;
  final String destination;

  HomeCardModel({required this.title, required this.description, required this.image, required this.destination,});
}

final homeList = [
  HomeCardModel(
    title: 'Bài thực hành 1',
    description: 'Xây dựng giao diện cơ bản',
    image: 'assets/images/pract1.png',
    destination: PracticeOneScreen.name,
  ),
  HomeCardModel(
    title: 'Bài thực hành 2',
    description: 'Hiểu và triển khai điều hướng giữa các màn hình',
    image: 'assets/images/pract2.png',
    destination: PracticeTwoScreen.name,
  ),
];