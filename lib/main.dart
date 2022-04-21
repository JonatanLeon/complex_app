import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/new_transactions.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';
import 'package:intl/intl.dart';

import 'modelos/transaccion.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _startInsertarTransaccion(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NuevaTransaccion(_insertarTransaccion),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startInsertarTransaccion(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text("CHART"),
                elevation: 5,
              ),
            ),
            ListaTransaccion(_transacciones),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startInsertarTransaccion(context),
      ),
    );
  }
}
