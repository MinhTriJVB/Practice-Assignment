import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice/utils/widget_extension.dart';

class PracticeFourTextField extends StatefulWidget {
  const PracticeFourTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.isPassword = false,
    required this.validator,
  });

  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?) validator;

  @override
  State<PracticeFourTextField> createState() => _PracticeFourTextFieldState();
}

class _PracticeFourTextFieldState extends State<PracticeFourTextField> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(widget.prefixIcon, color: Colors.black54),
            suffixIcon: (widget.isPassword)
                ? IconButton(
                    icon: Icon(
                      (isSecure) ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      setState(() {
                        isSecure = !isSecure;
                      });
                    },
                  )
                : null,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
          textInputAction: TextInputAction.next,
          obscureText: (widget.isPassword) ? isSecure : false,
          controller: widget.controller,
          validator: widget.validator,

        ),
      ],
    ).paddingOnly(
      bottom: 20.h,
    );
  }
}
