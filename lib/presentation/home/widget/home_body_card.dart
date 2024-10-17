import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:practice/utils/string_extension.dart';
import 'package:practice/utils/widget_extension.dart';

import '../../../domain/model/home_card_model.dart';

class HomeBodyCard extends StatelessWidget {
  HomeBodyCard({
    super.key,
    required this.homeCardModel,
    required this.onLongPress,
    required this.onLongPressEnd,
  });

  HomeCardModel homeCardModel;
  final void Function() onLongPress;
  final void Function() onLongPressEnd;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      elevation: 10,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.h,
          vertical: 20.w,
        ),
        child: GestureDetector(
          onLongPressStart: (details) {
            onLongPress();
          },
          onLongPressEnd: (details) => onLongPressEnd(),
          child: ListTile(
            title: homeCardModel.title.size20.bold.black,
            subtitle: homeCardModel.description.size16,
            contentPadding: EdgeInsets.zero,
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
            leading: Image.asset(
              homeCardModel.image,
              width: 50.w,
              height: 50.h,
            ),
          ),
        ),
      ),
    )
        .paddingSymmetric(
          horizontal: 10.w,
          vertical: 10.h,
        )
        .onTap(
          () => context.pushNamed(homeCardModel.destination),
        );
  }
}
