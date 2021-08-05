import 'package:contas_matematicas/barra.dart';
import 'package:contas_matematicas/contas/analise%20combinatoria/arranjo.dart';
import 'package:contas_matematicas/contas/baskara.dart';
import 'package:contas_matematicas/contas/analise%20combinatoria/combinacao.dart';

import 'package:contas_matematicas/contas/equacaoreta.dart';
import 'package:contas_matematicas/contas/equacoes1e2.dart';
import 'package:contas_matematicas/contas/fatorial.dart';
import 'package:contas_matematicas/contas/figurasplanas.dart';
import 'package:contas_matematicas/contas/figurassolidas.dart';
import 'package:contas_matematicas/contas/juros.dart';
import 'package:contas_matematicas/contas/analise%20combinatoria/permutacao.dart';
import 'package:contas_matematicas/contas/triangulos.dart';
import 'package:flutter/material.dart';

import 'boasvindas.dart';
import 'contas_basicas/contas_basicas.dart';

class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Barra(
          titulo:
              'Contas Matemáticas'),
      body: ListView(
        children: [
          Container(padding: EdgeInsets.all(20), child: mensagemDeBoasVindas()),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Row(children: [Expanded(child: ElevatedButton(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.green) ) ,onPressed: (){},child: Text('Contas Básicas')),)],)
                BotaoContasBasicas(),
                BotaoFatorial(),
                BotaoEquacao1(),
                BotaoEquacao2(),
                BotaoEquacaoDaReta(),
                BotaoBaskara(),
                BotaoArranjo(),
                BotaoCombinacao(),
                BotaoPermutacao(),
                BotaoTriangulos(),
                BotaoJuros(),
                BotaoFigurasPlanas(),
                BotaoFigurasSolidas(),
              ], //LISTA DOS QUADRANTES DAS CONTAS
            ),
          ),
        ],
      ),
    );
  }
}
