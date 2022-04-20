import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';

import '../modelos/transaccion.dart';
import 'new_transactions.dart';

class TransaccionUsuario extends StatefulWidget {
  @override
  State<TransaccionUsuario> createState() => _TransaccionUsuarioState();
}

class _TransaccionUsuarioState extends State<TransaccionUsuario> {
  final List<Transaccion> _transacciones = [
    Transaccion(
      id: "t1",
      titulo: "Zapatos nuevos",
      cantidad: 69.99,
      fecha: DateTime.now(),
    ),
    Transaccion(
      id: "t2",
      titulo: "Compra semanal",
      cantidad: 16.53,
      fecha: DateTime.now(),
    ),
  ];

  void _insertarTransaccion(String titulo, double cantidad) {
    final nuevaTr = Transaccion(
      titulo: titulo,
      cantidad: cantidad,
      fecha: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _transacciones.add(nuevaTr);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NuevaTransaccion(_insertarTransaccion),
        ListaTransaccion(_transacciones),
      ],
    );
  }
}
