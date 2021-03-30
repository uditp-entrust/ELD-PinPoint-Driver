import 'package:eld_pinpoint_driver/screen/auth/forgot_password_screen.dart';
import 'package:eld_pinpoint_driver/screen/auth/login_screen.dart';
import 'package:eld_pinpoint_driver/screen/event_log/event_log_screen.dart';
import 'package:eld_pinpoint_driver/screen/home/home_screen.dart';
import 'package:eld_pinpoint_driver/screen/log_book/log_book_screen.dart';
import 'package:eld_pinpoint_driver/screen/trip_history/trip_history_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  EventLogScreen.routeName: (context) => EventLogScreen(),
  TripHistoryScreen.routeName: (context) => TripHistoryScreen(),
  LogBookScreen.routeName: (context) => LogBookScreen(),
  HomeScreen.routeName: (context) => HomeScreen()
};
