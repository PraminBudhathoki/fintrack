import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Eicon(),
    );
  }
}

class Eicon extends StatefulWidget {
  const Eicon({super.key});

  @override
  State<Eicon> createState() => _EiconState();
}

class _EiconState extends State<Eicon> {
  @override
  int index = 0;
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
                Icon(Icons.food_bank_outlined,
                    size: 55, color: Colors.blueGrey),
                Text("Food",
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
                Icon(Icons.water_drop_sharp, size: 55, color: Colors.blueGrey),
                Text("Fuel",
                    style: TextStyle(
                        color: Colors.black87,
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
          shadowColor: Colors.black87,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                Icon(Icons.money_off_sharp, size: 55, color: Colors.blueGrey),
                Text("Bills",
                    style: TextStyle(
                        color: Colors.black,
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
                Icon(Icons.shopping_cart, size: 55, color: Colors.blueGrey),
                Text("Grocery",
                    style: TextStyle(
                        color: Colors.black,
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
          shadowColor: Colors.black87,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                Icon(Icons.school_outlined, size: 55, color: Colors.blueGrey),
                Text("Education",
                    style: TextStyle(
                        color: Colors.black,
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
          shadowColor: Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                FaIcon(FontAwesomeIcons.baby, size: 55, color: Colors.blueGrey),
                Text("Baby",
                    style: TextStyle(
                        color: Colors.black87,
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
                Icon(Icons.file_copy_outlined,
                    size: 55, color: Colors.blueGrey),
                Text("Tax",
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
          shadowColor: Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                Icon(Icons.emoji_transportation_sharp,
                    size: 55, color: Colors.blueGrey),
                Text("Transport",
                    style: TextStyle(
                        fontFamily: AutofillHints.addressCity,
                        color: Colors.black87,
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
                FaIcon(FontAwesomeIcons.house,
                    size: 55, color: Colors.blueGrey),
                //Icon(Icons.fmd_good_sharp, size: 75),
                Text("Home",
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
          shadowColor: Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                Icon(Icons.movie_outlined, size: 55, color: Colors.blueGrey),
                Text("Movie",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 10;
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
                Icon(
                  FontAwesomeIcons.shirt,
                  size: 55,
                  color: Colors.blueGrey,
                ),
                Text("Clothing",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 11;
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
                FaIcon(FontAwesomeIcons.shieldHeart,
                    size: 55, color: Colors.blueGrey),
                Text("Insurance",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 12;
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
                FaIcon(FontAwesomeIcons.plane,
                    size: 55, color: Colors.blueGrey),
                Text("Travel",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 13;
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
                FaIcon(FontAwesomeIcons.laptop,
                    size: 55, color: Colors.blueGrey),
                //Icon(Icons.fmd_good_sharp, size: 75),
                Text("Electronic",
                    style: TextStyle(
                        fontFamily: AutofillHints.addressCity,
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 14;
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
                Icon(Icons.devices_outlined, size: 55, color: Colors.blueGrey),
                Text("Office",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 15;
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
                Icon(Icons.support, size: 55, color: Colors.blueGrey),
                Text("Fitness",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 16;
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
                Icon(Icons.sports_baseball_rounded,
                    size: 55, color: Colors.blueGrey),
                Text("Sports",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 17;
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
                Icon(Icons.phone, size: 55, color: Colors.blueGrey),
                Text("Telephone",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 18;
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
                FaIcon(FontAwesomeIcons.cat, size: 55, color: Colors.blueGrey),
                //Icon(Icons.fmd_good_sharp, size: 75),
                Text("Pet",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 19;
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
                Icon(Icons.smoking_rooms, size: 55, color: Colors.blueGrey),
                Text("Cigaratte",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 20;
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
                Icon(Icons.bed_sharp, size: 55, color: Colors.blueGrey),
                Text("Furniture",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 21;
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
                Icon(Icons.face_retouching_natural_sharp,
                    size: 55, color: Colors.blueGrey),
                Text("Beauty",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 22;
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
                FaIcon(FontAwesomeIcons.book, size: 55, color: Colors.blueGrey),
                Text("Books",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 23;
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
                FaIcon(FontAwesomeIcons.gift, size: 55, color: Colors.blueGrey),
                //Icon(Icons.fmd_good_sharp, size: 75),
                Text("Gift",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 24;
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
                Icon(Icons.wine_bar_outlined, size: 55, color: Colors.blueGrey),
                Text("Beverage",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 25;
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
                Icon(Icons.medication, size: 55, color: Colors.blueGrey),
                Text("Health",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              index = 26;
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
              index = 27;
              _showBottomSheet(context, index);
            },
          ),
        ),
      ],
    );
  }
}

void _showBottomSheet(BuildContext context, index) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      final amount = TextEditingController();
      final note = TextEditingController();
      //DateTime selectedDeadline = DateTime.now();
      DateTime selectedDate = DateTime.now();
      //String category;
      //String type = "Expenses";
      // if (index == 1) {
      //   category = "Food";
      // } else if (index == 2) {
      //   category = "Fuel";
      // } else if (index == 3) {
      //   category = "Bills";
      // } else if (index == 4) {
      //   category = "Grocery";
      // } else if (index == 5) {
      //   category = "Education";
      // } else if (index == 6) {
      //   category = "Baby";
      // } else if (index == 7) {
      //   category = "Tax";
      // } else if (index == 8) {
      //   category = "Transportation";
      // } else if (index == 9) {
      //   category = "Home";
      // } else if (index == 10) {
      //   category = "Movie";
      // } else if (index == 11) {
      //   category = "Clothing";
      // } else if (index == 12) {
      //   category = "Insurance";
      // } else if (index == 13) {
      //   category = "Travel";
      // } else if (index == 14) {
      //   category = "Electronics";
      // } else if (index == 15) {
      //   category = "Office";
      // } else if (index == 16) {
      //   category = "Fitness";
      // } else if (index == 17) {
      //   category = "Sports";
      // } else if (index == 18) {
      //   category = "Telephone";
      // } else if (index == 19) {
      //   category = "Pet";
      // } else if (index == 20) {
      //   category = "Cigaratte";
      // } else if (index == 21) {
      //   category = "Furniture";
      // } else if (index == 22) {
      //   category = "Beauty";
      // } else if (index == 23) {
      //   category = "Books";
      // } else if (index == 24) {
      //   category = "Gift";
      // } else if (index == 25) {
      //   category = "Beverage";
      // } else if (index == 26) {
      //   category = "Health";
      // } else {
      //   category = "Others";
      // }

      return SingleChildScrollView(
        child: SizedBox(
          height: 310,
          //width: 50,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  //style: TextStyle(color: Colors.green),
                  controller: amount,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(),
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
                    hintStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(),
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
                        // createAlbum(
                        //     type, category, value1, value2, selectedDate);
                        Navigator.of(context).pop();
                      },
                      child: const Text("Ok",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

// Future<http.Response> createAlbum(String title, String category, int amount,
//     String note, DateTime dateOfBirth) {
//   String dateAsString = dateOfBirth.toIso8601String().substring(0, 10);
//   print("$title\n$category\n$amount\n$dateAsString\n$note");

//   return http.post(
//     Uri.parse('http://127.0.0.1:8000/admin/app/income/'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(
//       <String, dynamic>{
//         //'title': title,
//         'expenses_category': category,
//         'expenses_date': dateAsString,
//         'expenses_amount': amount,
//         'expenses_note': note,
//         //'user':
//       },
//     ),
//   );
// }

Future<void> createAlbum(String title, int index, int amount, String note,
    DateTime dateOfBirth) async {
  //String dateAsString = dateOfBirth.toIso8601String().substring(0, 10);
  print(dateOfBirth);
  String dateAsString = DateFormat('yyyy-MM-dd').format(dateOfBirth);
  print("$title\n$index\n$amount\n$dateAsString\n$note");

  Map<String, dynamic> requestBody = {
    'expenses_category': index,
    'expenses_date': dateAsString,
    'expenses_amount': amount,
    'expenses_note': note,
  };
  await http.post(Uri.parse('http://10.10.9.53:8000/incomes/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        //'Content-Type': 'application/json',
        'Authorization':
            'JWT eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzA4MTAwNzcyLCJpYXQiOjE3MDc2Njg3NzIsImp0aSI6IjMyNDYzOTZmNjQxMzQxNmNhMDZjNTUwZmFkZGU3M2U0IiwidXNlcl9pZCI6MX0.LJ2foNvZJMORUkzl3-K7zhc771hpvaj_9qEhAcn2yt4'
      },
      body: jsonEncode(requestBody));
}
