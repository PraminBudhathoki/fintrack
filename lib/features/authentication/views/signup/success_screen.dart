import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:fintrack/features/authentication/bloc/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fintrack/constants/string_manager.dart';
import 'package:fintrack/features/homepage/views/accounts1.dart';
import 'package:fintrack/services/navigation_service.dart';
import 'package:http/http.dart' as http;

import '../../bloc/login/login_state.dart';

// Future<Album> fetchAlbum() async {
//   final storage = const FlutterSecureStorage();
//   final accessToken = await storage.read(key: 'access_token');
//   final response = await http.get(
//       Uri.parse('http://192.168.1.71:8000/auth/users/me/?format=json'),
//       headers: {
//         HttpHeaders.authorizationHeader: 'JWT $accessToken',
//       });

//   // final response = await http
//   //     .get(Uri.parse('http://192.168.1.71:8000/balanceamount/?format=json'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

// class Album {
//   final int id;
//   final String username;
//   final String email;
//   final String first_name;
//   final String last_name;
//   final int phone_no;

//   const Album({
//     required this.id,
//     required this.username,
//     required this.email,
//     required this.first_name,
//     required this.last_name,
//     required this.phone_no,
//   });

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//         id: json['id'],
//         username: json['username'],
//         email: json['email'],
//         first_name: json['first_name'],
//         last_name: json['last_name'],
//         phone_no: json['phone_no']);
//   }
// }

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  // late Future<Album> futureAlbum;

  // @override
  // void initState() {
  //   super.initState();
  //   // Fetch data from backend when the widget initializes
  //   futureAlbum = fetchAlbum();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //FutureBuilder<Album>(
          // future: futureAlbum,
          // builder: (context, snapshot) {
          //   //int totalBalance =snapshot.data!.income -snapshot.data!.expenses;
          //   if (snapshot.connectionState == ConnectionState.waiting) {
          //     return const CircularProgressIndicator();
          //   } else if (snapshot.hasError) {
          //     return Text('Error: ${snapshot.error}');
          //   } else {
          //return
          Padding(
        padding: const EdgeInsets.only(
            top: 80.0, left: 24.0, right: 24.0, bottom: 20.0),
        child: Center(
          child: Column(
            children: [
              ///logo, Account Creation and Continue

              Padding(
                padding: const EdgeInsets.only(
                  top: 56.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      height: 100,
                      image: AssetImage("assets/logos/F.png"),
                    ),
                    const Text(
                      StringManager.successCreation,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 46,
                    ),
                    const Text(StringManager.successWelcome),
                    const SizedBox(
                      height: 26,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors
                              .purple, // Set the background color of the button
                        ),
                        onPressed: () async {
                          print("Before adding target wallet");
                          await addtargetwallet();

                          NavigationService().navigateToScreen(const One());
                        },
                        child: const Text(StringManager.continueText,
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//),
//);
//}
//}

Future<void> addtargetwallet() async {
  final storage = const FlutterSecureStorage();
  double amount = 0.0;
  //Float amount = 0 as Float;

  print("\n$amount");
  print("inside add target wallet function");

  Map<String, dynamic> requestBody = {
    'amount': amount,
  };
  final accessToken = await storage.read(key: 'access_token');
  print('JWT $accessToken');
  await http.post(Uri.parse('http://192.168.1.71:8000/targetwalletcreate/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        //'Content-Type': 'application/json',
        'Authorization': 'JWT $accessToken'
      },
      body: jsonEncode(requestBody));
}
