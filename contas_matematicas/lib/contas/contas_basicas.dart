import 'dart:math';

import 'package:flutter/material.dart';

import '../barra.dart';

class ContasSimples {
  List<String> _contas = [
    'Adição',
    'Subtração',
    'Multiplicação',
    'Divisão',
    'Raiz Quadrada',
    'Elevação',
    'Porcentagem',
  ];

  List<String> get Contas {
    return _contas;
  }

  String calcularOp(String op, double p1, double p2) {
    if (!Contas.contains(op)) {
      return '';
    }

    switch (op) {
      case 'Porcentagem':
        return ((p1 / 100) * p2).toString();

      case 'Divisão':
        if (p2 == 0) {
          return 'Divisão por 0 impossivel';
        } else {
          return (p1 / p2).toString();
        }

      case 'Multiplicação':
        return (p1 * p2).toString();

      case 'Subtração':
        return (p1 - p2).toString();

      case 'Adição':
        return (p1 + p2).toString();

      case 'Elevação':
        return pow(p1, p2).toString();

      case 'Raiz Quadrada':
        return sqrt(p1).toString();

      default:
        return 'Houve erro';
    }
  }

  String simbolo(String op) {
    if (!Contas.contains(op)) {
      return '';
    }

    switch (op) {
      case 'Porcentagem':
        return '% de';

      case 'Divisão':
        return '/';

      case 'Multiplicação':
        return 'x';

      case 'Subtração':
        return '-';

      case 'Adição':
        return '+';

      case 'Elevação':
        return '^';

      case 'Raiz Quadrada':
        return 'rq';

      default:
        return '';
    }
  }
}

List<String> _contas = [
  'Adição',
  'Subtração',
  'Multiplicação',
  'Divisão',
  'Raiz Quadrada',
  'Elevação',
  'Porcentagem',
];

Widget BotaoContasBasicas() {
  return Row(
    children: [
      Expanded(
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: () {},
            child: Text('Contas Básicas')),
      )
    ],
  );
}

class ContasBasicas extends StatefulWidget {
  @override
  _ContasBasicasState createState() => _ContasBasicasState();
}

class _ContasBasicasState extends State<ContasBasicas> {
  late String? itemEscolhido;
  late bool contaSelecionada;

  @override
  void initState() {
    
    super.initState();
    itemEscolhido = _contas[0];
    contaSelecionada = false;
  }

  Widget estadoCalculo() {
    setState(() {
      //itemEscolhido = itemEscolhido;
      //calculoCorpo(itemEscolhido, contaSelecionada);
    });
    return calculoCorpo(itemEscolhido, contaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Barra(
        titulo: 'Contas Básicas',
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      hint: Text("Selecione conta"),
                      //value: itemEscolhido,
                      underline: Container(height: 1, color: Colors.green[200]),
                      items: _contas
                          .map(
                              (c) => DropdownMenuItem(value: c, child: Text(c)))
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
                //Text(itemEscolhido!),
                //estadoCalculo(),
                calculoCorpo(itemEscolhido, contaSelecionada),
                //Calculo(conta: itemEscolhido),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget calculoCorpo(String? conta, bool selecionado) {
  //Porcentagem e raiz quadrada precisam ser feitos widgets separados

  if (!selecionado) {
    
    return Container();
  } else {
    if (conta == _contas[0]) {
      return Calculo(conta);
    } else if (conta == _contas[1]) {
      return Calculo(conta);
    } else if (conta == _contas[2]) {
      return Calculo(conta);
    } else if (conta == _contas[3]) {
      return Calculo(conta);
    } else if (conta == _contas[4]) {
      return Calculo(conta);
    } else if (conta == _contas[5]) {
      return Calculo( conta);
    } else if (conta == _contas[6]) {
      return Calculo(conta);
    } else {
      return Container();
    }
  }
}

Widget mostrarResultado(String resultado, bool calculado) {
  
    return Column(children: [
      calculado ? Text(
        'Resultado =',
        style: TextStyle(fontSize: 25, color: Colors.red),
      ): Text(
        '',
        style: TextStyle(fontSize: 25, color: Colors.red),
      ) ,
      calculado ? Text(
        resultado,
        style: TextStyle(fontSize: 25),
      ): Text(
        '',
        style: TextStyle(fontSize: 25, color: Colors.red),
      ) ,
    ]);
  
}



class Calculo extends StatefulWidget {
  final String? conta;
  Calculo(this.conta);

  @override
  _CalculoState createState() => _CalculoState(conta: conta);
}

class _CalculoState extends State<Calculo> {
  final String? conta;
  String resultado = '';
  bool calculado = false;
  _CalculoState({required this.conta});

  @override
  void initState() {
    super.initState();
    resultado = '';
    calculado = false;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController parcela1 = TextEditingController();
    TextEditingController parcela2 = TextEditingController();
    

    return Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  conta!,
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 150,
                  child: TextField(
                    controller: parcela1,
                    onChanged: (text) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                    child: Text(
                  '   ${ContasSimples().simbolo(conta!)}   ',
                  style: TextStyle(fontSize: 25),
                )),
                Container(
                  height: 40,
                  width: 150,
                  child: TextField(
                    controller: parcela2,
                    onChanged: (text) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          calculado = true;
                          double par1 = double.tryParse(parcela1.text) ?? 0;
                          double par2 = double.tryParse(parcela2.text) ?? 0;
                          //if (parcela1.text != '' && parcela2.text != '') {
                          resultado =
                              ContasSimples().calcularOp(conta!, par1, par2);
                          //}
                        });
                      },
                      child: Text('Calcular'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green[600])),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          parcela1.text = '';
                          parcela2.text = '';
                          calculado = false;
                        });
                      },
                      child: Text('Limpar'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green[600])),
                    ),
                  ),
                ],
              ),
            ]),
            SizedBox(
              height: 30,
            ),
            mostrarResultado(resultado, calculado),
          ],
        ));
  }
}

/*
Widget Calculo(String? conta){
  TextEditingController parcela1 = TextEditingController();
  TextEditingController parcela2 = TextEditingController();
  String resultado = '';
  bool calculado = false;
  return Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  conta!,
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 150,
                  child: TextField(
                    controller: parcela1,
                    onChanged: (text) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                    child: Text(
                  '   ${ContasSimples().simbolo(conta)}   ',
                  style: TextStyle(fontSize: 25),
                )),
                Container(
                  height: 40,
                  width: 150,
                  child: TextField(
                    controller: parcela2,
                    onChanged: (text) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        
                          calculado = true;
                          double par1 = double.tryParse(parcela1.text) ?? 0;
                          double par2 = double.tryParse(parcela2.text) ?? 0;
                          //if (parcela1.text != '' && parcela2.text != '') {
                          resultado =
                              ContasSimples().calcularOp(conta, par1, par2);
                          //}
                       
                      },
                      child: Text('Calcular'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green[600])),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                       
                          parcela1.text = '';
                          parcela2.text = '';
                          calculado = false;
                       
                      },
                      child: Text('Limpar'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green[600])),
                    ),
                  ),
                ],
              ),
            ]),
            SizedBox(
              height: 30,
            ),
            //----
            mostrarResultado(resultado, calculado),
            //Container(color: Colors.amber,height: 20,)
          ],
        ));
}
*/

/*class Calculo extends StatelessWidget {
   final String? conta;
  String resultado = '';
  bool calculado = false;
  Calculo( this.conta); 
 
  @override
  Widget build(BuildContext context) {
    TextEditingController parcela1 = TextEditingController();
    TextEditingController parcela2 = TextEditingController();
    return Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  conta!,
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 150,
                  child: TextField(
                    controller: parcela1,
                    onChanged: (text) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                    child: Text(
                  '   ${ContasSimples().simbolo(conta!)}   ',
                  style: TextStyle(fontSize: 25),
                )),
                Container(
                  height: 40,
                  width: 150,
                  child: TextField(
                    controller: parcela2,
                    onChanged: (text) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        
                          calculado = true;
                          double par1 = double.tryParse(parcela1.text) ?? 0;
                          double par2 = double.tryParse(parcela2.text) ?? 0;
                          //if (parcela1.text != '' && parcela2.text != '') {
                          resultado =
                              ContasSimples().calcularOp(conta!, par1, par2);
                          //}
                        
                      },
                      child: Text('Calcular'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green[600])),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        
                          parcela1.text = '';
                          parcela2.text = '';
                          calculado = false;
                        
                      },
                      child: Text('Limpar'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green[600])),
                    ),
                  ),
                ],
              ),
            ]),
            SizedBox(
              height: 30,
            ),
            mostrarResultado(resultado, calculado),
          ],
        ));
  }
}*/
