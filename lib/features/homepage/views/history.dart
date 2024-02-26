import 'dart:io';
import 'package:fintrack/features/homepage/views/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> fetchAlbum() async {
  final storage = FlutterSecureStorage();
  final accessToken = await storage.read(key: 'access_token');
  final response = await http.get(
      Uri.parse('http://192.168.1.71:8000/history/?format=json'),
      headers: {
        HttpHeaders.authorizationHeader: 'JWT $accessToken',
      });

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON
    List<dynamic> data = json.decode(response.body);
    return List<Map<String, dynamic>>.from(data);
  } else {
    // If the server returns an error response, throw an exception
    throw Exception('Failed to fetch data');
  }
}

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _MyAppState();
}

class _MyAppState extends State<History> {
  late Future<List<Map<String, dynamic>>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  Future<void> _refreshData() async {
    setState(() {
      futureAlbum = fetchAlbum();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        drawer: Cdrawer(),
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text('History', style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: RefreshIndicator(
            onRefresh: _refreshData,
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final item = snapshot.data![index];

                      String categoryText;
                      String type;
                      if (item.containsKey('asset_category__category_name')) {
                        categoryText = 'Asset';
                      } else if (item
                          .containsKey('income_category__category_name')) {
                        categoryText = 'Income';
                      } else if (item
                          .containsKey('liability_category__category_name')) {
                        categoryText = 'Liability';
                      } else if (item
                          .containsKey('expense_category__category_name')) {
                        categoryText = 'Expenses';
                      } else {
                        categoryText = 'Unknown';
                      }

                      if (item.containsKey('asset_category__category_name')) {
                        type = 'assets';
                      } else if (item
                          .containsKey('income_category__category_name')) {
                        type = 'incomes';
                      } else if (item
                          .containsKey('liability_category__category_name')) {
                        type = 'liabilitys';
                      } else if (item
                          .containsKey('expense_category__category_name')) {
                        type = 'expenses';
                      } else {
                        type = 'Unknown';
                      }

                      int ids = item['id'];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PhysicalModel(
                          color: Colors.blueGrey,
                          elevation: 10,
                          borderRadius: BorderRadius.circular(15),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("$categoryText Details:"),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          Text(
                                              'Category: ${item['asset_category__category_name'] ?? item['income_category__category_name'] ?? item['liability_category__category_name'] ?? item['expense_category__category_name']}'),
                                          Text(
                                              'Amount: ${item['asset_amount'] ?? item['income_amount'] ?? item['liability_amount'] ?? item['expense_amount']}'),
                                          Text(
                                              'Date: ${item['asset_date'] ?? item['income_date'] ?? item['liability_date'] ?? item['expense_date']}'),
                                          //const Text("Date:2080-10-25"),
                                          Text(
                                              'Note: ${item['asset_note'] ?? item['income_note'] ?? item['liability_note'] ?? item['expense_note']}'),
                                          Text('User ID: ${item['id']}'),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          deleteData(type, ids);
                                          _refreshData();
                                          setState(() {
                                            futureAlbum = fetchAlbum();
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Delete'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Close'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: ListTile(
                              title: Row(
                                children: [Text("$categoryText:")],
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                      'Category: ${item['asset_category__category_name'] ?? item['income_category__category_name'] ?? item['liability_category__category_name'] ?? item['expense_category__category_name']}'),
                                  //Text(album.note),
                                ],
                              ),
                              trailing: Text(
                                  'Amount: ${item['asset_amount'] ?? item['income_amount'] ?? item['liability_amount'] ?? item['expense_amount']}',
                                  style: const TextStyle(fontSize: 15)),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> deleteData(String type, int id) async {
  print(type);
  print(id);
  final storage = FlutterSecureStorage();
  final accessToken = await storage.read(key: 'access_token');
  final response = await http.delete(
    Uri.parse('http://192.168.1.71:8000/$type/$id/'),
    headers: {
      HttpHeaders.authorizationHeader: 'JWT $accessToken',
    },
  );

  if (response.statusCode == 204) {
    print('Data with ID $id of type $type deleted successfully');
  } else {
    throw Exception('Failed to delete data: ${response.statusCode}');
  }
}
