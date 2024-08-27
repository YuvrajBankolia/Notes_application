import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialog/generic_dialog.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'delete',
    content: 'Are You sure you to want to delete?',
    optionBulider: () => {
      'Cancel': false,
      'Yes': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
