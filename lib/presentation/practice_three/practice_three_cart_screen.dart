import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice/presentation/practice_three/provider/shopping_provider.dart';
import 'package:practice/presentation/practice_three/widgets/shopping_cart_item.dart';
import 'package:practice/utils/string_extension.dart';
import 'package:practice/utils/widget_extension.dart';
import 'package:provider/provider.dart';

class PracticeThreeCartScreen extends StatelessWidget {
  const PracticeThreeCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingProvider>(
      builder: (BuildContext context, ShoppingProvider value, Widget? child) {
        final entries = value.shoppingItems.entries.toList();

        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: const Text('My Cart'),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  10.h.spaceSize,

                  Expanded(
                    child: ListView.builder(
                      itemCount: value.shoppingItems.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                          item: entries[index].key,
                        );
                      },
                    ),
                  ),
                  10.h.spaceSize,
                  Row(
                    children: [
                      'Total'.size18.black.w800,
                      const Spacer(),
                      '\$${value.countTotal().toStringAsFixed(2)}'.size20.black.w800,
                    ],
                  ).paddingSymmetric(
                    horizontal: 15.w,
                  ),
                  15.h.spaceSize,
                  const CheckoutButton(),
                  10.h.spaceSize,
                ],
              ).paddingSymmetric(
                horizontal: 15.w,
              )
          ),
        );
      },

    );
  }
}

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {

      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        backgroundColor: Colors.yellow[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            'Check out',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}