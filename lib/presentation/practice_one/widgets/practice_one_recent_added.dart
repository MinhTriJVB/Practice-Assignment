import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice/presentation/practice_one/widgets/practice_one_recent_added_model.dart';
import 'package:practice/utils/string_extension.dart';
import 'package:practice/utils/widget_extension.dart';

import '../../../domain/model/contact_model.dart';

class PracticeOneRecentAdded extends StatelessWidget {
  const PracticeOneRecentAdded({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Recent Added'.size24.bold.color('#4b5156'.color).paddingOnly(left: 20.w),
        15.h.spaceSize,
        SizedBox(
          height: 100.h,
          child: ListView.builder(
            itemCount: contacts.length + 1,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if(index == 0) return const SizedBox(width: 20,);
              return PracticeOneRecentAddedModel(contact: contacts[index-1]);
            },
          ),
        ),
      ],
    );
  }
}
