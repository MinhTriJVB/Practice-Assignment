import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice/presentation/home/widget/home_body.dart';
import 'package:practice/presentation/home/widget/home_header.dart';
import 'package:practice/utils/string_extension.dart';
import 'package:practice/utils/widget_extension.dart';

import '../../domain/model/home_card_model.dart';

class HomeScreen extends StatelessWidget {
  static const path = '/';
  static const name = 'index';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: '#f6f8fa'.color,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeHeader(),
            20.h.spaceSize,
            HomeBody(
              cardList: homeList,
            ),
          ],
        ),
      ),
    );
  }
}
