import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice/presentation/practice_four/widgets/practice_four_sign_up.dart';
import 'package:practice/presentation/practice_four/widgets/practice_four_text_field.dart';
import 'package:practice/utils/string_extension.dart';
import 'package:practice/utils/widget_extension.dart';

class PracticeFourScreen extends StatefulWidget {
  PracticeFourScreen({super.key});

  static const path = '/practice-four';
  static const name = 'Practice Four';

  @override
  State<PracticeFourScreen> createState() => _PracticeFourScreenState();
}

class _PracticeFourScreenState extends State<PracticeFourScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController userController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: '#f1f4f8'.color,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              50.h.spaceSize,
              //Logo
              Container(
                height: 80.h,
                width: 80.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset('assets/images/home_header.jpg'),
              ),
              10.h.spaceSize,
              'Sign Up For Free'.size24.black.bold,
              20.h.spaceSize,
              PracticeFourTextField(
                hintText: 'Enter your username',
                labelText: 'Username',
                prefixIcon: Icons.person,
                controller: userController,
                validator: (value) {
                  if ( value!.isEmpty) {
                    return 'Username cannot be empty';
                  }
                  return null;
                },
              ),
              PracticeFourTextField(
                hintText: 'Enter your email',
                labelText: 'Email',
                prefixIcon: Icons.email,
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email cannot be empty';
                  }
                  if (!isValidEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              PracticeFourTextField(
                hintText: 'Enter your password',
                labelText: 'Password',
                prefixIcon: Icons.lock,
                controller: passwordController,
                isPassword: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password cannot be empty';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              PracticeFourTextField(
                hintText: 'Re-enter your password',
                labelText: 'Re-enter Password',
                prefixIcon: Icons.lock,
                controller: rePasswordController,
                isPassword: true,
                validator: (value) {
                  if (value != passwordController.text) {
                    return 'Password does not match';
                  }
                  return null;
                },
              ),
              PracticeFourSignUp(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.success,
                      body: 'You have successfully registered'.size24.black.bold.center.centerWidget,
                      title: 'Register Successfully',
                    ).show();
                  }
                },
              ),
            ],
          ).paddingSymmetric(
            horizontal: 20.w,
          ),
        ),
      ),
    );
  }
}


bool isValidEmail(String email) {
  String pattern =
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";

  return RegExp(pattern).hasMatch(email);
}