import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:udemy_course_2_ch/model/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required Transaction userTransaction,
    @required Function deleteTransaction,
  }) : _userTransaction = userTransaction, _deleteTransaction = deleteTransaction, super(key: key);

  final Transaction _userTransaction;
  final Function _deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
                child: Text('\$${_userTransaction.amount}')),
          ),
        ),
        title: Text(_userTransaction.title,
            style: Theme.of(context).textTheme.headline6),
        subtitle: Text(
            DateFormat.yMMMd().format(_userTransaction.date)),
        trailing: MediaQuery.of(context).size.width > 360
            ? TextButton.icon(
                onPressed: () =>
                    _deleteTransaction(_userTransaction.id),
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).errorColor)),
              )
            : IconButton(
                onPressed: () => _deleteTransaction(
                      _userTransaction.id),
                color: Theme.of(context).errorColor,
                icon: const Icon(Icons.delete),
              ),
      ),
    );
  }
}
