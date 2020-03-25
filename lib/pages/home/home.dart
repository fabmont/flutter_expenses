import 'package:flutter/material.dart';
import 'dart:io';

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

  List<Transaction> get _recentTransactions {
    return userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void addNewTransaction(
      String txtTitle, double txtPrice, DateTime date, String id) {
    final payload =
        Transaction(id: id, title: txtTitle, price: txtPrice, date: date);

    setState(() {
      userTransactions.add(payload);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _openBottomSheetModal(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
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
    final appBar = AppBar(
      centerTitle: true,
      title: Text(
        'Personal Expenses',
        style: TextStyle(fontWeight: FontWeight.w300),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.25,
                child: ExpensesCard(_recentTransactions)),
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.75,
                child: TransactionList(
                  transactions: userTransactions,
                  deleteTransaction: _deleteTransaction,
                )),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: Platform.isIOS ? 24 : 0),
        child: FloatingActionButton.extended(
          onPressed: () => _openBottomSheetModal(context),
          icon: Icon(Icons.add),
          label: Text('New Transaction'),
          elevation: 2,
        ),
      ),
    );
  }
}
