import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Income extends StatelessWidget {
  const Income({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Iicon(),
    );
  }
}

class Iicon extends StatefulWidget {
  const Iicon({super.key});

  @override
  State<Iicon> createState() => _IiconState();
}

class _IiconState extends State<Iicon> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 18,
      crossAxisSpacing: 18,
      crossAxisCount: 4,
      padding: const EdgeInsets.all(15),
      children: [
        PhysicalModel(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                Icon(Icons.wallet, size: 55, color: Colors.blueGrey),
                Text("Salary",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 1;
              _showBottomSheet(context, index);
            },
          ),
        ),
        PhysicalModel(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.black87,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                FaIcon(FontAwesomeIcons.moneyCheckDollar,
                    size: 55, color: Colors.blueGrey),
                Text("Refunds",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 2;
              _showBottomSheet(context, index);
            },
          ),
        ),
        PhysicalModel(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                Icon(Icons.card_giftcard, size: 55, color: Colors.blueGrey),
                Text("Grants",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 3;
              _showBottomSheet(context, index);
            },
          ),
        ),
        PhysicalModel(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.black87,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                FaIcon(FontAwesomeIcons.piggyBank,
                    size: 50, color: Colors.blueGrey),
                //Icon(Icons., size: 75, color: Colors.blueGrey),
                Text("Investment",
                    style: TextStyle(
                        fontFamily: AutofillHints.addressCity,
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 4;
              _showBottomSheet(context, index);
            },
          ),
        ),
        PhysicalModel(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                Icon(Icons.home_work_outlined,
                    size: 55, color: Colors.blueGrey),
                Text("Rental",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 5;
              _showBottomSheet(context, index);
            },
          ),
        ),
        PhysicalModel(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.black87,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                Icon(Icons.more_rounded, size: 55, color: Colors.blueGrey),
                Text("Lottery",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 6;
              _showBottomSheet(context, index);
            },
          ),
        ),
        PhysicalModel(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                FaIcon(FontAwesomeIcons.award,
                    size: 55, color: Colors.blueGrey),
                Text("Awards",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 7;
              _showBottomSheet(context, index);
            },
          ),
        ),
        PhysicalModel(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.black87,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                // FaIcon(FontAwesomeIcons.monero,
                //     size: 75, color: Colors.blueGrey),
                Icon(
                  Icons.moving_sharp,
                  size: 55,
                  color: Colors.blueGrey,
                ),
                Text("Dividends",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 8;
              _showBottomSheet(context, index);
            },
          ),
        ),
        PhysicalModel(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                FaIcon(FontAwesomeIcons.tags, size: 55, color: Colors.blueGrey),
                //Icon(Icons.fmd_good_sharp, size: 75),
                Text("Sale",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 9;
              _showBottomSheet(context, index);
            },
          ),
        ),
        PhysicalModel(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.black87,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                Icon(Icons.add, size: 55, color: Colors.blueGrey),
                Text("Others",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 10;
              //_showBottomSheet(context);
              _showBottomSheet(context, index);
            },
          ),
        ),
      ],
    );
  }
}

void _showBottomSheet(BuildContext context, int index) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      //use this controller to get what the user typed.
      final amount = TextEditingController();
      final note = TextEditingController();
      //DateTime selectedDeadline = DateTime.now();
      DateTime selectedDate = DateTime.now();
      //String category = " ";
      String type = "Income";
      // if (index == 1) {
      //   category = "Salary";
      // } else if (index == 2) {
      //   category = "Refunds";
      // } else if (index == 3) {
      //   category = "Grants";
      // } else if (index == 4) {
      //   category = "Investment";
      // } else if (index == 5) {
      //   category = "Rental";
      // } else if (index == 6) {
      //   category = "Lottery";
      // } else if (index == 7) {
      //   category = "Awards";
      // } else if (index == 8) {
      //   category = "Dividends";
      // } else if (index == 9) {
      //   category = "Sale";
      // } else {
      //   category = "Others";
      // }

      return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: amount,
                autofocus: true,
                keyboardType: TextInputType.number,
                //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_box_rounded),
                  ),
                  hintStyle: const TextStyle(fontSize: 20),
                  border: const OutlineInputBorder(),
                  hintText: 'Enter amount.',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: note,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(fontSize: 20),
                  hintText: 'Enter note',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple),
                    ),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2121),
                      );
                      if (pickedDate != null && pickedDate != selectedDate) {
                        selectedDate = pickedDate;
                      }
                    },
                    child: const Text(
                      "Select Date",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple),
                    ),
                    onPressed: () {
                      int value1 = int.parse(amount.text);
                      String value2 = note.text;
                      createAlbum(type, index, value1, value2, selectedDate);
                      //Navigator.of(context).pop();
                    },
                    child:
                        const Text("Ok", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Future<void> createAlbum(String title, int index, int amount, String note,
    DateTime dateOfBirth) async {
  final storage = FlutterSecureStorage();
  //String dateAsString = dateOfBirth.toIso8601String().substring(0, 10);
  print(dateOfBirth);
  String dateAsString = DateFormat('yyyy-MM-dd').format(dateOfBirth);
  print("$title\n$index\n$amount\n$dateAsString\n$note");

  Map<String, dynamic> requestBody = {
    'income_note': note,
    'income_amount': amount.toDouble(),
    'income_date': dateAsString,
    'income_category': index,
    //'income_title' : 1,
  };
  final accessToken = await storage.read(key: 'access_token');
  print('JWT $accessToken');
  await http.post(Uri.parse('http://192.168.1.71:8000/incomes/'),
      //http://127.0.0.1:8000/incomes/
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        //'Content-Type': 'application/json',
        'Authorization': 'JWT $accessToken'
      },
      body: jsonEncode(requestBody));
}
