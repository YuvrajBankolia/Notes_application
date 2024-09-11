import 'package:flutter/widgets.dart';
import 'package:mynotes/utilities/dialog/generic_dialog.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Password Reset',
    content:
        'We have nowe sent you a password rest link . Please check your email for more information. ',
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
