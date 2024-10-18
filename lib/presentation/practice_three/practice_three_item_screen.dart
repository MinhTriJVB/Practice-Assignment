import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice/presentation/practice_three/provider/shopping_provider.dart';
import 'package:practice/utils/string_extension.dart';
import 'package:practice/utils/widget_extension.dart';
import 'package:provider/provider.dart';

import '../../domain/model/shopping_item.dart';

class PracticeThreeItemScreen extends StatefulWidget {
  const PracticeThreeItemScreen({super.key, required this.item});

  final ShoppingItem item;

  @override
  State<PracticeThreeItemScreen> createState() =>
      _PracticeThreeItemScreenState();
}

class _PracticeThreeItemScreenState extends State<PracticeThreeItemScreen> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    count = context.read<ShoppingProvider>().shoppingItems[widget.item] ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.item.name),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    widget.item.image,
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20.w),
                      color: Colors.white,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.item.name.size28.black.w800,
                          10.h.spaceSize,
                          widget.item.category.size16.color(Colors.grey).w400,
                          10.h.spaceSize,
                          '\$${widget.item.price}'.size28.black.bold,
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 2.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (count > 0) count--;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.remove_circle_outline_outlined,
                                        size: 45.r,
                                      ),
                                    ),
                                    8.w.spaceSize,
                                    (count).toString().size24.black.w800,
                                    8.w.spaceSize,
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          count++;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add_circle_outline_outlined,
                                        size: 45.r,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 60.h,
                                width: 160.w,
                                decoration: BoxDecoration(
                                  color: 'FCCF30'.color,
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                child: Center(
                                    child: 'Add to cart'.size18.white.w800),
                              ).onTap(
                                () {
                                  if (count != 0) {
                                    context
                                        .read<ShoppingProvider>()
                                        .addToCart(widget.item, count);
                                  }
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 15.w, vertical: 10.h),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
