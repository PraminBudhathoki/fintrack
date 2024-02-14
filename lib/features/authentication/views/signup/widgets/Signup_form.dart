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
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  prefix: Icon(Iconsax.password_check),
                  labelText: StringManager.password,
                  suffixIcon: Icon(Iconsax.eye_slash),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.purple, // Set the background color of the button
                  ),
                  onPressed: () async {
                    final response = await http.post(
                        Uri.parse('http://192.168.249.80:8000/auth/users/'),
                        //http://192.168.1.167:8000/auth/users/
                        headers: {
                          'Content-Type': 'application/json; charset=UTF-8',
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
                    NavigationService().navigateToScreen(const SuccessScreen());
                    // MaterialPageRoute(
                    //     builder: (context) => BlocProvider(
                    //           create: (context) => LoginBloc(),
                    //           child: const LoginScreen(),
                    //         )
                    //     //(context) => const LoginScreen(),
                    //     );
                  },
                  child: const Text(StringManager.signUp,
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
