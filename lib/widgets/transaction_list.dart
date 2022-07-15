import 'package:flutter/material.dart';
import 'package:udemy_course_2_ch/model/transaction.dart';
import 'package:udemy_course_2_ch/widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  // TransactionList({Key? key}) : super(key: key);
  final List<Transaction> _userTransaction;
  final Function _deleteTransaction;

  // ignore: use_key_in_widget_constructors
  const TransactionList(this._userTransaction, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return _userTransaction.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) => Column(
              children: [
                Text(
                  'No transactions yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: constraints.minHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(
                  userTransaction: _userTransaction[index],
                  deleteTransaction: _deleteTransaction);
            },
            itemCount: _userTransaction.length,
          );
  }
}
