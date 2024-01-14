import 'package:flutter/material.dart';
import 'accounts1.dart';
import 'drawer.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Cdrawer(),
      backgroundColor: Colors.white,
      body: const Aaaa(),
      appBar: AppBar(
        toolbarHeight: 50,
        title: const Text("             Contact us",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        elevation: 10,
        actions: const [],
      
      ),
    );
  }
}

class Aaaa extends StatelessWidget {
  const Aaaa({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Contact of the developers of this application are:\nAabiskar Bhattarai   : 9869670818\nNikesh Bhattarai      : 9860740289\nNirajan Dhital           : 9866296208\nPramin Budhathoki : 9864370517",
      style: TextStyle(
        fontSize: 20,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
