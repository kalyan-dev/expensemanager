import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: widget.transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'content/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child:
                              Text('Rs ${widget.transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      widget.transactions[index].title,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: Text(DateFormat.yMMMd()
                        .format(widget.transactions[index].date)),
                  ),
                );
              },
              itemCount: widget.transactions.length,
            ),
    );
  }
}
