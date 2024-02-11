import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'drawer.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

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
  final int income;
  final int expenses;
  final int asset;
  final int liabilities;
  final int target;

  const Album({
    required this.income,
    required this.expenses,
    required this.asset,
    required this.liabilities,
    required this.target,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        income: json['income'],
        expenses: json['expenses'],
        asset: json['asset'],
        liabilities: json['liabilities'],
        target: json['target']);
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
      drawer: const Cdrawer(),
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
            int? balance;
            if (snapshot.hasData) {
              balance = snapshot.data!.income -
                  snapshot.data!.expenses -
                  snapshot.data!.target;
            } else {
              balance =
                  null; // or any default value you want to assign when there's no data
            }

            // int balance = snapshot.data!.income -
            //     snapshot.data!.expenses -
            //     snapshot.data!.target;
            int? totalBalance;
            if (snapshot.hasData) {
              totalBalance = snapshot.data!.income - snapshot.data!.expenses;
            } else {
              totalBalance =
                  null; // or any default value you want to assign when there's no data
            }

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
                                        "Rs${snapshot.data!.income}",
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
                                        "Rs${snapshot.data!.expenses}",
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
                                        "Rs$balance",
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
                                        "Rs$totalBalance",
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
                          dataMap: {
                            "Asset": snapshot.data!.asset.toDouble(),
                            "Liabialiaties":
                                snapshot.data!.liabilities.toDouble(),
                          },
                        ),
                        PieChart(
                          dataMap: {
                            "Income": snapshot.data!.income.toDouble(),
                            "Expenditure": snapshot.data!.expenses.toDouble(),
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
