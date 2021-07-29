import 'package:flutter/material.dart';

import '../barra.dart';
import 'contas_basicas.dart';

Widget BotaoFatorial() {
  return Row(
    children: [
      Expanded(
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: () {},
            child: Text('Fatorial')),
      )
    ],
  );
}

class Fatorial extends StatefulWidget {
  @override
  _FatorialState createState() => _FatorialState();
}

class _FatorialState extends State<Fatorial> {
  String resultado = '';
  bool calculado = false;

  int fatorial(int num) {
    if (num == 1) {
      return 1;
    }

    return num * fatorial(num - 1);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController parcela1 = TextEditingController();
    return Scaffold(
      appBar: Barra(titulo: 'Fatorial'),
      body: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Fatorial(Inteiros)',
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
                    ' !',
                    style: TextStyle(fontSize: 25),
                  )),
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
                            int par1 = int.tryParse(parcela1.text) ?? 0;

                            //if (parcela1.text != '' && parcela2.text != '') {
                            resultado = fatorial(par1).toString();

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
              //----
              mostrarResultado(resultado, calculado),
              //Igual as contas básicas
              //Container(color: Colors.amber,height: 20,)
            ],
          )),
    );
  }
}
  
