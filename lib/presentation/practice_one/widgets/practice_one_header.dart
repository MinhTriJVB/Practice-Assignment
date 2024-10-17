import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice/utils/string_extension.dart';
import 'package:practice/utils/widget_extension.dart';

class PracticeOneHeader extends StatelessWidget {
  const PracticeOneHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Search name here...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: '#eff0f0'.color,
                width: 1.w,
              ),
            ),
            fillColor: '#f4f4f5'.color,
            filled: true,
          )
        ).paddingSymmetric(
          horizontal: 20.w,
        )
      ],
    );
  }
}
