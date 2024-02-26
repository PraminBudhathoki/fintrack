
import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:fintrack/features/authentication/bloc/login/login_events.dart';
import 'package:fintrack/features/authentication/bloc/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'path_to_Login_Failed_Event.dart';

import 'package:http/http.dart' as http;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final storage = FlutterSecureStorage();
  LoginBloc() : super(LoginInitialState()) {
    on<LoginInitialEvent>(
      (event, emit) => emit(LoginInitialState()),
    );
    on<LoginTextChangedEvent>((event, emit) {
      // if (EmailValidator.validate(event.emailValue) == false) {
      //   emit(LoginErrorState("Please enter a valid email address"));
      // } else if (event.passwordValue.length <= 8) {
      //   emit(LoginErrorState("Please enter a valid password"));
      // } else {
      //   emit(LoginValidState());
      // }
    });
    on<LoginSubmittedEvent>((event, emit) async {
      print('hello');
      print('submit eventasdf');
      emit(LoginLoadingState());
      try {
        Map<String, dynamic> requestBody = {
          'username': event.email,
          'password': event.password,
        };
        print('before response lkjaskldfjsadf');
        final response = await http.post(
            Uri.parse('http://192.168.1.71:8000/auth/jwt/create'),
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
              //'Content-Type': 'application/json',
            },
            body: jsonEncode(requestBody));
        print('after response Here');
        print('body');
        print(response.body);
        final result = jsonDecode(response.body);

        print(result['access']);
        print(response.statusCode);
        if (response.statusCode == 200) {
          await storage.write(key: 'access_token', value: result['access']);

          // print('here');
          // print(await storage.read(key: 'access_token'));

          //await storage.delete(key: 'access_token');
          print('Navigating to home screen from bloc');
          emit(LoginSucessfulNavigateToHomeActionState());
        } else {
          print("Error");
          emit(LoginErrorState("Incorrect email or password."));
        }
      } catch (error) {
        print('error encountered');
        //emit(LoginErrorState("Incorrect email or password."));
        emit(LoginInitialState());

        // yield LoginErrorState("An error occurred. Please try again later.");
        // print('error');
      }
      //api call
      //secure storage use garera access token store
      // emit(LoginSucessfulNavigateToHomeActionState());
    });
  }
}
