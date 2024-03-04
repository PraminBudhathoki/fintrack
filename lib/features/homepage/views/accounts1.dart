import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pie_chart/pie_chart.dart';
import 'drawer.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Album> fetchAlbum() async {
  final storage = const FlutterSecureStorage();
  final accessToken = await storage.read(key: 'access_token');
  final response = await http.get(
      Uri.parse('http://192.168.1.71:8000/balanceamount/?format=json'),
      headers: {
        HttpHeaders.authorizationHeader: 'JWT $accessToken',
      });

  // final response = await http
  //     .get(Uri.parse('http://192.168.1.71:8000/balanceamount/?format=json'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final double total_income;
  final double total_expenses;
  final double balance_amount;
  final double total_assets;
  final double total_liabilities;
  final double target_wallet;
  final double target_wallet_balance;

  const Album({
    required this.total_income,
    required this.total_expenses,
    required this.balance_amount,
    required this.total_assets,
    required this.total_liabilities,
    required this.target_wallet,
    required this.target_wallet_balance,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      total_income: json['total_income'].toDouble(),
      total_expenses: json['total_expense'].toDouble(),
      balance_amount: json['balance_amount'].toDouble(),
      total_assets: json['total_assets'].toDouble(),
      total_liabilities: json['total_liabilities'].toDouble(),
      target_wallet: json['target_wallet_balance'].toDouble(),
      target_wallet_balance: json['net_balance_amount'].toDouble(),
    );
  }
}

class One extends StatefulWidget {
  const One({
    super.key,
  });

  @override
  State<One> createState() => _OneState();
}

class _OneState extends State<One> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    // Fetch data from backend when the widget initializes
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Cdrawer(),
      appBar: AppBar(
        title: const Text(
          "Accounts",
          style: TextStyle(color: Colors.white),
        ),
        titleSpacing: 00.0,
        backgroundColor: Colors.purple,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
      ),
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            //int totalBalance =snapshot.data!.income -snapshot.data!.expenses;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  // Handle button tap for "Total portfolio"
                                  print("Total portfolio tapped");
                                },
                                child: Container(
                                  color: Colors.blueGrey,
                                  width: 150,
                                  height: 140,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Icon(Icons.attach_money,
                                          size: 50, color: Colors.white),
                                      const SizedBox(height: 8),
                                      const Text(
                                        "Income : ",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      Text(
                                        "Rs${snapshot.data!.total_income}",
                                        //textScaleFactor: 1.3,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  // Handle button tap for "Cash available"
                                  print("Cash available tapped");
                                },
                                child: Container(
                                  color: Colors.blueGrey,
                                  width: 150,
                                  height: 140,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Icon(
                                        Icons.money,
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        "Expenses :",
                                        //textScaleFactor: 1.3,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      Text(
                                        "Rs${snapshot.data!.total_expenses}",
                                        // textScaleFactor: 1.3,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  // Handle button tap for "Total portfolio"
                                  print("Total portfolio tapped");
                                },
                                child: Container(
                                  color: Colors.blueGrey,
                                  width: 150,
                                  height: 140,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Icon(Icons.attach_money,
                                          size: 50, color: Colors.white),
                                      const SizedBox(height: 8),
                                      const Text(
                                        "Balance : ",
                                        //textScaleFactor: 1.3,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      Text(
                                        "Rs${snapshot.data!.balance_amount}",
                                        // textScaleFactor: 1.3,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  // Handle button tap for "Cash available"
                                  print("Cash available tapped");
                                },
                                child: Container(
                                  color: Colors.blueGrey,
                                  width: 150,
                                  height: 140,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Icon(
                                        Icons.money,
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        "Total balance :",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      Text(
                                        "Rs${snapshot.data!.target_wallet_balance}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        PieChart(
                          animationDuration: const Duration(milliseconds: 800),
                          chartLegendSpacing: 20,
                          colorList: const [
                            Color(0xFFA3CCA3),
                            Color(0xFF87CEEB)
                          ],
                          chartRadius: MediaQuery.of(context).size.width / 2.7,
                          ringStrokeWidth: 72,
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValues: true,
                            showChartValuesInPercentage: true,
                            showChartValuesOutside: false,
                            decimalPlaces: 1,
                          ),
                          dataMap: {
                            "Asset": snapshot.data!.total_assets.toDouble(),
                            "Liabialiaties":
                                snapshot.data!.total_liabilities.toDouble(),
                          },
                        ),
                        PieChart(
                          animationDuration: const Duration(milliseconds: 800),
                          chartLegendSpacing: 20,
                          chartRadius: MediaQuery.of(context).size.width / 2.7,
                          colorList: const [
                            Color(0xFFA3CCA3),
                            Color(0xFF87CEEB)
                          ],
                          ringStrokeWidth: 72,
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValues: true,
                            showChartValuesInPercentage: true,
                            showChartValuesOutside: false,
                            decimalPlaces: 1,
                          ),
                          dataMap: {
                            "Income": snapshot.data!.total_income.toDouble(),
                            "Expenditure":
                                snapshot.data!.total_expenses.toDouble(),
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
