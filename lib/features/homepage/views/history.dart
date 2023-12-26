import 'package:flutter/material.dart';

class Randi extends StatelessWidget {
  const Randi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Numbers Button Example'),
        ),
        body: GridView.count(
          crossAxisCount: 4,
          children: [
            Center(
              child: NumbersButton(
                number: 7,
                onPressed: () {
                  // Handle button press for number 7
                  print('Button 7 pressed!');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NumbersButton extends StatelessWidget {
  final int number;
  final VoidCallback onPressed;

  const NumbersButton({
    super.key,
    required this.number,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Button border radius
        ),
      ),
      child: Text(
        '$number',
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
