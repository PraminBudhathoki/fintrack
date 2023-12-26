import 'package:fintrack/features/authentication/views/login/login.dart';
import 'package:fintrack/features/authentication/views/signup/signup.dart';
import 'package:fintrack/features/authentication/views/signup/success_screen.dart';
import 'package:fintrack/features/homepage/views/homepage.dart';
import 'package:flutter/material.dart';
import 'constants/routing_manager.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch(settings.name) {
    case Routes.loginScreen:
      return MaterialPageRoute(builder: (context) => StartScreen());
    case Routes.signupScreen:
      return MaterialPageRoute(builder: (context) => SignupScreen());
    case Routes.successScreen:
      return MaterialPageRoute(builder: (context) => SuccessScreen());
    case Routes.Homepage:
      return MaterialPageRoute(builder: (context) => HomePage());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold(
        body: Center(
          child: Text("Not found ${settings.name}"),
        ),
      ));
  }
}