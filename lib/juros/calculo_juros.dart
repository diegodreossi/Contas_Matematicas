import 'package:contas_matematicas/juros/widget_funcao.dart';
import 'package:flutter/material.dart';

class CalculoJuros extends StatefulWidget {
  final String? conta;
  CalculoJuros(this.conta);
  @override
  _CalculoJurosState createState() => _CalculoJurosState();
}

class _CalculoJurosState extends State<CalculoJuros> {
  TextEditingController capital = TextEditingController();
  TextEditingController taxa = TextEditingController();
  TextEditingController tempo = TextEditingController();
  TextEditingController unidadetempo = TextEditingController();
  String resultado = '';
  //bool calculado = false;
  //VoidCallback
  //late Function()? l

  Widget botaoCalcular() {
    return SizedBox(
      width: 150,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            jur.calculado = true;
            double ca = double.tryParse(capital.text) ?? 0;
            double ta = double.tryParse(taxa.text) ?? 0;
            double te = double.tryParse(tempo.text) ?? 0;
            //double untp = double.tryParse(unidadetempo.text) ?? 0;
            resultado = jur.calcularJuros(widget.conta!, ca, ta, te);
          });
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
          setState(() {
            capital.text = "";
            taxa.text = "";
            tempo.text = "";
            unidadetempo.text = "";
            jur.calculado = false;
          });
        },
        child: Text('Limpar'),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green[600])),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    jur.calculado = false;
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
          mostrarResultado(resultado, jur.calculado),
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
