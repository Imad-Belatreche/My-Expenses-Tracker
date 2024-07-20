import 'package:expanses_track/models/expanse.dart';

class ExpenseBucket {
  final ExpenseCategory category;
  final List<Expense> expenses;

  ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  int get totalExpenses {
    int total = 0;

    for (final expense in expenses) {
      total += expense.amount;
    }

    return total;
  }
}
