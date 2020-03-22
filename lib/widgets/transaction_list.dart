import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 470,
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/notes.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Nothing to show yet!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Theme.of(context).primaryColorDark),
                            child: Text(
                              DateFormat('HH:mm')
                                  .format(transactions[index].date),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .body1
                                      .color),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  transactions[index].title,
                                  style: TextStyle(
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .title
                                          .fontSize,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(
                                    '\$ ${transactions[index].price.toString()}',
                                    style: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .body1
                                            .fontSize,
                                        color: Theme.of(context).disabledColor),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
