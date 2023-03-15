import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'adaptive_text_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addTansX;

  NewTransaction(this.addTansX) {
    print('Constructor NewTransaction Widget');
  }

  @override
  _NewTransactionState createState() {
    print('createState NewTransaction Widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectDate;

  _NewTransactionState() {
    print('Constructor NewTransation State');
  }

  // initState
  // fetching initial data

  @override
  void initState() {
    print('initState()');
    super.initState();
  }

  // didUpdate
  // fetching data from a state
  @override
  void didUpdateWidget(NewTransaction oldWidget) {
    print('didUPdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  // dispose
  // clean listeners or live connection
  @override
  void dispose() {
    print('dispose()');
    super.dispose();
  }

  // Data submission
  void _dataSubmission() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    // Dummy validation
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectDate == null) {
      return;
    }

    widget.addTansX(
      enteredTitle,
      enteredAmount,
      _selectDate,

      // I number is invalid, app will break
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectDate = pickedDate;
      });
    });
    print('....');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
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
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                ),
                controller: _titleController,
                onSubmitted: (_) => _dataSubmission(),
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
                controller: _amountController,
                // onChanged: (value) => amountInput = value,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _dataSubmission(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectDate == null
                            ? 'No Date Selected!'
                            : 'Selected Date: ${DateFormat.yMd().format(_selectDate)}',
                      ),
                    ),
                    AdaptiveTextButton('Select Date', _presentDatePicker),
                  ],
                ),
              ),
              TextButton(
                onPressed: _dataSubmission,
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
