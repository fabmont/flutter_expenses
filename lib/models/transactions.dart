import 'package:flutter/foundation.dart';

class Transaction {
  final int id;
  final String title;
  final double price;
  final DateTime date;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.date,
  });
}
