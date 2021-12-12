import 'package:expensemanager/widgets/transaction_list.dart';

import '../widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactions = [
    Transaction(
        id: 'tx1', title: 'New Shoes', amount: 1500, date: DateTime.now()),
    Transaction(
        id: 'tx2', title: 'Groceries', amount: 3500, date: DateTime.now()),
    Transaction(id: 'tx3', title: 'Fruits', amount: 300, date: DateTime.now()),
    Transaction(
        id: 'tx1', title: 'Vegetables', amount: 250, date: DateTime.now()),
  ];

  void addTx(String inputTitle, double inputAmount) {
    var tx = Transaction(
        id: DateTime.now().toString(),
        title: inputTitle,
        amount: inputAmount,
        date: DateTime.now());
    setState(() {
      transactions.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTx),
        TransactionList(transactions),
      ],
    );
  }
}
