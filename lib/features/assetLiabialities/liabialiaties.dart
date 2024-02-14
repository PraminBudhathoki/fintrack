import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Liabialiaties extends StatelessWidget {
  const Liabialiaties({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Licon(),
    );
  }
}

class Licon extends StatefulWidget {
  const Licon({super.key});

  @override
  State<Licon> createState() => _LiconState();
}

class _LiconState extends State<Licon> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();

  String type = "Liabilities";

  List<String> types = [
    'Loan',
    'Advanced income',
    'Unpaid expenses',
  ];
  String selectedType = 'Loan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: const Text('Demo')),
        body: Builder(
      builder: (BuildContext context) {
        DateTime selectedDate = DateTime.now();
        return ListView(
          padding: const EdgeInsets.all(6),
          children: [
            const Padding(
              padding: EdgeInsets.all(6),
              child: ListTile(
                tileColor: Colors.black26,
                title: Text("Liabialiaties Details"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(6.0),
              child: Text("Select Category", style: TextStyle(fontSize: 20)),
            ),
            DropdownButtonFormField<String>(
              value: selectedType,
              iconEnabledColor: const Color(0xFFC3C3C3),
              iconDisabledColor: const Color(0xFFC3C3C3),
              iconSize: 25,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              items: types.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  // child: Text("Ok")
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedType = value!;
                });
              },
              // decoration: customTextfieldDecoration(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Select Category',
              ),
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Add new liabilities:"),
                    content: TextField(
                      controller: _controller1,
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          String newCategory = _controller1.text;
                          if (newCategory.isNotEmpty) {
                            setState(() {
                              types.add(newCategory);
                              selectedType = newCategory;
                            });
                          }
                          Navigator.of(ctx).pop();
                        },
                        child: const Text("Ok"),
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
                    backgroundColor: MaterialStatePropertyAll(Colors.purple)),
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
                    backgroundColor: MaterialStatePropertyAll(Colors.purple)),
                onPressed: () {
                  int value1 = int.parse(_controller2.text);
                  String value2 = _controller3.text;
                  createAlbum(type, selectedType, value1, value2, selectedDate);
                },
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    ));
  }
}

Future<void> createAlbum(String title, String index, int amount, String note,
    DateTime dateOfBirth) async {
  final storage = FlutterSecureStorage();
  //String dateAsString = dateOfBirth.toIso8601String().substring(0, 10);
  print(dateOfBirth);
  String dateAsString = DateFormat('yyyy-MM-dd').format(dateOfBirth);
  print("$title\n$index\n$amount\n$dateAsString\n$note");

  Map<String, dynamic> requestBody = {
    'liabilities_note': note,
    'liabilities_amount': amount.toDouble(),
    'liabilities_date': dateAsString,
    'liabilities_category': index,
  };
  final accessToken = await storage.read(key: 'access_token');
  print('JWT $accessToken');
  await http.post(Uri.parse('http://192.168.1.167:8000/incomes/'),
      //http://127.0.0.1:8000/incomes/
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        //'Content-Type': 'application/json',
        'Authorization': 'JWT $accessToken'
      },
      body: jsonEncode(requestBody));
}
