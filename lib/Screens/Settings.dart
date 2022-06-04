import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:news_app/Screens/page.dart';
import '../Models/profile_list_item.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView(
          children: const [
            ProfileListItem(
              page: PPage(),
              icon: LineAwesomeIcons.lock,
              text: 'Change Password',
            ),
            ProfileListItem(
              page: PPage(),
              icon: LineAwesomeIcons.globe,
              text: 'Language',
            ),
            ProfileListItem(
              page: PPage(),
              icon: LineAwesomeIcons.info_circle,
              text: 'About Us',
            ),
            ProfileListItem(
              page: PPage(),
              icon: LineAwesomeIcons.phone,
              text: 'Contact Us',
            ),
            ProfileListItem(
              page: PPage(),
              icon: LineAwesomeIcons.question_circle,
              text: "Faq's",
            ),
            ProfileListItem(
              page: PPage(),
              icon: Icons.privacy_tip,
              text: "Privcy Policy",
            ),
            ProfileListItem(
              page: PPage(),
              icon: LineAwesomeIcons.list,
              text: "Terms & Conditions",
            ),
          ],
        ))
      ],
    );
  }
}
