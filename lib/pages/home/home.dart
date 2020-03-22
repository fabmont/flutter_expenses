import 'package:flutter/material.dart';

import '../../models/transactions.dart';
import '../../widgets/add_transaction_form.dart';
import '../../widgets/expenses_card.dart';
import '../../widgets/transaction_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> userTransactions = [];

  void addNewTransaction(
      String txtTitle, double txtPrice, DateTime date, int id) {
    final payload =
        Transaction(id: id, title: txtTitle, price: txtPrice, date: date);

    setState(() {
      userTransactions.add(payload);
    });
  }

  void _openBottomSheetModal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: AddTransactionForm(
              addNewTransaction: addNewTransaction,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Personal Expenses',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ExpensesCard(),
          TransactionList(
            transactions: userTransactions,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openBottomSheetModal(context),
        icon: Icon(Icons.add),
        label: Text('New Transaction'),
        elevation: 2,
      ),
    );
  }
}
