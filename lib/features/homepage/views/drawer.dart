import 'dart:convert';

import 'package:fintrack/features/authentication/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../assetLiabialities/assetliabialiaties.dart';
import '../../authentication/views/login/login.dart';
import '../../incomeExpenses/incomeexpenses.dart';
import '../../target/views/targetScreen.dart';
import 'accounts1.dart';
import 'calculator.dart';
import 'history.dart';
import 'info.dart';
import 'package:http/http.dart' as http;

class UserData {
  final int id;
  final String username;
  final String email;
  final String first_name;
  final String last_name;
  final String phone_no;

  UserData({
    required this.id,
    required this.username,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.phone_no,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      phone_no: json['phone_no'],
    );
  }
}

final storage = const FlutterSecureStorage();

Future<UserData> fetchUserInfo() async {
  final storage = const FlutterSecureStorage();
  final accessToken = await storage.read(key: 'access_token');
  final response = await http.get(
    Uri.parse(
        'http://192.168.1.71:8000/auth/users/me/?format=json'), // Replace with your API endpoint
    headers: {
      'Authorization': 'JWT $accessToken', // Include authentication token
    },
  );
  if (response.statusCode == 200) {
    final userDataJson = json.decode(response.body);
    return UserData.fromJson(userDataJson);
    // return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch user information');
  }
}

class Cdrawer extends StatefulWidget {
  Cdrawer({super.key});

  @override
  State<Cdrawer> createState() => _CdrawerState();
}

class _CdrawerState extends State<Cdrawer> {
  late Future<UserData> futureAlbum;
  //late WalletData target;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchUserInfo();
  }

  //final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      //surfaceTintColor: Colors.white,
      child: FutureBuilder(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Show a loading indicator while fetching data
            } else if (snapshot.hasError) {
              return Text(
                  'Error: ${snapshot.error}'); // Show an error message if fetching data fails
            } else if (snapshot.hasData) {
              UserData userData = snapshot.data as UserData;
              return ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        height: 80,
                        image: AssetImage("assets/logos/F.png"),
                      ),
                      Text(
                        " ${userData.username}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    child: PhysicalModel(
                      color: Colors.blueGrey,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: InkWell(
                        onTap: () {
                          // Navigate to a new screen when the section is tapped
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const One(),
                            ),
                          );
                        },
                        child: const SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Icon(
                                Icons.account_balance,
                                color: Colors.white,
                                size: 45,
                              ),
                              Text("   Accounts",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    child: PhysicalModel(
                      color: Colors.blueGrey,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: InkWell(
                        onTap: () {
                          // Navigate to a new screen when the section is tapped
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Two(),
                            ),
                          );
                        },
                        child: const SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Icon(
                                Icons.attach_money,
                                color: Colors.white,
                                size: 45,
                              ),
                              Text(
                                "   Asset and Liabilities",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    child: PhysicalModel(
                      color: Colors.blueGrey,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: InkWell(
                        onTap: () {
                          // Navigate to a new screen when the section is tapped
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Three(),
                            ),
                          );
                        },
                        child: const SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Icon(
                                Icons.monetization_on,
                                color: Colors.white,
                                size: 45,
                              ),
                              Text("   Income/Expenses",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    child: PhysicalModel(
                      color: Colors.blueGrey,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: InkWell(
                        onTap: () {
                          // Navigate to a new screen when the section is tapped
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Four(),
                            ),
                          );
                        },
                        child: const SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Icon(
                                Icons.calculate,
                                color: Colors.white,
                                size: 45,
                              ),
                              Text('   Loan Calculator',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    child: PhysicalModel(
                      color: Colors.blueGrey,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: InkWell(
                        onTap: () {
                          // Navigate to a new screen when the section is tapped
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const TargetScreen(),
                            ),
                          );
                        },
                        child: const SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Icon(
                                Icons.flag,
                                color: Colors.white,
                                size: 45,
                              ),
                              Text('   Target',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    child: PhysicalModel(
                      color: Colors.blueGrey,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: InkWell(
                        onTap: () {
                          // Navigate to a new screen when the section is tapped
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const History(),
                            ),
                          );
                        },
                        child: const SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Icon(
                                Icons.history,
                                color: Colors.white,
                                size: 45,
                              ),
                              Text('   History',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    child: PhysicalModel(
                      elevation: 10,
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: InkWell(
                        onTap: () {
                          // Navigate to a new screen when the section is tapped
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Info(),
                            ),
                          );
                        },
                        child: const SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: Colors.black54,
                                size: 45,
                              ),
                              Text('   Contact us',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black87)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    child: PhysicalModel(
                      elevation: 10,
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: InkWell(
                        onTap: () {
                          // Navigate to a new screen when the section is tapped
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Info(),
                            ),
                          );
                        },
                        child: const SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Icon(
                                Icons.info,
                                color: Colors.black54,
                                size: 45,
                              ),
                              Text('   Information',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black87)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    child: PhysicalModel(
                      elevation: 10,
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: InkWell(
                        onTap: () {
                          storage.delete(key: 'access_token');
                          // Navigate to a new screen when the section is tapped
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                      create: (context) => LoginBloc(),
                                      child: const LoginScreen(),
                                    )
                                //(context) => const LoginScreen(),
                                ),
                          );
                        },
                        child: const SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.black54,
                                size: 45,
                              ),
                              Text('   Logout',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black87)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
