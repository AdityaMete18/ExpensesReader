import 'package:expenses_reader/model/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expenses_reader/model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});
  final List<Expense> expenses;

  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: ((context, index) => Dismissible(
            key: ValueKey((expenses[index])),
            background: Container(
              color: const Color.fromARGB(255, 238, 41, 27),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
            child: ExpenseItem(expenses[index]), //for removing the list
          )),
    );
  }
}
