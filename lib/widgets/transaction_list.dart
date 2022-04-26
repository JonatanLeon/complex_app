import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/modelos/transaccion.dart';
import 'package:intl/intl.dart';

class ListaTransaccion extends StatelessWidget {
  final List<Transaccion> transacciones;
  final Function borrarTransaccion;

  ListaTransaccion(this.transacciones, this.borrarTransaccion);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transacciones.isEmpty
          ? Column(
              children: [
                Text(
                  "No hay transacciones todavía",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, posicion) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text("\$${transacciones[posicion].cantidad}"),
                        ),
                      ),
                    ),
                    title: Text(
                      transacciones[posicion].titulo,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transacciones[posicion].fecha),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () {
                        borrarTransaccion(transacciones[posicion].id);
                      },
                    ),
                  ),
                );
              },
              itemCount: transacciones.length,
            ),
    );
  }
}
