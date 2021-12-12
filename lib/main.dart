import 'package:expensemanager/widgets/new_transaction.dart';
import 'package:expensemanager/widgets/transaction_list.dart';
import 'package:expensemanager/widgets/user_transactions.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Second App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // String inputTitle = '';
  // String inputAmount = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Application'),
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                color: Colors.grey,
                child: Card(
                  child: Text('CHART'),
                  elevation: 5,
                  color: Colors.blue,
                ),
              ),
              UserTransactions(),
            ],
          ),
        ));
  }
}
