import 'package:eld_pinpoint_driver/widget/custom_alert_dialog.dart';
import 'package:flutter/material.dart';

class CustomShowDialog {
  static Future<void> customShowDialog(BuildContext context, String title,
      String message, String label, Function submit) async {
    await showDialog(
        context: context,
        builder: (ctx) => CustomAlertDialog(
            title: title, message: message, label: label, submit: submit));
  }
}
