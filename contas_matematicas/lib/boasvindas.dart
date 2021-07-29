import 'package:flutter/material.dart';

Widget mensagemDeBoasVindas() {
  return Container(
   //padding: EdgeInsets.all(200), 
   decoration: BoxDecoration(color:Colors.grey[200],border: Border.all(color: Colors.red,width: 2)),
   
   width: 300,
   height: 300,
   child: Column(
   mainAxisAlignment: MainAxisAlignment.center, 
   children: [
    Text('Bem vindo!!!',style: TextStyle(fontSize: 40),),
    SizedBox(height: 20,),
    Text('Este é um aplicativo de matemática.',style: TextStyle(fontSize: 16),),
    Text('Aqui se poderá fazer diversos calculos',style: TextStyle(fontSize: 16),),
    Text('automáticamente, inclusive de outras áreas',style: TextStyle(fontSize: 16),),
    Text('como física e geometria.',style: TextStyle(fontSize: 16),),
    Text('Espero que ajude em seus estudos.',style: TextStyle(fontSize: 16),),
   
   ],
   
   
   
   ),
  
  );
}
