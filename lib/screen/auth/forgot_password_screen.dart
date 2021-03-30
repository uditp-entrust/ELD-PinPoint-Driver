import 'package:eld_pinpoint_driver/screen/auth/login_screen.dart';
import 'package:eld_pinpoint_driver/screen/auth/widget/app_logo.dart';
import 'package:eld_pinpoint_driver/screen/auth/widget/forgot_password_header.dart';
import 'package:eld_pinpoint_driver/widget/custom_button.dart';
import 'package:eld_pinpoint_driver/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = "/forgot_password";

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushNamed(LoginScreen.routeName);
        return true;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 65,
                ),
                AppLogo(
                  height: 100,
                  width: 100,
                ),
                ForgotPasswordHeader(),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Column(
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
                              // enabled: !_isLoading,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Required field';
                                }
                                if (!value.contains('@')) {
                                  return 'Invalid email!';
                                }
                              },
                              onSaved: (value) {
                                // userEmail = value;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      CustomButton(
                        label: "Send Reset Password Link",
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () =>
                        Navigator.of(context).pushNamed(LoginScreen.routeName),
                    child: Text(
                      'Back To Login',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
