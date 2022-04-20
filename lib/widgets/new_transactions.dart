import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/user_transactions.dart';

class NuevaTransaccion extends StatelessWidget {
  final Function insertarTr;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NuevaTransaccion(this.insertarTr);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Título"),
              controller: titleController,
              //onChanged: (val) => titleInput = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Cantidad"),
              controller: amountController,
              //onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              child: Text("Añadir transacción"),
              textColor: Colors.purple,
              onPressed: () {
                insertarTr(
                    titleController.text, double.parse(amountController.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
