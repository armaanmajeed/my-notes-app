import 'package:flutter/material.dart';
import 'package:mynotesapp/utilities/dialogs/generic_dialog.dart';

Future<bool> showLogoutDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Logout',
    content: 'Are you sure you wan\'t to logout?',
    optionsBuilder: () => {
      'Cancel': false,
      'Logout': true,
    },
  ).then((value) => value ?? false);
}
