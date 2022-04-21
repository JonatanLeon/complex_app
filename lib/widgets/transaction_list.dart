import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/modelos/transaccion.dart';
import 'package:intl/intl.dart';

class ListaTransaccion extends StatelessWidget {
  final List<Transaccion> transacciones;

  ListaTransaccion(this.transacciones);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
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
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "\$${transacciones[posicion].cantidad.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        children: [
                          Text(
                            transacciones[posicion].titulo,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            DateFormat.yMMMd()
                                .format(transacciones[posicion].fecha),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      )
                    ],
                  ),
                );
              },
              itemCount: transacciones.length,
            ),
    );
  }
}
