import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/chart_bar.dart';
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

      return {
        "dia": DateFormat.E().format(diaSemana).substring(0, 1),
        "cantidad": sumaTotal,
      };
    }).reversed.toList();
  }

  double get gastosTotales {
    return groupedTransactionValues.fold(0.0, (suma, item) {
      return suma + item["cantidad"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((datos) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                datos["dia"],
                datos["cantidad"],
                gastosTotales == 0.0
                    ? 0.0
                    : (datos["cantidad"] as double) / gastosTotales,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
