import 'package:flutter/material.dart';
import 'drawer.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer:  Cdrawer(),
      body: const User(),
      appBar: AppBar(
        toolbarHeight: 50,
        title: const Text("          Information",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        elevation: 10,
      ),
    );
  }
}

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "This application was developed by student of Kathmandu Engineering College. This application helps to keep record of the Asset/Liabilities and Income/Expenses of the user. It also have a loan calculator which simply calculates the loan amount of the user. User can also set their target in Target section and can track their expenses through the PI chart. We track the expenses of the user by 50-30-20 rule. In which user can spend their money of 50% for needs, 30% of their money for unnucessary expenses and 20% for reinvestment and saving.",
        style: TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

