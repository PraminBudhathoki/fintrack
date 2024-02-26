import 'package:flutter/material.dart';

import 'target_item_screen.dart';

class EmptyTargetScreen extends StatefulWidget {
  const EmptyTargetScreen({super.key});

  @override
  State<EmptyTargetScreen> createState() => _EmptyTargetScreenState();
}

class _EmptyTargetScreenState extends State<EmptyTargetScreen> {
  double targetWallet = 0.0;

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


                },
                child: const Text('Add Target Amount to the wallet'),
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
