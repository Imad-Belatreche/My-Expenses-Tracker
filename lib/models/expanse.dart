import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formater = DateFormat.yMd();

const uuid = Uuid();

const categoryIcons = {
  ExpenseCategory.food: Icons.fastfood,
  ExpenseCategory.travel: Icons.flight,
  ExpenseCategory.leisure: Icons.local_activity,
  ExpenseCategory.work: Icons.work,
};

class Expense {
  final String id;
  final String title;
  final int amount;
  final DateTime date;
  final ExpenseCategory category;

  String get formatedDate {
    return formater.format(date);
  }

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
}

enum ExpenseCategory {
  food,
  travel,
  leisure,
  work,
}
