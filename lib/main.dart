import 'package:fintrack/features/authentication/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:fintrack/router.dart' as routes;

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: routes.generateRoute,
    ),
  );
}
