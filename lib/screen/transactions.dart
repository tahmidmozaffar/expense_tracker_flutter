import 'package:flutter/material.dart';

import '../view/transaction_list_item.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
    TransactionListItem(
        amount: 10.0,
        currency: "\$",
        expenseCategory: "Bills",
        categoryIcon: "cat_bils",
        note: "Note",
        account: "Cash",
        accountIcon: "Money"),
      ],
    );
  }
}
