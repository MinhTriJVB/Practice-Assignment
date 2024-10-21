import 'package:practice/presentation/practice_four/practice_four_screen.dart';
import 'package:practice/presentation/practice_one/PracticeOneScreen.dart';
import 'package:practice/presentation/practice_two/practice_two_screen.dart';

import '../../presentation/practice_five/practice_five_screen.dart';
import '../../presentation/practice_three/practice_three_screen.dart';

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
  HomeCardModel(
    title: 'Bài thực hành 3',
    description: 'Làm quen với cách quản lý trạng thái (State).',
    image: 'assets/images/pract3.png',
    destination: PracticeThreeScreen.name,
  ),
  HomeCardModel(
    title: 'Bài thực hành 4',
    description: 'Xây dựng form và xử lý validation.',
    image: 'assets/images/pract4.png',
    destination: PracticeFourScreen.name,
  ),
  HomeCardModel(
    title: 'Bài thực hành 5',
    description: 'Thao tác với API và Lưu trữ dữ liệu cục bộ',
    image: 'assets/images/pract5.png',
    destination: PracticeFiveScreen.name,
  ),
];