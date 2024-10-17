import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice/domain/model/contact_model.dart';
import 'package:practice/presentation/common/avatar.dart';
import 'package:practice/utils/string_extension.dart';
import 'package:practice/utils/widget_extension.dart';

class PracticeOneMyContactsModel extends StatelessWidget {
  const PracticeOneMyContactsModel({super.key, required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomAvatar(imageUrl: contact.imageUrl),
        10.w.spaceSize,
        contact.name.size18.w400.black,
      ],
    ).paddingOnly(
      bottom: 20.h,
    );
  }
}
