import 'package:flutter/material.dart';

class TargetDetails {
  final String name;
  final double amount;
  final String importance;
  final DateTime? startDate;
  final DateTime? deadline;

  TargetDetails({
    required this.name,
    required this.amount,
    required this.importance,
    required this.startDate,
    required this.deadline,
  });
}