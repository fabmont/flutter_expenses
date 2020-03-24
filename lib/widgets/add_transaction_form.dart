import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransactionForm extends StatefulWidget {
  final Function addNewTransaction;

  AddTransactionForm({@required this.addNewTransaction});

  @override
  _AddTransactionFormState createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  final _expenseInputController = TextEditingController();
  final _priceInputController = TextEditingController();
  DateTime _selectedDate;

  void _dispatchNewTransaction() {
    final _expenseName = _expenseInputController.text;
    final _priceValue = double.parse(_priceInputController.text);

    if (_expenseName.isEmpty || _priceValue <= 0 || _selectedDate == null) {
      return;
    }

    widget.addNewTransaction(
        _expenseName, _priceValue, _selectedDate, _selectedDate.toString());
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Theme.of(context).backgroundColor,
      ),
      padding: EdgeInsets.only(right: 20, top: 30, left: 20),
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 12),
              child: Text('Add new expense',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          TextField(
            controller: _expenseInputController,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
                labelText: 'Expense',
                filled: true,
                prefixIcon: Icon(
                  Icons.text_format,
                  color: Theme.of(context).primaryColor,
                )),
          ),
          Container(margin: EdgeInsets.only(top: 24)),
          TextField(
            controller: _priceInputController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _dispatchNewTransaction(),
            decoration: InputDecoration(
                labelText: 'Price',
                filled: true,
                prefixIcon: Icon(
                  Icons.attach_money,
                  color: Theme.of(context).primaryColor,
                )),
          ),
          Container(margin: EdgeInsets.only(top: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                  _selectedDate == null
                      ? 'Choose a date'
                      : DateFormat.yMMMd().format(_selectedDate),
                  style: TextStyle(color: Theme.of(context).disabledColor)),
              FlatButton(
                onPressed: _showDatePicker,
                child: Text('PICK A DATE',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
          Container(margin: EdgeInsets.only(top: 16)),
          RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: _dispatchNewTransaction,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                width: double.infinity,
                child: Center(
                  child: Text(
                    'ADD TRANSACTION',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
