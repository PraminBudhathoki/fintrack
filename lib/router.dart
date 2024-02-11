import 'package:fintrack/features/authentication/bloc/login/login_bloc.dart';
import 'package:fintrack/features/authentication/views/login/login.dart';
import 'package:fintrack/features/authentication/views/signup/signup.dart';
import 'package:fintrack/features/authentication/views/signup/success_screen.dart';
import 'package:fintrack/features/homepage/views/accounts1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/routing_manager.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case Routes.loginScreen:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => LoginBloc(),
          child: LoginScreen(),
        ),
      );
    case Routes.signupScreen:
      return MaterialPageRoute(builder: (context) => const SignupScreen());
    case Routes.successScreen:
      return MaterialPageRoute(builder: (context) => const SuccessScreen());
    case Routes.Homepage:
      return MaterialPageRoute(builder: (context) => const One());
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(
                  child: Text("Not found ${settings.name}"),
                ),
              ));
  }
}
