import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice/presentation/practice_one/widgets/practice_one_my_contacts_model.dart';
import 'package:practice/utils/string_extension.dart';
import 'package:practice/utils/widget_extension.dart';

import '../../../domain/model/contact_model.dart';

class PracticeOneMyContacts extends StatelessWidget {
  const PracticeOneMyContacts({super.key, required this.contacts});

  final List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'My Contacts (${contacts.length})'.size24.bold.black,
        15.h.spaceSize,
        ListView.builder(
          shrinkWrap: true,
          itemCount: contacts.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return PracticeOneMyContactsModel(contact: contacts[index]);
          },
        )
      ],
    ).paddingOnly(left: 20.w);
  }
}
