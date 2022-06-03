import 'package:flutter/material.dart';
import 'package:udemy_course_2_ch/model/transaction.dart';
import 'package:udemy_course_2_ch/widgets/new_transaction.dart';
import 'package:udemy_course_2_ch/widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expensess',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        // accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 44,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //     id: 't2',
    //     title: 'Weekly Groceries',
    //     amount: 60.5,
    //     date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
          // GestureDetector(
          //   child: NewTransaction(_addNewTransaction),
          //   onTap: () {},
          //   behavior: HitTestBehavior.opaque,
          // );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expensess',
        ),
        actions: [
          IconButton(
              onPressed: () {
                startAddNewTransaction(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          startAddNewTransaction(context);
        },
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART!'),
              elevation: 5,
            ),
          ),
          TransactionList(_userTransaction)
        ],
      ),
    );
  }
}
