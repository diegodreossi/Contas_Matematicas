import 'package:flutter/material.dart';

Widget BotaoTriangulos() {
  return Row(
    children: [
      Expanded(
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: () {},
            child: Text('Triângulos')),
      )
    ],
  );
}
