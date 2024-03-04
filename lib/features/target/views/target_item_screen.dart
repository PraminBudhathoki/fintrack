import 'dart:convert';
import 'dart:io';
import 'package:fintrack/features/target/views/EmptyTargetScreen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/target.dart';

class TargetItemScreen extends StatefulWidget {
  final double amount;

  const TargetItemScreen({required this.amount, super.key});

  @override
  State<TargetItemScreen> createState() => _TargetItemScreenState();
}

class _TargetItemScreenState extends State<TargetItemScreen> {

  TextEditingController targetNameController = TextEditingController();
  TextEditingController targetAmountController = TextEditingController();
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedDeadline = DateTime.now().add(const Duration(days: 365));
  String selectedImportance = '';
  String priority = 'low';
  final index = -1;
<<<<<<< HEAD
  int targetamount = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () async {
                //double add_defaule = snapshot.data.
                String targetname = targetNameController.text;
                targetamount = int.parse(targetAmountController.text);
                await addtarget(targetname, targetamount, priority,
                    selectedStartDate, selectedDeadline);
                double addedamount = 0.0;
                double sendwill = widget.amount + addedamount;
                print("sendwill is $sendwill");
                //widget.amount = widget.amount + addedamount;
                await editTargetWallet(sendwill);
                // Handle check button press
                //Navigator.pop(context);
                // ignore: use_build_context_synchronously
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EmptyTargetScreen(),
                  ),
                );
              },
            )
           
          ],
          elevation: 0.0,
          title: Text(
            'Target item',
            style: GoogleFonts.lato(fontWeight: FontWeight.w600),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildText('Target Name', fontSize: 28.0),
            _buildTextField(targetNameController, 'like House, Mobile, etc'),
            _buildText('Target Amount', fontSize: 28.0),
            _buildTextField(targetAmountController, 'Rs.20000..'),
            _buildText('Priority', fontSize: 28.0),
            _buildImportanceChips(),
            _buildDateTimeRow('Start Date', selectedStartDate),
            _buildDateTimeRow('Deadline', selectedDeadline),
          ],
=======
  List<TargetDetails> targetDetailsList = [];


  void _handleCheckButtonPress() {
    // Create a TargetDetails object with the entered details
    TargetDetails targetDetails = TargetDetails(
      name: targetNameController.text,
      amount: double.tryParse(targetAmountController.text) ?? 0.0,
      importance: selectedImportance,
      startDate: selectedStartDate,
      deadline: selectedDeadline,
    );

    // Add the details to the list
    targetDetailsList.add(targetDetails);

    // Navigate back to the EmptyTargetScreen with the updated details list
    Navigator.pop(context, targetDetailsList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _handleCheckButtonPress,
          )
        ],
        elevation: 0.0,
        title: Text(
          'Target item',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
>>>>>>> 9e7c4a3f195476875119300b52c18235ef4e9ee8
        ),
      ),
    );
  }

  Widget _buildText(String text, {double fontSize = 16.0}) {
    return Text(
      text,
      style: GoogleFonts.lato(fontSize: fontSize),
      textAlign: TextAlign.left,
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return TextField(
      controller: controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildImportanceChips() {
    return Wrap(
      spacing: 10.0,
      children: [
        _buildChoiceChip('High'),
        _buildChoiceChip('Medium'),
        _buildChoiceChip('Low'),
      ],
    );
  }

  Widget _buildChoiceChip(String label) {
    return GestureDetector(
      child: ChoiceChip(
        label: Text(label),
        selected: selectedImportance == label,
        onSelected: (bool selected) {
          setState(() {
            selectedImportance = selected ? label : '';
            priority = label.toLowerCase();
          });
        },
        selectedColor: Colors.pink, // Highlight color
      ),
      onTap: () {
        //priority = selectedImportance;
        print("Ontab priority $priority");
        print("Ontab selectedImportance $selectedImportance");
      },
    );
  }

  Widget _buildDateTimeRow(String labelText, DateTime? selectedDate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildText(labelText, fontSize: 28.0),
        TextButton(
          child: Text(
            selectedDate != null
                ? DateFormat('yyyy-MM-dd').format(selectedDate)
                : 'Select',
          ),
          onPressed: () async {
            final currentDate = DateTime.now();
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: currentDate,
              firstDate: currentDate,
              lastDate: DateTime(currentDate.year + 5),
            );

            if (selectedDate != null) {
              setState(() {
                if (labelText == 'Start Date') {
                  selectedStartDate = selectedDate;
                } else if (labelText == 'Deadline') {
                  selectedDeadline = selectedDate;
                }
              });
            }
          },
        ),
      ],
    );
  }
}

Future<void> addtarget(String targetName, int targetAmount, String priority,
    DateTime startDate, DateTime deadline) async {
  print("\n$priority");
  String prioritys = '';

  if (priority == 'high') {
    prioritys = 'H';
  } else if (priority == 'medium') {
    prioritys = 'M';
  } else {
    prioritys = 'L';
  }
  final storage = const FlutterSecureStorage();

  String dateAsString1 = startDate.toIso8601String();
  String dateAsString2 = deadline.toIso8601String();

  // String dateAsString1 = DateFormat('yyyy-MM-dd').format(startDate);
  // String dateAsString2 = DateFormat('yyyy-MM-dd').format(deadline);
  print("\n$targetName");
  print("\n$targetAmount");
  print("\n$priority");
  print("\n$prioritys");
  print("\n$startDate");
  print("\n$deadline");

  Map<String, dynamic> requestBody = {
    'target_name': targetName,
    'current_amount': 0.0,
    'target_amount': targetAmount.toDouble(),
    'target_add_date': dateAsString1.toString(),
    'target_deadline': dateAsString2.toString(),
    'target_status': 'INCP',
    // 'target_priority': priority,
    'target_priority': prioritys,
  };
  final accessToken = await storage.read(key: 'access_token');
  print('JWT $accessToken');
  await http.post(Uri.parse('http://192.168.1.71:8000/targets/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        //'Content-Type': 'application/json',
        'Authorization': 'JWT $accessToken'
      },
      body: jsonEncode(requestBody));
}

// Future<void> editTargetWallet(double editedamount) async {
//   final storage = FlutterSecureStorage();

//   print("\n$editedamount");

//   Map<String, dynamic> requestBody = {
//     'amount': editedamount,
//     // You might need to include other fields if required by your backend
//   };
//   final accessToken = await storage.read(key: 'access_token');
//   print('JWT $accessToken');
//   await http.put(
//     Uri.parse('http://192.168.1.71:8000/targetwallet/update/'),
//     headers: {
//       'Content-Type': 'application/json; charset=UTF-8',
//       'Authorization': 'JWT $accessToken',
//     },
//     body: jsonEncode(requestBody),
//   );
// }

Future<void> editTargetWallet(double editedamount) async {
  final storage = const FlutterSecureStorage();

  print("\n$editedamount");

  Map<String, dynamic> requestBody = {
    'amount': editedamount,
    // You might need to include other fields if required by your backend
  };
  final accessToken = await storage.read(key: 'access_token');
  print('JWT $accessToken');
  await http.put(
    Uri.parse('http://192.168.1.71:8000/targetwallet/update/'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'JWT $accessToken',
    },
    body: jsonEncode(requestBody),
  );
}
