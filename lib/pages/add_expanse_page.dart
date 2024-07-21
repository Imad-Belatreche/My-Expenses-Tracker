import 'dart:io';

import 'package:expanses_track/models/expanse.dart';
import 'package:expanses_track/widgets/error_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddExpenseForm extends StatefulWidget {
  const AddExpenseForm({
    super.key,
    required this.addExpense,
  });
  final void Function(Expense expense) addExpense;
  @override
  State<AddExpenseForm> createState() => _AddExpenseFormState();
}

class _AddExpenseFormState extends State<AddExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;
  ExpenseCategory _selectedCategory = ExpenseCategory.leisure;

  void _showDialog() {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return const CupertinoErrorDialog();
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const ErrorDialog();
        },
      );
    }
  }

  void _onSaveExpense() {
    final enteredAmount = int.tryParse(_amountController.text.trim());
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      _showDialog();
      return;
    }

    final newExpense = Expense(
      title: _titleController.text,
      amount: enteredAmount,
      date: _selectedDate!,
      category: _selectedCategory,
    );
    widget.addExpense(newExpense);
    Navigator.pop(context);
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1);

    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      initialDate: now,
      lastDate: DateTime.now(),
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
            child: Column(
              children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _titleController,
                          maxLength: 50,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            label: Text(
                              'Title',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          decoration: InputDecoration(
                            label: Text(
                              'Amount',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            suffixText: ' DZD',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  )
                else
                  TextField(
                    controller: _titleController,
                    maxLength: 50,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text(
                        'Title',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 5,
                ),
                if (width >= 600)
                  Row(
                    children: [
                      SizedBox(
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(10),
                          items: ExpenseCategory.values.map(
                            (category) {
                              return DropdownMenuItem(
                                value: category,
                                child: Text(
                                  category.name.toUpperCase(),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            _selectedCategory = value;
                            setState(() {});
                          },
                          value: _selectedCategory,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        _selectedDate == null
                            ? 'No date selected'
                            : formater.format(_selectedDate!),
                      ),
                      IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.date_range),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: TextField(
                          controller: _amountController,
                          decoration: InputDecoration(
                            label: Text(
                              'Amount',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            suffixText: ' DZD',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        _selectedDate == null
                            ? 'No date selected'
                            : formater.format(_selectedDate!),
                      ),
                      IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.date_range),
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 5,
                ),
                if (width >= 600)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _onSaveExpense,
                        child: const Text('Save Expense'),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      SizedBox(
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(10),
                          items: ExpenseCategory.values.map(
                            (category) {
                              return DropdownMenuItem(
                                value: category,
                                child: Text(
                                  category.name.toUpperCase(),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            _selectedCategory = value;
                            setState(() {});
                          },
                          value: _selectedCategory,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: _onSaveExpense,
                        child: const Text('Save Expense'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
