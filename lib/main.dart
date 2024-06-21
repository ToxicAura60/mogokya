import 'package:app1/dashboard/view/dashboard_page.dart';
import 'package:app1/dashboard/view/dashboard_view.dart';
import 'package:app1/login/view/view.dart';
import 'package:app1/otp/view/otp_page.dart';
import 'package:app1/otp/view/otp_view.dart';
import 'package:app1/profile/view/profile_view.dart';
import 'package:app1/settings/view/settings_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Montserrat",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
