import 'package:flutter/material.dart';

import './models/transaction.dart';

import './widgets/transaction_list.dart';
import './widgets/new_transactions.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      theme: ThemeData(
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
          appBarTheme: AppBarTheme(
            toolbarTextStyle: ThemeData.light().textTheme.copyWith().bodyMedium,
            titleTextStyle: ThemeData.light()
                .textTheme
                .copyWith(
                    titleLarge: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ))
                .titleLarge,
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber)
              .copyWith(secondary: Colors.blue)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String titleInput;
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New watch',
    //   amount: 99.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'GTR maitenance',
    //   amount: 230.00,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((transX) {
      return transX.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  // New transaction
  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: chosenDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Expense App', style: TextStyle(fontFamily: 'OpenSans')),
      actions: <Widget>[
        IconButton(
          onPressed: () => _startAddNewTransaction(context),
          icon: Icon(Icons.add),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height - MediaQuery.of(context).padding.top) *
                  0.3,
              child: Chart(_recentTransactions),
            ),
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height - MediaQuery.of(context).padding.top) *
                  0.7,
              child: TransactionList(_userTransactions, _deleteTransaction),
            ),

            // Mapping Data into Widgets
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
