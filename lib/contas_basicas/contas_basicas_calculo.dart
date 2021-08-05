import 'package:flutter/material.dart';
import 'contas_basicas.dart';
import 'contassimples.dart';

Widget mostrarResultado(String resultado, bool calculado) {
  

  resultado =
      resultado.endsWith('.0') ? resultado.split('.')[0] : resultado; //:re;
  //Se for um numero inteiro .0 então só aparece a parte antes do ., ou seja, não
  // há o .000 nos numeros inteiros

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
    c.UltimaOperacao == "Divisão" && calculado
        ? Text(
            "Resto = ${c.restoDiv}",
            style: TextStyle(fontSize: 25),
          )
        : Text(
            '',
            style: TextStyle(fontSize: 25, color: Colors.red),
          ), /**/
  ]);
}

class Calculo extends StatefulWidget {
  final String? conta;
  Calculo(this.conta);

  @override
  _CalculoState createState() => _CalculoState();
}

class _CalculoState extends State<Calculo> {
  

  @override
  void initState() {
    super.initState();
    
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
                  widget.conta!,
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
                    keyboardType: TextInputType.number,
                    onChanged: (text) {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                    child: Text(
                  '   ${ContasSimples().simbolo(widget.conta!)}   ',
                  style: TextStyle(fontSize: 25),
                )),
                Container(
                  height: 40,
                  width: 150,
                  child: TextField(
                    controller: parcela2,
                    keyboardType: TextInputType.number,
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
                          c.calculado = true;
                          double par1 = double.tryParse(parcela1.text) ?? 0;
                          double par2 = double.tryParse(parcela2.text) ?? 0;
                          
                          c.resultado = ContasSimples()
                              .calcularOp(widget.conta!, par1, par2);

                          if (widget.conta! == "Divisão") {
                            
                            c.restoDivisao(par1, par2);
                          }
                          
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
                          c.calculado = false;
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
            
            mostrarResultado(c.resultado, c.calculado),
            
          ],
        ));
  }
}
