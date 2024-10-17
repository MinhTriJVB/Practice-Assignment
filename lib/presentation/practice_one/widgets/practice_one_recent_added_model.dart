import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice/domain/model/contact_model.dart';
import 'package:practice/utils/string_extension.dart';
import 'package:practice/utils/widget_extension.dart';

import '../../common/avatar.dart';

class PracticeOneRecentAddedModel extends StatelessWidget {
  PracticeOneRecentAddedModel({super.key, required this.contact});

  Contact contact;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomAvatar(
          imageUrl: contact.imageUrl,
        ),
        5.h.spaceSize,
        (contact.name.split(" ")[0]).size18.w400.black,
      ],
    ).paddingOnly(right: 15.w);
  }
}
