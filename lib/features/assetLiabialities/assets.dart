import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Future<List<Album>> fetchAlbum() async {
  final storage = FlutterSecureStorage();
  final accessToken = await storage.read(key: 'access_token');
  print('JWT $accessToken');

  final response = await http.get(
      Uri.parse('http://192.168.1.71:8000/assetcategories/?format=json'),
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

class Asset extends StatefulWidget {
  const Asset({super.key});

  @override
  State<Asset> createState() => _AiconState();
}

class _AiconState extends State<Asset> {
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
  String value2 = 'Null';

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
                      title: Text("Asset Details"),
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
                          title: const Text("Add new asset:"),
                          content: TextField(
                            controller: _controller1,
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () async {
                                String newCategory = _controller1.text;
                                if (newCategory.isNotEmpty) {
                                  await addassetc(newCategory);
                                }
                                //await fetchAlbum();
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
                      onPressed: () async {
                        if (_controller2.text.isNotEmpty) {
                          value1 = int.parse(_controller2.text);
                          if (_controller3.text.isNotEmpty) {
                            value2 = _controller3.text;
                          }
                          print("This is item number $item");
                          //deleteasset(selectedType);
                          addasset(value2, value1, selectedDate, item);
                          _refreshData();
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                    title:
                                        const Text("Asset added successfully:"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                        child: const Text("Ok"),
                                      ),
                                    ],
                                  ));
                        } else {
                          // Show an error message if the amount field is empty
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter an amount.'),
                            ),
                          );
                        }
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

Future<void> addassetc(String category_name) async {
  final storage = FlutterSecureStorage();

  print("\n$category_name");

  Map<String, dynamic> requestBody = {
    'category_name': category_name,
  };
  final accessToken = await storage.read(key: 'access_token');
  print('JWT $accessToken');
  await http.post(Uri.parse('http://192.168.1.71:8000/assetcategories/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        //'Content-Type': 'application/json',
        'Authorization': 'JWT $accessToken'
      },
      body: jsonEncode(requestBody));
}

Future<void> addasset(String asset_note, int asset_amount, DateTime asset_date,
    int asset_index) async {
  final storage = FlutterSecureStorage();

  String dateAsString = DateFormat('yyyy-MM-dd').format(asset_date);
  print("\n$asset_note");
  print("\n$asset_amount");
  print("\n$dateAsString");
  print("\n$asset_index");

  Map<String, dynamic> requestBody = {
    'asset_note': asset_note,
    'asset_amount': asset_amount.toDouble(),
    'asset_date': dateAsString,
    'asset_category': asset_index
  };
  final accessToken = await storage.read(key: 'access_token');
  print('JWT $accessToken');
  await http.post(Uri.parse('http://192.168.1.71:8000/assets/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        //'Content-Type': 'application/json',
        'Authorization': 'JWT $accessToken'
      },
      body: jsonEncode(requestBody));
}
