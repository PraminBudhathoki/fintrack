import 'package:fintrack/features/homepage/views/drawer.dart';
import 'package:flutter/material.dart';

class Transaction {
  final String type;
  final String description;
  final double amount;

  Transaction({
    required this.type,
    required this.description,
    required this.amount,
  });
}

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HistoryPage(),
    );
  }
}

class HistoryPage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(type: 'Income', description: 'Salary', amount: 3000.0),
    Transaction(type: 'Expense', description: 'Groceries', amount: 200.0),
    Transaction(type: 'Income', description: 'Freelance', amount: 500.0),
    Transaction(type: 'Expense', description: 'Utilities', amount: 150.0),
  ];

  HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Cdrawer(),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('History'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          Transaction transaction = transactions[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.blueGrey,
              title: Text(transaction.type),
              subtitle: Text(
                  '${transaction.description}: \$${transaction.amount.toString()}'),
            ),
          );
        },
      ),
    );
  }
}
