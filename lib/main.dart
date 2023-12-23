import 'package:fintrack/constants/routing_manager.dart';
import 'package:fintrack/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:fintrack/router.dart';

void main() {
  runApp(
     MaterialApp(
       debugShowCheckedModeBanner: false,
       initialRoute: Routes.loginScreen,
       onGenerateRoute: RouteGenerator.generateRoutes,
       navigatorKey: NavigationService().navigationKey,
    ),
  );
}
