import 'package:flutter/material.dart';

import './add_new_trx.dart';
import './transaction_list.dart';
import '../model/transaction.dart';

class userTransaction extends StatefulWidget {

  @override
  State<userTransaction> createState() => _userTransactionState();
}

class _userTransactionState extends State<userTransaction> {
  final List<Transcation> _userTransaction = [
    Transcation(
      id: 'trx1',
      title: 'Top Up Gopay',
      amount: 20000,
      date: DateTime.now(),
    ),
    Transcation(
      id: 'trx3',
      title: 'Top Up ShoppePay',
      amount: 15000,
      date: DateTime.now(),
    ),
    Transcation(
      id: 'trx1',
      title: 'Top Up Ovo',
      amount: 5000,
      date: DateTime.now(),
    ),
  ];

  void _actionAddNewTrx(String title, double amount) {
    final newTrx = Transcation(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() {
      _userTransaction.add(newTrx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddNewTrx(_actionAddNewTrx),
        TransactionList(_userTransaction),
      ],
    );
  }
}
