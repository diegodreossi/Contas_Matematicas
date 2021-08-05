import 'package:flutter/material.dart';

class Barra extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;

  Barra({required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 10),
      color: Colors.greenAccent[400],
      child: SafeArea(
        child: Container(
          child: Text(
            titulo,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(120);
}
