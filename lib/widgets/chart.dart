import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_complete_guide/modelos/transaccion.dart';

class Chart extends StatelessWidget {
  final List<Transaccion> transaccionesRecientes;

  Chart(this.transaccionesRecientes);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (posicion) {
      final diaSemana = DateTime.now().subtract(
        Duration(days: posicion),
      );
      double sumaTotal = 0.0;

      for (var i = 0; i < transaccionesRecientes.length; i++) {
        if (transaccionesRecientes[i].fecha.day == diaSemana.day &&
            transaccionesRecientes[i].fecha.month == diaSemana.month &&
            transaccionesRecientes[i].fecha.year == diaSemana.year) {
          sumaTotal += transaccionesRecientes[i].cantidad;
        }
      }

      print(DateFormat.E().format(diaSemana));
      print(sumaTotal);

      return {
        "dia": DateFormat.E().format(diaSemana),
        "cantidad": sumaTotal,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}
