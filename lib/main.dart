import 'package:expensemanager/widgets/new_transaction.dart';
import 'package:expensemanager/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

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
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                    bodyText1: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
          )),
    );
  }
}

class HomePage extends StatefulWidget {
  // String inputTitle = '';
  // String inputAmount = '';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> transactions = [
    // Transaction(
    //     id: 'tx1', title: 'New Shoes2', amount: 1500, date: DateTime.now()),
    // Transaction(
    //     id: 'tx2', title: 'Groceriessss', amount: 3500, date: DateTime.now()),
    // Transaction(id: 'tx3', title: 'Fruits', amount: 300, date: DateTime.now()),
    // Transaction(
    //     id: 'tx1', title: 'Vegetables', amount: 250, date: DateTime.now()),
  ];

  void addTx(String inputTitle, double inputAmount) {
    var tx = Transaction(
      id: DateTime.now().toString(),
      title: inputTitle,
      amount: inputAmount,
      date: DateTime.now(),
    );
    setState(() {
      print('transaction added');
      transactions.add(tx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(addTx),
          behavior: HitTestBehavior.opaque,
          onTap: () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Application'),
        actions: [
          IconButton(
            onPressed: () {
              startAddNewTransaction(context);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text('CHART'),
                elevation: 5,
                color: Colors.blue,
              ),
            ),
            TransactionList(transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
