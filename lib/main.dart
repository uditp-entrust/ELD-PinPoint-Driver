import 'package:eld_pinpoint_driver/screen/auth/login_screen.dart';
import 'package:eld_pinpoint_driver/screen/event_log/event_log_screen.dart';
import 'package:eld_pinpoint_driver/screen/home/home_screen.dart';
import 'package:eld_pinpoint_driver/screen/log_book/log_book_screen.dart';
import 'package:eld_pinpoint_driver/screen/trip_history/trip_history_screen.dart';
import 'package:eld_pinpoint_driver/screen/log_book/widget/log_chart.dart';
import 'package:flutter/material.dart';

import 'package:eld_pinpoint_driver/theme.dart';
import 'package:eld_pinpoint_driver/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: LoginScreen(),
      routes: routes,
    );
  }
}
