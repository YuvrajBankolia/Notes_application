import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialog/generic_dialog.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showGenericDialog<void>(
    context: context,
    title: 'An ErrorOccured',
    content: text,
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
