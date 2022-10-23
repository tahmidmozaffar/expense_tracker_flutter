import 'package:flutter/material.dart';

class TransactionListItem extends StatelessWidget {
  final double amount;
  final String currency;
  final String expenseCategory;
  final String categoryIcon;
  final String note;
  final String account;
  final String accountIcon;

  const TransactionListItem(
      {Key? key,
      required this.amount,
      required this.currency,
      required this.expenseCategory,
      required this.categoryIcon,
      required this.note,
      required this.account,
      required this.accountIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.account_balance),
        Column(
          children: const [
            Text("\$ 72.22"),
            Text("Car"),
            Text("Car insurance")
          ],
        ),
        Row(
          children: const [Icon(Icons.add), Text("Cash")],
        )
      ],
    );
  }
}
