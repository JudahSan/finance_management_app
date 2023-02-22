import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTansX;

  NewTransaction(this.addTansX);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  // Data submission
  void dataSub() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    // Dummy validation
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTansX(
      enteredTitle,
      enteredAmount,

      // I number is invalid, app will break
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              // onChanged: (value) {
              //   titleInput = value;
              // } ,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              controller: titleController,
              onSubmitted: (_) => dataSub(),
            ),
            SizedBox(
              height: 25.0,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              controller: amountController,
              // onChanged: (value) => amountInput = value,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => dataSub(),
            ),
            TextButton(
              onPressed: dataSub,
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.yellow,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
