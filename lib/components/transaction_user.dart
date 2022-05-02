import 'dart:math';

import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Tênis de corrida',
        value: 320.5,
        date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Livro Clean Code', value: 70.0, date: DateTime.now())
  ];

  _addTransaction(String title, double value) {
    final newTransaction = new Transaction(
        id: Random().nextDouble().toString(),
        value: value,
        title: title,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TransactionList(transactions: _transactions),
      TransactionForm(_addTransaction)
    ]);
  }
}
