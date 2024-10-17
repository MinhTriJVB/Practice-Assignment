import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practice/utils/string_extension.dart';

class Customfab extends StatelessWidget {
  const Customfab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [
            '#ea8342'.color,
            '#ec3db5'.color,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )
      ),
      height: 60.r,
      width: 60.r,
      padding: EdgeInsets.all(15.r),
      child: SvgPicture.asset(
        'add'.svg,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}
