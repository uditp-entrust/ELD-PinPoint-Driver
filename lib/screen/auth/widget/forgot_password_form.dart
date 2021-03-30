import 'package:eld_pinpoint_driver/widget/custom_button.dart';
import 'package:eld_pinpoint_driver/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextField(
                hintText: "Email",
                textfieldIcon: Icon(Icons.email),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
        CustomButton(
          label: "Send Reset Password Link",
        )
      ],
    );
  }
}
