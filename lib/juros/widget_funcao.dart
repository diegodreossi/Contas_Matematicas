import 'dart:math';

import 'package:flutter/material.dart';
import 'juros.dart';

List<String> juroTipo = [
  'Juros Simples',
  'Juros Compostos',
];

class JurosCal {
  bool calculado = false;

  String calcularJuros(String op, double C, double i, double t) {
    if (op == juroTipo[0]) {
      return (C * i * t).toString();
    } else if (op == juroTipo[1]) {
      return (C * pow((1 + i), t)).toString();
    } else {
      return "Houve erro";
    }
  }
}

JurosCal jur = new JurosCal();

Widget BotaoJuros() {
  return Row(
    children: [
      Expanded(
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: () {},
            child: Text('Juros Simples')),
      )
    ],
  );
}

Widget mostrarResultado(String resultado, bool calculado) {
  return Column(children: [
    calculado
        ? Text(
            'Resultado =',
            style: TextStyle(fontSize: 25, color: Colors.red),
          )
        : Text(
            '',
            style: TextStyle(fontSize: 25, color: Colors.red),
          ),
    calculado
        ? Text(
            resultado,
            style: TextStyle(fontSize: 25),
          )
        : Text(
            '',
            style: TextStyle(fontSize: 25, color: Colors.red),
          ),
  ]);
}
