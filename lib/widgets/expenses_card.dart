import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';
import '../widgets/chart_bar.dart';

class ExpensesCard extends StatelessWidget {
  final List<Transaction> recentTransactions;

  ExpensesCard(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].price;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(8),
      child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map((item) {
              return Flexible(
                fit: FlexFit.loose,
                child: ChartBar(
                    item['day'],
                    item['amount'],
                    totalSpending == 0.0
                        ? 0.0
                        : (item['amount'] as double) / totalSpending),
              );
            }).toList(),
          )),
    );
  }
}
