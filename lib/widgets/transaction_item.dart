import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:udemy_course_2_ch/model/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.userTransaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction userTransaction;
  final Function deleteTransaction;

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
                child: Text('\$${userTransaction.amount}')),
          ),
        ),
        title: Text(userTransaction.title,
            style: Theme.of(context).textTheme.headline6),
        subtitle: Text(
            DateFormat.yMMMd().format(userTransaction.date)),
        trailing: MediaQuery.of(context).size.width > 360
            ? TextButton.icon(
                onPressed: () =>
                    deleteTransaction(userTransaction.id),
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).errorColor)),
              )
            : IconButton(
                onPressed: () => deleteTransaction(
                      userTransaction.id),
                color: Theme.of(context).errorColor,
                icon: const Icon(Icons.delete),
              ),
      ),
    );
  }
}
