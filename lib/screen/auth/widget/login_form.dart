import 'package:eld_pinpoint_driver/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final bool isLoading;
  final Function onEmailSaved, onPasswordSaved;

  LoginForm({this.isLoading, this.onEmailSaved, this.onPasswordSaved});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomTextField(
            hintText: "Username",
            textfieldIcon: Icon(Icons.person),
            enabled: true,
            keyboardType: TextInputType.emailAddress,
            // validator: (value) {
            //   if (value.isEmpty) {
            //     return 'Required field';
            //   }

            //   if (!value.contains('@')) {
            //     return 'Invalid email!';
            //   }
            // },
            onSaved: onEmailSaved,
          ),
          CustomTextField(
            hintText: "Password",
            textfieldIcon: Icon(Icons.lock),
            enabled: true,
            obscureText: true,
            // validator: (value) {
            //   if (value.isEmpty) {
            //     return 'Required field';
            //   }
            // },
            onSaved: onPasswordSaved,
          )
        ],
      ),
    );
  }
}
