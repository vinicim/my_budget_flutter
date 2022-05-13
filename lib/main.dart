import 'package:flutter/material.dart';
import 'package:my_budget_flutter/components/transaction_form.dart';
import 'package:my_budget_flutter/components/transaction_list.dart';
import 'package:my_budget_flutter/model/transaction.dart';
import 'dart:math';

void main(List<String> args) {
  runApp(BudgetApp());
}

class BudgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      home: HomePage(),
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        textTheme: theme.textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Tênis de corrida',
        value: 320.5,
        date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Livro Clean Code', value: 70.0, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Livro Clean Code', value: 70.0, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Livro Clean Code', value: 70.0, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Livro Clean Code', value: 70.0, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Livro Clean Code', value: 70.0, date: DateTime.now())
  ];

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (_) => TransactionForm(_addTransaction));
  }

  _addTransaction(String title, double value) {
    final newTransaction = new Transaction(
        id: Random().nextDouble().toString(),
        value: value,
        title: title,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Orçamento Pessoal'),
          actions: <Widget>[
            IconButton(
                onPressed: () => _openTransactionFormModal(context),
                icon: Icon(Icons.add))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Card(
                    color: Theme.of(context).colorScheme.secondary,
                    elevation: 5,
                    child: Text('Gráfico'),
                  ),
                ),
                TransactionList(transactions: _transactions),
              ]),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add,
                color: Theme.of(context).textTheme.headline6?.color),
            onPressed: () => _openTransactionFormModal(context)));
  }
}
