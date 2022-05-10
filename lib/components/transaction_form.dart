import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.00;

    if (title.isEmpty || value <= 0) {
      return;
    }

    this.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
                onSubmitted: (_) => _submitForm(),
                controller: titleController,
                decoration: InputDecoration(labelText: 'Título')),
            TextField(
                onSubmitted: (_) => _submitForm(),
                keyboardType: TextInputType.numberWithOptions(
                    decimal:
                        true), //numberWithOptions para ser utilizado iOS e Android
                controller: valueController,
                decoration: InputDecoration(labelText: 'Valor (R\$)')),
            TextButton(
                style: TextButton.styleFrom(primary: Colors.purple),
                onPressed: _submitForm,
                child: Text('Nova Transação', style: TextStyle(fontSize: 16)))
          ],
        ),
      ),
    );
  }
}
