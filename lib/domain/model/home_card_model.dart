import 'package:practice/presentation/practice_one/PracticeOneScreen.dart';

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
];