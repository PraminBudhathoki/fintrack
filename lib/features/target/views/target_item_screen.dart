import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/target.dart';

class TargetItemScreen extends StatefulWidget {
  const TargetItemScreen({Key? key}) : super(key: key);

  @override
  State<TargetItemScreen> createState() => _TargetItemScreenState();
}

class _TargetItemScreenState extends State<TargetItemScreen> {
  TextEditingController targetNameController = TextEditingController();
  TextEditingController targetAmountController = TextEditingController();
  DateTime? selectedStartDate;
  DateTime? selectedDeadline;
  String selectedImportance = '';
  final index = -1;
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
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildText('Target Name', fontSize: 28.0),
          _buildTextField(targetNameController, 'like House, Mobile, etc'),
          _buildText('Target Amount', fontSize: 28.0),
          _buildTextField(targetAmountController, 'Rs.20000..'),
          _buildText('Importance', fontSize: 28.0),
          _buildImportanceChips(),
          _buildDateTimeRow('Start Date', selectedStartDate),
          _buildDateTimeRow('Deadline', selectedDeadline),
        ],
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
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        border: UnderlineInputBorder(
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
        _buildChoiceChip('Low'),
        _buildChoiceChip('Medium'),
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
          });
        },
        selectedColor: Colors.pink, // Highlight color
      ),
      onTap: (){

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
