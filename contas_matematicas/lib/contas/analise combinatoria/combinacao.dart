import 'package:flutter/material.dart';

Widget BotaoCombinacao() {
  return Row(
    children: [
      Expanded(
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: () {},
            child: Text('Combinação')),
      )
    ],
  );
}
