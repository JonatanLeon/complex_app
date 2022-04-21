import 'package:flutter/material.dart';

class NuevaTransaccion extends StatefulWidget {
  final Function insertarTr;

  NuevaTransaccion(this.insertarTr);

  @override
  State<NuevaTransaccion> createState() => _NuevaTransaccionState();
}

class _NuevaTransaccionState extends State<NuevaTransaccion> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void aceptarDatos() {
    final tituloIntroducido = titleController.text;
    final cantidadIntroducida = double.parse(amountController.text);

    if (tituloIntroducido.isEmpty || cantidadIntroducida <= 0) {
      return;
    }

    widget.insertarTr(
      tituloIntroducido,
      cantidadIntroducida,
    );

    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => aceptarDatos(),
              //onChanged: (val) => titleInput = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Cantidad"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => aceptarDatos(),
              //onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              child: Text("Añadir transacción"),
              textColor: Colors.purple,
              onPressed: aceptarDatos,
            )
          ],
        ),
      ),
    );
  }
}
