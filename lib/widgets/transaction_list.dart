import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:udemy_course_2_ch/model/transaction.dart';

class TransactionList extends StatelessWidget {
  // TransactionList({Key? key}) : super(key: key);
  final List<Transaction> _userTransaction;
  final Function _deleteTransaction;

  TransactionList(this._userTransaction, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: _userTransaction.isEmpty
            ? Column(
                children: [
                  Text(
                    'No transactions yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                              child:
                                  Text('\$${_userTransaction[index].amount}')),
                        ),
                      ),
                      title: Text('${_userTransaction[index].title}',
                          style: Theme.of(context).textTheme.headline6),
                      subtitle: Text(DateFormat.yMMMd()
                          .format(_userTransaction[index].date)),
                      trailing: IconButton(
                        onPressed: () {
                          return _deleteTransaction(_userTransaction[index].id);
                        },
                        color: Theme.of(context).errorColor,
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
                itemCount: _userTransaction.length,
              ));
  }
}
