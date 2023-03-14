import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';


class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
                child: Text('\$${transaction.amount}')),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.error,
                  ),
                ),
                onPressed: () => deleteTx(transaction.id),
              )

            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
                onPressed: () => deleteTx(transaction.id),
              ),
      ),
    );
  }
}