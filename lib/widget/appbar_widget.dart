import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  const icon = CupertinoIcons.star;

  return AppBar(
    leading: const BackButton(),
    backgroundColor: const Color.fromARGB(0, 230, 148, 148),
    elevation: 2,
    title: const Text('Edit Profile'),
    actions: [
      IconButton(
        icon: const Icon(icon),
        onPressed: () {},
      ),
    ],
  );
}
