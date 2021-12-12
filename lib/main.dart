import 'package:flutter/material.dart';
import './transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction(
        id: 'tx1', title: 'New Shoes', amount: 1500, date: DateTime.now()),
    Transaction(
        id: 'tx2', title: 'Groceries', amount: 3500, date: DateTime.now()),
    Transaction(id: 'tx3', title: 'Fruits', amount: 300, date: DateTime.now()),
    Transaction(
        id: 'tx1', title: 'Vegetables', amount: 250, date: DateTime.now()),
  ];
  // String inputTitle = '';
  // String inputAmount = '';
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Application'),
      ),
      body: Column(
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
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    // onChanged: (val) => inputTitle = val,
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    // onChanged: (val) {
                    //   inputAmount = val;
                    // },
                    controller: amountController,
                  ),
                  FlatButton(
                    onPressed: () {
                      print(titleController.text);
                      print(amountController.text);
                    },
                    child: Text('Add Transaction'),
                    textColor: Colors.purple,
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        tx.amount.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          tx.date.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
