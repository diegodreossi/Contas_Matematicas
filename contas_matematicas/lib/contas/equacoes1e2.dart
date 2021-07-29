import 'package:flutter/material.dart';

Widget BotaoEquacao1() {
  return Row(
    children: [
      Expanded(
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: () {},
            child: Text('Equação do 1º')),
      )
    ],
  );
}


Widget BotaoEquacao2() {
  return Row(
    children: [
      Expanded(
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: () {},
            child: Text('Equação do 2º')),
      )
    ],
  );
}
