import 'package:eld_pinpoint_driver/screen/auth/forgot_password_screen.dart';
import 'package:eld_pinpoint_driver/screen/auth/widget/app_logo.dart';
import 'package:eld_pinpoint_driver/screen/auth/widget/auth_header.dart';
import 'package:eld_pinpoint_driver/screen/auth/widget/login_form.dart';
import 'package:eld_pinpoint_driver/screen/home/home_screen.dart';
import 'package:eld_pinpoint_driver/widget/custom_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
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
                AuthHeader(header: 'Log In'),
                SizedBox(
                  height: 60,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LoginForm(
                        onEmailSaved: (value) {},
                        onPasswordSaved: (value) {},
                        // isLoading: _isLoading,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      CustomButton(
                        label: "Login",
                        onTap: () {
                          Navigator.of(context).pushNamed(HomeScreen.routeName);
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context)
                            .pushNamed(ForgotPasswordScreen.routeName),
                        child: Text('Forgot Password',
                            style: TextStyle(color: Colors.black54)),
                      )
                    ],
                  ),
                ),
                // SignupTextLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
