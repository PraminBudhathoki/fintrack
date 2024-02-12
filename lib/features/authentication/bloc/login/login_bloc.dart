import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:fintrack/features/authentication/bloc/login/login_events.dart';
import 'package:fintrack/features/authentication/bloc/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final storage = FlutterSecureStorage();
  LoginBloc() : super(LoginInitialState()) {
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
      emit(LoginLoadingState());
      try {
        Map<String, dynamic> requestBody = {
          'username': event.email,
          'password': event.password,
        };
        final response = await http.post(
            Uri.parse('http://10.10.9.53:8000/auth/jwt/create/'),
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
              //'Content-Type': 'application/json',
            },
            body: jsonEncode(requestBody));
        final result = jsonDecode(response.body);
        print(result['access']);
        await storage.write(key: 'access_token', value: result['access']);
        print('here');
        print(await storage.read(key: 'access_token'));

        //await storage.delete(key: 'access_token');
        emit(LoginSucessfulNavigateToHomeActionState());
      } on Exception {}
      //api call
      //secure storage use garera access token store
      // emit(LoginSucessfulNavigateToHomeActionState());
    });
  }
}
