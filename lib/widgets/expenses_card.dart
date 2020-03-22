import 'package:flutter/material.dart';

class ExpensesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Card(
          elevation: 3,
          color: Theme.of(context).primaryColor,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Text('Expenses card'),
          )),
    );
  }
}
