import 'package:flutter/material.dart';

Widget BotaoJurosSimples() {
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



Widget BotaoJurosCompostos() {
  return Row(
    children: [
      Expanded(
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: () {},
            child: Text('Juros Compostos')),
      )
    ],
  );
}

