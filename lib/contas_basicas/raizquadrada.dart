
import 'package:flutter/material.dart';

import 'contas_basicas.dart';
import 'contas_basicas_calculo.dart';
import 'contassimples.dart';

class RaizQuadrada extends StatefulWidget {
  final String? conta;
  RaizQuadrada(this.conta);
  @override
  _RaizQuadradaState createState() => _RaizQuadradaState();
}

class _RaizQuadradaState extends State<RaizQuadrada> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //TextEditingController parcela2 = TextEditingController();
    TextEditingController parcela1 = TextEditingController();
    return Container(
      color: Colors.grey[200],
      //child: Text(widget.conta!),
      
        
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
                    child: Text(
                  '   ${ContasSimples().simbolo(widget.conta!)}   ',
                  style: TextStyle(fontSize: 25),
                )),
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
                          
                          //if (parcela1.text != '' && parcela2.text != '') {
                          c.resultado = ContasSimples()
                              .calcularOp(widget.conta!, par1, 0);
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
