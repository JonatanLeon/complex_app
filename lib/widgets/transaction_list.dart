import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/modelos/transaccion.dart';
import 'package:flutter_complete_guide/widgets/user_transactions.dart';
import 'package:intl/intl.dart';

class ListaTransaccion extends StatelessWidget {
  final List<Transaccion> transacciones;

  ListaTransaccion(this.transacciones);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, posicion) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    "\$${transacciones[posicion].cantidad}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  children: [
                    Text(
                      transacciones[posicion].titulo,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(transacciones[posicion].fecha),
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
