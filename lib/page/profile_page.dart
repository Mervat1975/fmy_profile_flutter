//Author: Mervat Mustafa
//Date: March 23,2022
//Description: profile page, allows the user to view some of thier profile data
//(image , name , email , about)

import 'package:flutter/material.dart';
import 'package:my_profile/model/user.dart';
import 'package:my_profile/utils/user_preferences.dart';
import 'package:my_profile/widget/appbar_widget.dart';
import 'package:my_profile/widget/button_widget.dart';
import 'package:my_profile/page/edit_profile_page.dart';
import 'package:my_profile/widget/profile_widget.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () {},
              ),
              const SizedBox(height: 24),
              buildName(user),
              const SizedBox(height: 24),
              Center(child: buildEditButton()),
              const SizedBox(height: 48),
              buildAbout(user),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.firstName + " " + user.lastName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: const TextStyle(color: Color.fromARGB(255, 150, 38, 38)),
          )
        ],
      );

  Widget buildEditButton() => ButtonWidget(
        text: 'Edit',
        onClicked: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const EditProfilePage()),
          );
        },
      );

  Widget buildAbout(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'A little bit about me',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            Text(
              user.about,
              style: const TextStyle(fontSize: 12, height: 1.4),
            ),
          ],
        ),
      );
}
