import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAvatar extends StatelessWidget {
  CustomAvatar({
    super.key,
    required this.imageUrl,
    this.borderRadius = 15,
    this.height = 60,
    this.width = 60,
  });

  final String imageUrl;
  final double borderRadius;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        imageUrl,
        width: width.r,
        height: height.r,
        fit: BoxFit.cover,
      ),
    );
  }
}
