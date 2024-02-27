import 'package:flutter/material.dart';

import 'target_item_screen.dart';

class EmptyTargetScreen extends StatefulWidget {
  const EmptyTargetScreen({super.key});

  @override
  State<EmptyTargetScreen> createState() => _EmptyTargetScreenState();
}

class _EmptyTargetScreenState extends State<EmptyTargetScreen> {
  double targetWallet = 0.0;

  // Function to show the add/update/delete options dialog
  Future<void> _showOptionsDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add/Delete/Update'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the options dialog
                  _showAddDialog(); // Show the add dialog
                },
                child: Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the options dialog
                  _showUpdateDialog(); // Show the update dialog
                },
                child: Text('Update'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the options dialog
                  _removeAmount(); // Remove the amount
                },
                child: Text('Delete'),
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to show the add dialog
  Future<void> _showAddDialog() async {
    double newAmount = 0.0;

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Amount'),
          content: TextField(
            onChanged: (value) {
              newAmount = double.tryParse(value) ?? 0.0;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Enter Amount'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the add dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  targetWallet = newAmount;
                });
                Navigator.pop(context); // Close the add dialog
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  // Function to show the update dialog
  Future<void> _showUpdateDialog() async {
    double newAmount = targetWallet;

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Amount'),
          content: TextField(
            onChanged: (value) {
              newAmount = double.tryParse(value) ?? targetWallet;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Enter New Amount'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the update dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  targetWallet = newAmount;
                });
                Navigator.pop(context); // Close the update dialog
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  // Function to remove the amount
  void _removeAmount() {
    setState(() {
      targetWallet = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Replace and add layout widgets
    // 1
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add functionality for the floating button
          Navigator.push(context, MaterialPageRoute(builder: (context) => TargetItemScreen()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue, // Customize the color as needed
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        // 2
        child: Center(
          // 3
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              
              MaterialButton(
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.green,
                onPressed: () {
                  // TODO: Open a field to add target amount
                  // Show options dialog on button click
                  _showOptionsDialog();

                },
                child: const Text('Add or update or delete amount to the wallet'),
              ),
              // TODO: Add empty image
              Flexible(
                // 2
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.asset('assets/no_goals.jpg'),
                ),
              ),
              // TODO: Add empty screen title
              Text(
                'No Targets',
                style: Theme.of(context).textTheme.headline6,
              ),
              // TODO: Add empty screen subtitle
              const SizedBox(height: 16.0),
              const Text(
                'Want to add target?\n'
                'Tap the + button to write them down!',
                textAlign: TextAlign.center,
              ),

            ],
          ),
        ),
      ),
    );
    // return Container(color: Colors.purple);
  }
}
