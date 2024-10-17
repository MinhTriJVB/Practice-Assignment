import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice/presentation/practice_one/widgets/CustomFAB.dart';
import 'package:practice/presentation/practice_one/widgets/practice_one_header.dart';
import 'package:practice/presentation/practice_one/widgets/practice_one_my_contacts.dart';
import 'package:practice/presentation/practice_one/widgets/practice_one_recent_added.dart';
import 'package:practice/utils/string_extension.dart';
import 'package:practice/utils/widget_extension.dart';

import '../../domain/model/contact_model.dart';

class PracticeOneScreen extends StatelessWidget {
  const PracticeOneScreen({super.key});

  static const path = '/p_one';
  static const name = 'p_one';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: 'Contacts'.size28.black.w600.center,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              20.h.spaceSize,
              //Header Text
              const PracticeOneHeader(),
              20.h.spaceSize,
              const PracticeOneRecentAdded(),
              30.h.spaceSize,
              const PracticeOneMyContacts(
                contacts: contacts,
              ),
            ],
          ),
        ),
        floatingActionButton: const Customfab(),
      ),
    );
  }
}
