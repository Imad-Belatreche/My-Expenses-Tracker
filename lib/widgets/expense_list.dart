import 'package:expanses_track/models/expanse.dart';
import 'package:expanses_track/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
    required this.removeExpense,
  });

  final void Function(Expense expense) removeExpense;

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return expenses.isEmpty
        ? Center(
            child: Text(
              'You have no expenses yet!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          )
        : ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              return ExpenseItem(
                onRemoveExpense: removeExpense,
                expense: expenses[index],
              );
            },
          );
  }
}
