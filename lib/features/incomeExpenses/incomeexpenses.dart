import 'package:fintrack/features/incomeExpenses/expenses.dart';
import 'package:flutter/material.dart';
import 'package:fintrack/features/homepage/views/homepage.dart';
import 'Income.dart';

class Three extends StatelessWidget {
  const Three({Key? key}) : super(key: key);

// build the app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                    icon: Text(
                  "Income",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
                Tab(
                    icon: Text(
                  "Expenses",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
              ],
            ),
            title: const Center(
                child: Text(
              "ADD         ",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
            backgroundColor: Colors.teal.shade800,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
          ),
          body: const TabBarView(
            children: [
              Income(),
              Expenses(),
            ],
          ),
        ),
      ),
    );
  }
}
