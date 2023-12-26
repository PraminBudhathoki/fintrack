import 'package:flutter/material.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  // Variables to store income data
  double salaryIncome = 0.0;
  double businessIncome = 0.0;
  double otherIncome = 0.0;

  // Controllers for text input
  TextEditingController salaryController = TextEditingController();
  TextEditingController businessController = TextEditingController();
  TextEditingController otherController = TextEditingController();

  // Function to handle adding income
  void addIncome(double amount, String category) {
    setState(() {
      // Update the corresponding income category
      if (category == 'Salary') {
        salaryIncome += amount;
      } else if (category == 'Business') {
        businessIncome += amount;
      } else if (category == 'Other') {
        otherIncome += amount;
      }
    });
  }

  // Function to handle deleting income data
  void deleteIncome(String category) {
    setState(() {
      // Reset the corresponding income category
      if (category == 'Salary') {
        salaryIncome = 0.0;
        salaryController.clear();
      } else if (category == 'Business') {
        businessIncome = 0.0;
        businessController.clear();
      } else if (category == 'Other') {
        otherIncome = 0.0;
        otherController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildIncomeCategory('Salary', Icons.attach_money, salaryController),
            buildIncomeCategory('Business', Icons.business, businessController),
            buildIncomeCategory(
                'Other', Icons.monetization_on, otherController),
          ],
        ),
      ),
    );
  }

  Widget buildIncomeCategory(
      String category, IconData icon, TextEditingController controller) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, size: 30.0),
                Text(category, style: const TextStyle(fontSize: 18.0)),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Enter $category Income'),
                          content: TextField(
                            keyboardType: TextInputType.number,
                            controller: controller,
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                double amount =
                                    double.tryParse(controller.text) ?? 0.0;
                                addIncome(amount, category);
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('Add Income'),
                ),
                ElevatedButton(
                  onPressed: () {
                    deleteIncome(category);
                  },
                  child: const Text('Delete Data'),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Text('Total Income: \$${getTotalIncome(category)}'),
          ],
        ),
      ),
    );
  }

  double getTotalIncome(String category) {
    if (category == 'Salary') {
      return salaryIncome;
    } else if (category == 'Business') {
      return businessIncome;
    } else if (category == 'Other') {
      return otherIncome;
    }
    return 0.0;
  }
}

class Abs extends StatelessWidget {
  const Abs({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: IncomePage(),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String selectedOption = 'Option 1';
//   List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dropdown Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Selected Option: $selectedOption',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 20),
//             DropdownButton<String>(
//               value: selectedOption,
//               onChanged: (String newValue) {
//                 setState(() {
//                   selectedOption = newValue;
//                 });
//               },
//               items:
//                   dropdownItems.map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
