import 'package:fintrack/features/authentication/views/login/login.dart';
import 'package:flutter/material.dart';
import 'constants/routing_manager.dart';

/// The MaterialApp provides us with a property called generateRoute where.
///
///
/// we can pass in a Function that returns a Route<dynamic> and takes in RouteSettings
/// Thus for this purpose, we create a function named generateRoute
///
/// **params**:
/// * `settings`: RouteSetting have been passed
///
/// **returns**:
/// * `Route<dynamic>`: Return a Route
Route<dynamic> generateRoute(RouteSettings settings) {
  // The settings contains the route information of the requested route.
  // It provides two key things to us: the name, and the arguments.
  // We use the name to determine which view to return.
  switch (settings.name) {
    // Returns the loginScreen
    case Routes.loginScreen:
    //final int mainScreenIndex = settings.arguments! as int;
      return MaterialPageRoute(
        builder: (context) =>
            StartScreen(
              key: const Key('loginScreen'),
            ),
      );

    //Return the signup widget
    case Routes.signupScreen:
      return MaterialPageRoute(
        builder: (context) =>
            StartScreen(
              key: const Key('loginScreen'),
            ),
      );

    default:
      return MaterialPageRoute(
        builder: (context) =>
            StartScreen(
              key: const Key('loginScreen'),
            ),
      );
  }
}
