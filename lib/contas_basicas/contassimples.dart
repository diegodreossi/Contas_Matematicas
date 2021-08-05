import 'package:flutter/material.dart';
import 'dart:math';
import 'contas_basicas.dart';

List<String> contas = [
  'Adição',
  'Subtração',
  'Multiplicação',
  'Divisão',
  'Raiz Quadrada',
  'Raiz Cubica',
  'Elevação',
  'Porcentagem',
];

class ContasSimples {
  List<String> contas = [
    'Adição',
    'Subtração',
    'Multiplicação',
    'Divisão',
    'Raiz Quadrada',
    'Raiz Cubica',
    'Elevação',
    'Porcentagem',
  ];

  bool contaSelecionada = false;
  bool calculado = false;
  String resultado = 'Diego';
  String restoDiv = 'erro';
  

  

  String _ultimooperacao = '';

  String get UltimaOperacao {
    return _ultimooperacao;
  }

  String get ResultadoConta {
    return resultado;
  }

  void definirUltimaOp(String op) {
    _ultimooperacao = op;
  }

  bool igualOp(String x) {
    return _ultimooperacao == x;
  }

  List<String> get Contas {
    return contas;
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
          
          return (p1 / p2).toStringAsFixed(4);
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

      case 'Raiz Cubica':
        return pow(p1, (1 / 3)).toString();

      default:
        return 'Houve erro';
    }
  }

  void restoDivisao(num p1, num p2) {
    restoDiv = (p1 % p2).floorToDouble().toString();
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

      case 'Raiz Cubica':
        return 'r3';

      default:
        return '';
    }
  }
}
