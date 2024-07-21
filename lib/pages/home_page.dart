import 'package:expanses_track/models/expanse.dart';
import 'package:expanses_track/pages/add_expanse_page.dart';
import 'package:expanses_track/widgets/chart/chart.dart';
import 'package:expanses_track/widgets/expense_list.dart';
import 'package:flutter/material.dart';

final List<Expense> expenseList = [
  Expense(
    title: 'Text',
    amount: 10000,
    date: DateTime.now(),
    category: ExpenseCategory.food,
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _openAddExpense() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
      ),
      context: context,
      builder: (ctx) => AddExpenseForm(addExpense: _addExpense),
    );
    setState(() {});
  }

  void _addExpense(Expense newExpense) {
    setState(() {
      expenseList.add(newExpense);
    });
  }

  void _removeExpense(Expense expense) {
    final index = expenseList.indexOf(expense);
    setState(() {
      expenseList.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            expenseList.insert(index, expense);
            setState(() {});
          },
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: const Text('Expense deleted!'),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expense Tracker',
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.add),
                onPressed: _openAddExpense,
              );
            },
          ),
        ],
      ),
      body: width < 500
          ? Column(
              children: [
                SizedBox(
                  height: 250,
                  child: Chart(expenses: expenseList),
                ),
                Expanded(
                  child: ExpenseList(
                    removeExpense: _removeExpense,
                    expenses: expenseList,
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 250,
                    child: Chart(expenses: expenseList),
                  ),
                ),
                Expanded(
                  child: ExpenseList(
                    removeExpense: _removeExpense,
                    expenses: expenseList,
                  ),
                ),
              ],
            ),
    );
  }
}
