import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:udemy_course_2_ch/model/transaction.dart';

class TransactionList extends StatelessWidget {
  // TransactionList({Key? key}) : super(key: key);
  final List<Transaction> _userTransaction;

  TransactionList(this._userTransaction);

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
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 13),
                          child: Text(
                            '\$${_userTransaction[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColor),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2)),
                          padding: EdgeInsets.all(10),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _userTransaction[index].title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat.jm()
                                  .format(_userTransaction[index].date),
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: _userTransaction.length,
              ));
  }
}
