import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/modelos/transaccion.dart';
import 'package:intl/intl.dart';

class ListaTransaccion extends StatelessWidget {
  final List<Transaccion> transacciones;
  final Function borrarTransaccion;

  ListaTransaccion(this.transacciones, this.borrarTransaccion);

  @override
  Widget build(BuildContext context) {
    return transacciones.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                Text(
                  "No hay transacciones todavía",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
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
                  trailing: MediaQuery.of(context).size.width > 460
                      ? FlatButton.icon(
                          textColor: Theme.of(context).errorColor,
                          icon: Icon(Icons.delete),
                          label: Text("Borrar"),
                          onPressed: () {
                            borrarTransaccion(transacciones[posicion].id);
                          },
                        )
                      : IconButton(
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
          );
  }
}
