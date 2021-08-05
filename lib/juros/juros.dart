import 'dart:math';

import 'package:contas_matematicas/juros/widget_funcao.dart';
import 'package:flutter/material.dart';

import '../barra.dart';
import 'calculo_juros.dart';

class Juros extends StatefulWidget {
  @override
  _JurosState createState() => _JurosState();
}

class _JurosState extends State<Juros> {
  late String? itemEscolhido;
  late bool contaSelecionada;

  @override
  void initState() {
    super.initState();
    itemEscolhido = juroTipo[0];
    contaSelecionada = false;
  }

  Text mudanca(String j, bool sel) {
    if (!sel) {
      return Text('');
    } else {
      return Text(j);
    }
  }

  Widget imagensExplicativas(String? j, bool selecionado) {
    late String imagem, imagem2;
    if (j == juroTipo[0]) {
      imagem = 'assets/imagens/jurossimples.png';
      imagem2 = 'assets/imagens/jsexplicacao.png';
    } else if (j == juroTipo[1]) {
      imagem = 'assets/imagens/juroscomposto.png';
      imagem2 = 'assets/imagens/jcexplicacao.png';
    }
    return selecionado
        ? Container(
            child: Column(
              children: [
                Image.asset(
                  imagem,
                  height: 120,
                  width: 320,
                ),
                Image.asset(
                  imagem2,
                  height: 120,
                  width: 320,
                ),
              ],
            ),
          )
        : Container(
            child: Column(),
          );
  }

  Widget irConta(String? conta, bool selecionado) {
    if (!selecionado) {
      return Container();
    } else {
      return CalculoJuros(conta);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Ao colocar o Scaffold como filho do GestureDetector e aplicando essa
        //função eu possibilito ao programa esconder o teclado automaticamente
        //ao se clicar fora do TextField
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
          appBar: Barra(titulo: 'Juros'),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButton<String>(
                          hint: Text("Selecione conta"),
                          //value: itemEscolhido,
                          underline:
                              Container(height: 1, color: Colors.green[200]),
                          items: juroTipo
                              .map((c) =>
                                  DropdownMenuItem(value: c, child: Text(c)))
                              .toList(),

                          onChanged: (String? conta) {
                            setState(() {
                              itemEscolhido = conta;
                              contaSelecionada = true;
                              jur.calculado = false;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    imagensExplicativas(itemEscolhido, contaSelecionada),
                    irConta(itemEscolhido, contaSelecionada),
                    //CalculoJuros(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
