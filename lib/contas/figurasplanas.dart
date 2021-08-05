import 'package:flutter/material.dart';

Widget BotaoFigurasPlanas() {
  return Row(
    children: [
      Expanded(
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: () {},
            child: Text('Figuras Planas')),
      )
    ],
  );
}
