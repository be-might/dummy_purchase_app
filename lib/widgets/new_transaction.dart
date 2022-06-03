import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  // const NewTransaction({Key? key}) : super(key: key);
  final Function _addTransaction;

  NewTransaction(this._addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleConroller = TextEditingController();

  final amountConroller = TextEditingController();

  void submitData() {
    final enteredTitle = titleConroller.text;
    final enteredAmount = double.tryParse(amountConroller.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget._addTransaction(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
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
              controller: titleConroller,
              onSubmitted: (_) => submitData(),
              // onChanged: (value) => titleInput = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountConroller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (value) => amountInput = value,
            ),
            TextButton(
              onPressed: submitData,
              child: Text(
                'Add transaction',
                style: TextStyle(color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
