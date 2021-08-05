import 'dart:math';

import 'package:contas_matematicas/contas_basicas/raizcubica.dart';

import 'contas_basicas_calculo.dart';
import 'package:flutter/material.dart';

import '../barra.dart';
import 'contassimples.dart';
import 'raizquadrada.dart';

ContasSimples c = new ContasSimples();

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
  

  @override
  void initState() {
    super.initState();
    itemEscolhido = c.contas[0];
    
  }

  Widget estadoCalculo() {
    setState(() {
      
    });
    return calculoCorpo(itemEscolhido, c.contaSelecionada);
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
        appBar: Barra(
          titulo: 'Contas Básicas',
        ),
        body: Container(
          child: 
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
               
                children: <Widget>[
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton<String>(
                        hint: Text("Selecione conta"),
                        //value: itemEscolhido,
                        underline:
                            Container(height: 1, color: Colors.green[200]),
                        items: c.contas
                            .map((co) =>
                                DropdownMenuItem(value: co, child: Text(co)))
                            .toList(),
    
                        onChanged: (String? conta) {
                          setState(() {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            itemEscolhido = conta;
                            c.contaSelecionada = true;
                            c.definirUltimaOp(conta!);
                            c.calculado = false;
                            c.resultado = "";
                            
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  
                  calculoCorpo(itemEscolhido, c.contaSelecionada),
                  
                ],
              ),
            ),
          //],
        ),
      ),
    );
  }
}

Widget calculoCorpo(String? conta, bool selecionado) {
  //Porcentagem e raiz quadrada precisam ser feitos widgets separados

  if (!selecionado) {
    return Container();
  } else {
    if (conta == c.contas[0]) {
      return Calculo(conta);
    } else if (conta == c.contas[1]) {
      return Calculo(conta);
    } else if (conta == c.contas[2]) {
      return Calculo(conta);
    } else if (conta == c.contas[3]) {
      return Calculo(conta);
    } else if (conta == c.contas[4]) {
      return RaizQuadrada(conta);
    } else if (conta == c.contas[5]) {
      return RaizCubica(conta);
    } else if (conta == c.contas[6]) {
      return Calculo(conta);
    } else if (conta == c.contas[7]) {
      return Calculo(conta);
    } else {
      return Container();
    }
  }
}
