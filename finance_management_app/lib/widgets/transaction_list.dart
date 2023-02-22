import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColorDark,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.titleLarge,
                      ),
                    
                    Text(
                      // DateFormat('dd-MM-yyyy').format(transactions.date),
                      DateFormat.yMMMMd().format(transactions[index].date),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,

      ),
    );
  }
}
