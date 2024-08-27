import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialog/generic_dialog.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Log out',
    content: 'Are You sure you to want to logout?',
    optionBulider: () => {
      'Cancel': false,
      'Logout': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
