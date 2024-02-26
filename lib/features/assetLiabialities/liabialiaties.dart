import 'dart:io';
import 'package:fintrack/features/assetLiabialities/assetliabialiaties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:ui';
import '../incomeExpenses/incomeexpenses.dart';

Future<List<Album>> fetchAlbum() async {
  final storage = FlutterSecureStorage();
  final accessToken = await storage.read(key: 'access_token');
  print('JWT $accessToken');
  //await addasset();
  final response = await http.get(
      Uri.parse('http://192.168.1.71:8000/liabilitycategories/?format=json'),
      headers: {
        HttpHeaders.authorizationHeader: 'JWT $accessToken',
      });

  if (response.statusCode == 200) {
    Iterable list = json.decode(response.body);
    return List<Album>.from(list.map((model) => Album.fromJson(model)));
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  final int id;
  final String category_name;

  const Album({
    required this.id,
    required this.category_name,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      category_name: json['category_name'],
    );
  }
}

class Liabialiaties extends StatefulWidget {
  const Liabialiaties({super.key});

  @override
  State<Liabialiaties> createState() => _AiconState();
}

class _AiconState extends State<Liabialiaties> {
  late Future<List<Album>> futureAlbum;
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  List<String> types = [];

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

  String selectedType = '';
  int item = 1;
  int value1 = 0;
  String value2 = 'Empty';

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: FutureBuilder<List<Album>>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              types =
                  snapshot.data!.map((album) => album.category_name).toList();
              if (selectedType.isEmpty && types.isNotEmpty) {
                selectedType = types.first; // Select the first item by default
              }

              return ListView(
                padding: const EdgeInsets.all(6),
                children: [
                  const Padding(
                    padding: EdgeInsets.all(6),
                    child: ListTile(
                      tileColor: Colors.black26,
                      title: Text("Liability Details"),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(6.0),
                    child:
                        Text("Select Category", style: TextStyle(fontSize: 20)),
                  ),
                  DropdownButtonFormField<String>(
                    value: selectedType,
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
                        item = types.indexOf(value) + 1;
                      });
                    },
                    items: types.map((category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Add new liability:"),
                          content: TextField(
                            controller: _controller1,
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () async {
                                String newCategory = _controller1.text;
                                if (newCategory.isNotEmpty) {
                                  await addliabilityc(newCategory);
                                }

                                types.add(newCategory);
                                selectedType = newCategory;
                                Navigator.of(ctx).pop();

                                _refreshData();
                              },
                              child: const Text("Add"),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Add Category",
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text("Amount", style: TextStyle(fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextField(
                      controller: _controller2,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter amount',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text("Note", style: TextStyle(fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextField(
                      controller: _controller3,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Notes or Remarks',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.purple)),
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null && pickedDate != selectedDate) {
                          setState(() {
                            selectedDate = pickedDate;
                          });
                        }
                      },
                      child: const Text(
                        "Select Date",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.purple)),
                      onPressed: () {
                        value1 = int.parse(_controller2.text);
                        String value2 = _controller3.text;
                        print("This is item number $item");
                        //deleteasset(selectedType);
                        addliability(value2, value1, selectedDate, item);
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  title:
                                      const Text("Liability added successfully:"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();

                                        _refreshData();
                                      },
                                      child: const Text("Ok"),
                                    ),
                                  ],
                                ));
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}

Future<void> addliabilityc(String category_name) async {
  final storage = FlutterSecureStorage();

  print("\n$category_name");

  Map<String, dynamic> requestBody = {
    'category_name': category_name,
  };
  final accessToken = await storage.read(key: 'access_token');
  print('JWT $accessToken');
  await http.post(Uri.parse('http://192.168.1.71:8000/liabilitycategories/'),
      //http://127.0.0.1:8000/incomes/
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        //'Content-Type': 'application/json',
        'Authorization': 'JWT $accessToken'
      },
      body: jsonEncode(requestBody));
}

Future<void> addliability(String liability_note, int liability_amount,
    DateTime liability_date, int liability_index) async {
  final storage = FlutterSecureStorage();
  //String dateAsString = dateOfBirth.toIso8601String().substring(0, 10);
  //print(dateOfBirth);
  //String dateAsString = DateFormat('mm/dd/yyyy').format(asset_date);
  String dateAsString = DateFormat('yyyy-MM-dd').format(liability_date);
  print("\n$liability_note");
  print("\n$liability_amount");
  print("\n$dateAsString");
  print("\n$liability_index");

  Map<String, dynamic> requestBody = {
    'liability_note': liability_note,
    'liability_amount': liability_amount.toDouble(),
    'liability_date': dateAsString,
    'liability_category': liability_index
  };
  final accessToken = await storage.read(key: 'access_token');
  print('JWT $accessToken');
  await http.post(Uri.parse('http://192.168.1.71:8000/liabilitys/'),
      //http://127.0.0.1:8000/incomes/
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        //'Content-Type': 'application/json',
        'Authorization': 'JWT $accessToken'
      },
      body: jsonEncode(requestBody));
}
