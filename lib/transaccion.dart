import 'package:flutter/foundation.dart';

class Transaccion {
  final String id;
  final String titulo;
  final double cantidad;
  final DateTime fecha;

  Transaccion({
    @required this.id,
    @required this.titulo,
    @required this.cantidad,
    @required this.fecha,
  });
}
