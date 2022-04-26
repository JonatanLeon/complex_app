import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NuevaTransaccion extends StatefulWidget {
  final Function insertarTr;

  NuevaTransaccion(this.insertarTr);

  @override
  State<NuevaTransaccion> createState() => _NuevaTransaccionState();
}

class _NuevaTransaccionState extends State<NuevaTransaccion> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime fechaSeleccionada;

  void aceptarDatos() {
    if (amountController.text.isEmpty) {
      return;
    }
    final tituloIntroducido = titleController.text;
    final cantidadIntroducida = double.parse(amountController.text);

    if (tituloIntroducido.isEmpty || cantidadIntroducida <= 0 || fechaSeleccionada == null) {
      return;
    }

    widget.insertarTr(
      tituloIntroducido,
      cantidadIntroducida,
      fechaSeleccionada,
    );

    Navigator.of(context).pop();
  }

  void elegirFechas() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((fecha) {
      if (fecha == null) {
        return;
      }
      setState(() {
        fechaSeleccionada = fecha;
      });
    });
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
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      fechaSeleccionada == null
                          ? "No se ha elegido fecha"
                          : "Fecha seleccionada: ${DateFormat.yMd().format(fechaSeleccionada)}",
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: elegirFechas,
                    child: Text(
                      "Elige fecha",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text("Añadir transacción"),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: aceptarDatos,
            )
          ],
        ),
      ),
    );
  }
}
