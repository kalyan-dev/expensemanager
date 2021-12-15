import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;

  void submitData() {
    final title = titleController.text;
    var amount = 0.0;
    if (amountController.text.isNotEmpty) {
      amount = double.parse(amountController.text);
    }

    if (title.isEmpty || amount <= 0 || selectedDate == null) {
      return;
    }
    widget.addTx(title, amount, selectedDate);
    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedDate = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
              autofocus: true,
              onSubmitted: (_) {
                submitData();
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) {
              //   inputAmount = val;
              // },
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) {
                submitData();
              },
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(selectedDate == null
                        ? 'No Date Chosen'
                        : '${DateFormat.yMd().format(selectedDate as DateTime)}'),
                  ),
                  FlatButton(
                    onPressed: presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ignore: deprecated_member_use
            FlatButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
