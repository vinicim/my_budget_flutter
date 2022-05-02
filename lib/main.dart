import 'package:flutter/material.dart';
import 'package:my_budget_flutter/components/transaction_form.dart';
import 'package:my_budget_flutter/components/transaction_list.dart';
import 'package:my_budget_flutter/components/transaction_user.dart';
import 'package:my_budget_flutter/model/transaction.dart';

void main(List<String> args) {
  runApp(BudgetApp());
}

class BudgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orçamento Pessoal')),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Gráfico'),
              ),
            ),
            TransactionUser()
          ]),
    );
  }
}
