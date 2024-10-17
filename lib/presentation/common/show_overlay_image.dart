import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowOverlayImage {
  final BuildContext context;


  ShowOverlayImage({
    required this.context,
  });

  OverlayEntry? _overlay;

  void showOverlayImage({
    required String image,
  }) {
    _overlay = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20.w,
                  horizontal: 20.h,
                ),
                child: Image.asset(
                  image,
                ),
              ),
            ),
          ],
        );
      },
    );
    Overlay.of(context).insert(_overlay!);
  }

  void closeOverlay() {
    _overlay?.remove();
    _overlay = null;
  }
}
