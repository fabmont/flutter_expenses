import 'package:flutter/material.dart';

class AddTransactionForm extends StatefulWidget {
  final Function addNewTransaction;

  AddTransactionForm({@required this.addNewTransaction});

  @override
  _AddTransactionFormState createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  final expenseInputController = TextEditingController();

  final priceInputController = TextEditingController();

  void dispatchNewTransaction() {
    final expenseName = expenseInputController.text;
    final priceValue = double.parse(priceInputController.text);

    if (expenseName.isEmpty || priceValue <= 0) {
      return;
    }

    widget.addNewTransaction(expenseName, priceValue, DateTime.now(), 321524);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 12),
              child: Text('Add new expense',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          TextField(
            controller: expenseInputController,
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
            controller: priceInputController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => this.dispatchNewTransaction(),
            decoration: InputDecoration(
                labelText: 'Price',
                filled: true,
                prefixIcon: Icon(
                  Icons.attach_money,
                  color: Theme.of(context).primaryColor,
                )),
          ),
          Container(margin: EdgeInsets.only(top: 18)),
          FlatButton(
              onPressed: () => this.dispatchNewTransaction(),
              child: Container(
                width: double.infinity,
                child: Center(
                  child: Text(
                    'ADD TRANSACTION',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
