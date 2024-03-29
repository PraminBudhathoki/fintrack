import 'dart:convert';

import 'package:fintrack/constants/string_manager.dart';
import 'package:fintrack/features/authentication/bloc/login/login_bloc.dart';
import 'package:fintrack/features/authentication/views/login/login.dart';
import 'package:fintrack/features/authentication/views/signup/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:http/http.dart' as http;

import '../../../../../services/navigation_service.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
  });

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _firstNameController,
                  expands: false,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      labelText: StringManager.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  controller: _lastNameController,
                  expands: false,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      labelText: StringManager.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  prefix: Icon(Iconsax.user_edit),
                  labelText: StringManager.userName,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  prefix: Icon(Iconsax.directbox_default),
                  labelText: StringManager.email,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  prefix: Icon(Iconsax.call),
                  labelText: StringManager.phoneNumber,
                ),
              ),
              const SizedBox(height: 16),

              ///Password
              TextFormField(
                controller: _passwordController,
                //obscureText: true,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  prefix: Icon(Iconsax.password_check),
                  labelText: StringManager.password,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(_obscureText ? Iconsax.eye_slash : Iconsax.eye),
                  ),
                  //suffixIcon: Icon(Iconsax.eye_slash),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    child: const Text(StringManager.signUp,
                        style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .purple, // Set the background color of the button
                    ),
                    onPressed: () async {
                      // Check if the password length is less than 8 characters
                      if (_passwordController.text.length > 8) {
                        // If password length is less than 8, show an error message
                        {
                          final response = await http.post(
                              Uri.parse('http://192.168.1.71:8000/auth/users/'),
                              //http://192.168.1.167:8000/auth/users/
                              headers: {
                                'Content-Type':
                                    'application/json; charset=UTF-8',
                                //'Content-Type': 'application/json',
                              },
                              body: jsonEncode({
                                'username': _usernameController.text,
                                'first_name': _firstNameController.text,
                                'last_name': _lastNameController.text,
                                'phone_no': _phoneController.text,
                                'password': _passwordController.text
                              }));
                          print(response.body);

                          //api call
                          String username = _usernameController.text;
                          String password = _passwordController.text;
                          loginUser(username, password);
                          await NavigationService()
                              .navigateToScreen(const SuccessScreen());
                          // MaterialPageRoute(
                          //     builder: (context) => BlocProvider(
                          //           create: (context) => LoginBloc(),
                          //           child: const LoginScreen(),
                          //         )
                          //     //(context) => const LoginScreen(),
                          //     );
                        }
                        ;
                      } else {
                        // If password length is 8 or more, navigate to SuccessScreen
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Password must be at least 8 characters long.'),
                          ),
                        );
                      }
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> loginUser(String username, String password) async {
  try {
    final storage = FlutterSecureStorage();
    Map<String, dynamic> requestBody = {
      'username': username,
      'password': password,
    };
    print('before response lkjaskldfjsadf');
    final response = await http.post(
      Uri.parse('http://192.168.1.71:8000/auth/jwt/create'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestBody),
    );
    print('after response Here');
    print('body');
    print(response.body);
    final result = jsonDecode(response.body);

    print(result['access']);
    print(response.statusCode);
    print("login API called");
    if (response.statusCode == 200) {
      await storage.write(key: 'access_token', value: result['access']);

      // print('here');
      // print(await storage.read(key: 'access_token'));

      //await storage.delete(key: 'access_token');
      print('Navigating to home screen from bloc');
      //emit(LoginSucessfulNavigateToHomeActionState());
    } else {
      print("Error");
      //emit(LoginErrorState("Incorrect email or password."));
    }
  } catch (e) {
    print("Error: $e");
    // emit(LoginErrorState("An error occurred while logging in."));
  }
}
