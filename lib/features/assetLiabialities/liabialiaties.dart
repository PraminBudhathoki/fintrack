import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

Future<http.Response> createAlbum(String title, String category, int amount,
    String note, DateTime dateOfBirth) {
  String dateAsString = dateOfBirth.toIso8601String().substring(0, 10);
  print("$title\n$category\n$amount\n$dateAsString\n$note");

  return http.post(
    Uri.parse('http://127.0.0.1:8000/admin/app/income/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, dynamic>{
        //'title': title,
        'income_category': category,
        'income_date': dateAsString,
        'income_amount': amount,
        'income_note': note,
        //'user':
      },
    ),
  );
}
