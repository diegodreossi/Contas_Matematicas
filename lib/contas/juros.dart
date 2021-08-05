import 'dart:math';

import 'package:flutter/material.dart';

import '../barra.dart';

String calcularJuros(String op, double C, double i, double t) {
  if (op == _juroTipo[0]) {
    return (C * i * t).toString();
  } else if (op == _juroTipo[1]) {
    return (C * pow((1 + i), t)).toString();
  } else {
    return "Houve erro";
  }
}

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

List<String> _juroTipo = [
  'Juros Simples',
  'Juros Compostos',
];

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
    itemEscolhido = _juroTipo[0];
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
    if (j == _juroTipo[0]) {
      imagem = 'assets/imagens/jurossimples.png';
      imagem2 = 'assets/imagens/jsexplicacao.png';
    } else if (j == _juroTipo[1]) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        items: _juroTipo
                            .map((c) =>
                                DropdownMenuItem(value: c, child: Text(c)))
                            .toList(),

                        onChanged: (String? conta) {
                          setState(() {
                            itemEscolhido = conta;
                            contaSelecionada = true;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  imagensExplicativas(itemEscolhido, contaSelecionada),
                  CalculoJuros(),
                ],
              ),
            ),
          ],
        ));
  }
}

class CalculoJuros extends StatefulWidget {
  @override
  _CalculoJurosState createState() => _CalculoJurosState();
}

class _CalculoJurosState extends State<CalculoJuros> {
  TextEditingController capital = TextEditingController();
  TextEditingController taxa = TextEditingController();
  TextEditingController tempo = TextEditingController();
  TextEditingController unidadetempo = TextEditingController();
  String resultado = '';
  bool calculado = true;

  Widget botaoCalcular() {
    return SizedBox(
      width: 150,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          setState(() {});
        },
        child: Text('Calcular'),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green[600])),
      ),
    );
  }

  Widget botaoLimpar() {
    return SizedBox(
      width: 150,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          setState(() {});
        },
        child: Text('Limpar'),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green[600])),
      ),
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculado = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Coluna_testfield(linhas: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'C = ',
                  style: TextStyle(fontSize: 25, color: Colors.grey[800]),
                ),
                Container(
                  height: 40,
                  width: 150,
                  child: TextField(
                    controller: capital,
                    onChanged: (text) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'i = ',
                  style: TextStyle(fontSize: 25, color: Colors.grey[800]),
                ),
                Container(
                  height: 40,
                  width: 150,
                  child: TextField(
                    controller: taxa,
                    onChanged: (text) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  't = ',
                  style: TextStyle(fontSize: 25, color: Colors.grey[800]),
                ),
                Container(
                  height: 40,
                  width: 150,
                  child: TextField(
                    controller: tempo,
                    onChanged: (text) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      '*Unidade de tempo',
                      style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                    ),
                    Container(
                      height: 40,
                      width: 150,
                      child: TextField(
                        controller: unidadetempo,
                        onChanged: (text) {},
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ]),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              botaoCalcular(),
              botaoLimpar(),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          mostrarResultado(resultado, calculado),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class Coluna_testfield extends StatelessWidget {
  final List<Row> linhas;
  const Coluna_testfield({Key? key, required this.linhas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: linhas.fold(<Widget>[], (list, b) {
        list.isEmpty
            ? list.add(b)
            : list.addAll([
                SizedBox(
                  height: 10,
                ),
                b
              ]);
        return list;
      }),
    );
  }
}
