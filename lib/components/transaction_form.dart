import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Título')),
            TextField(
                controller: valueController,
                decoration: InputDecoration(labelText: 'Valor (R\$)')),
            TextButton(
                style: TextButton.styleFrom(primary: Colors.purple),
                onPressed: () {
                  final title = titleController.text;
                  final value = double.tryParse(valueController.text) ?? 0.00;
                  this.onSubmit(title, value);
                  print('[teste] $title');
                  print('[teste] $value');
                },
                child: Text('Nova Transação', style: TextStyle(fontSize: 16)))
          ],
        ),
      ),
    );
  }
}
