
import 'package:contas_matematicas/contas/juros.dart';
import 'package:contas_matematicas/rotas.dart';
import 'package:flutter/material.dart';

import 'contas_basicas/contas_basicas.dart';
import 'paginainicial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contas Matemáticas',
      theme: ThemeData(
        
        primarySwatch: Colors.green,
      ),
      initialRoute: Rotas.Contas_Basicas,
      routes: {
      Rotas.Pagina_Inicial:(context)=>PaginaInicial(),
      Rotas.Contas_Basicas:(context)=>ContasBasicas(),
      Rotas.Juros:(context)=>Juros(),
      
      },
      
    );
  }
}

