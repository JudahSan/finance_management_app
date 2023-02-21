import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTansX;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTansX);
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
            ),
            SizedBox(height: 25.0,),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              controller: amountController,
              // onChanged: (value) => amountInput = value,
            ),
            TextButton(
              onPressed: () {
                addTansX(
                  titleController.text,
                  double.parse(amountController.text),
                  // I number is invalid, app will break
                );
              },
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.pink,
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
