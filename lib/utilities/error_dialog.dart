import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialog/generic_dialog.dart';

Future<void> showErrorDialog(BuildContext context, String text) {
  return showGenericDialog(
    context: context,
    title: 'An ErrorOccured',
    content: text,
    optionBulider: () => {
      'OK': null,
    },
  );
}
