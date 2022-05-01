import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Tênis de corrida',
        value: 320.5,
        date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Livro Clean Code', value: 70.0, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orçamento Pessoal')),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            Column(
                children: _transactions
                    .map((tr) => Card(
                            child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.purple, width: 2),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'R\$ ${tr.value.toString()}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.purple[400]),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tr.title,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  tr.date.toString(),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        )))
                    .toList())
          ]),
    );
  }
}
