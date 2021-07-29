import 'package:flutter/material.dart';

Widget BotaoEquacaoDaReta() {
  return Row(
    children: [
      Expanded(
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: () {},
            child: Text('Equação da reta')),
      )
    ],
  );
}