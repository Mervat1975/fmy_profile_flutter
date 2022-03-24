//Author: Mervat Mustafa
//Date: March 23,2022
//Description: Edit profile page, allows the user to view the profile data filed in editable mode
//to update the data once tapping on the save button.
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:my_profile/model/user.dart';
import 'package:my_profile/utils/user_preferences.dart';
import 'package:my_profile/widget/appbar_widget.dart';
import 'package:my_profile/widget/profile_widget.dart';
import 'package:my_profile/widget/textfield_widget.dart';
import 'package:my_profile/widget/button_widget.dart';
import 'package:my_profile/widget/passtextfield_widget.dart';
import 'package:flutter_country/flutter_country.dart';
import 'package:flutter/cupertino.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;
  final List<Country> countries = Countries.all();
  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
        child: Builder(
          builder: (context) => Scaffold(
            appBar: buildAppBar(context),
            body: Scrollbar(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                physics: const BouncingScrollPhysics(),
                children: [
                  ProfileWidget(
                    imagePath: user.imagePath,
                    onClicked: () async {},
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'First Name',
                    text: user.firstName,
                    onChanged: (name) {},
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'Last Name',
                    text: user.lastName,
                    onChanged: (name) {},
                  ),
                  const SizedBox(height: 24),
                  PassFieldWidget(
                    label: 'Password',
                    text: user.pass,
                    onChanged: (name) {},
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'Email',
                    text: user.email,
                    onChanged: (email) {},
                  ),
                  const SizedBox(height: 24),
                  TextFieldWidget(
                    label: 'About',
                    text: user.about,
                    maxLines: 5,
                    onChanged: (about) {},
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: CupertinoPicker(
                        onSelectedItemChanged: (int index) {},
                        scrollController: FixedExtentScrollController(
                            initialItem: user.countryIndex),
                        offAxisFraction: .1,
                        diameterRatio: 1.1,
                        itemExtent: 50.0,
                        magnification: 1.4,
                        squeeze: 1.45,
                        useMagnifier: true,
                        looping: true,
                        children: countries
                            .map((country) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    Localizations.localeOf(context)
                                                .languageCode ==
                                            "en"
                                        ? '${country.name} ${country.flagIcon}'
                                        : '${country.nativeName}  ${country.flagIcon}',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ))
                            .toList()),
                  ),
                  const SizedBox(height: 24),
                  Center(child: buildSaveButton()),
                ],
              ),
            ),
          ),
        ),
      );
  Widget buildSaveButton() => ButtonWidget(
        text: 'save',
        onClicked: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const EditProfilePage()),
          );
        },
      );
}
