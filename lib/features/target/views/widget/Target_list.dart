import 'package:fintrack/features/target/views/widget/target.dart';
import 'package:flutter/material.dart';

class TargetsList extends StatelessWidget {
  final List<Target> targets;

  const TargetsList({super.key, required this.targets});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: targets.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(targets[index].name),
          subtitle: Container(
            child: Column(
              children: [
                Text('Amount: ${targets[index].amount.toString()}'),
                Text('Date: ${targets[index].date.toString()}'),
                Text('Deadline: ${targets[index].deadline.toString()}'),
              ],
            ),
          ),
          onTap: () {
            // Handle onTap if needed
          },
        );
      },
    );
  }
}
