import 'package:testes_mysql1/Data/database.dart';
import 'package:testes_mysql1/components/conta.dart';
import 'package:testes_mysql1/global_var.dart';

class ContaDao{

  Future<List<Conta>> findAll(String isBx) async {

    var conn = await conectar();

    var resultado = await conn.query('SELECT f.for_fantasia, p.vencto, p.data_pagto, p.valor, p.valor_pago, p.codforma, p.bx FROM pagar p LEFT JOIN forneced f ON p.codfor = f.for_codigo WHERE p.bx LIKE "%$isBx" LIMIT 500');

    desconectarDB(conn);

    List<Conta> resultadoFinal = [];

    //COLOCAR AQUI OS ATRIBUTOS NECESSARIOS DAS CONTAS PARA SEREM MOSTRADOS NA TELA DE LISTA
    String favorecido;
    DateTime dtVenc;
    DateTime? dtPag;
    double valor;
    double valorPago;
    String formaPagamento;
    String bx;

    for (int i = 0; i < resultado.length; i++) {
      if (resultado.elementAt(i).values?[0] != null) {
        favorecido = resultado.elementAt(i).values![0].toString();
        dtVenc = DateTime.parse(resultado.elementAt(i).values![1].toString());
        dtPag = DateTime.tryParse(resultado.elementAt(i).values![2].toString());
        valor = double.parse(resultado.elementAt(i).values![3].toString());
        valorPago = double.parse(resultado.elementAt(i).values![4].toString());
        formaPagamento = resultado.elementAt(i).values![5].toString();
        bx = resultado.elementAt(i).values![6].toString();

        Conta conta1 = Conta(favorecido,dtVenc,dtPag,valor,valorPago,formaPagamento,bx);
        resultadoFinal.add(conta1);
      }
    }

    print(resultadoFinal.length);

    return resultadoFinal;
  }


  Future<List<Conta>> findPesquisaDB (String nomepesquisa, String isBx) async {

    var conn = await conectar();

    var resultado = await conn.query('SELECT f.for_fantasia, p.vencto, p.data_pagto, p.valor, p.valor_pago, p.codforma, p.bx FROM pagar p LEFT JOIN forneced f ON p.codfor = f.for_codigo WHERE p.bx LIKE "%$isBx" ORDER BY f.for_fantasia ASC');

    desconectarDB(conn);

    List<Conta> resultadoFinal = [];

    //COLOCAR AQUI OS ATRIBUTOS NECESSARIOS DAS CONTAS PARA SEREM MOSTRADOS NA TELA DE LISTA
    String favorecido;
    DateTime dtVenc;
    DateTime? dtPag;
    double valor;
    double valorPago;
    String formaPagamento;
    String bx;

    for (int i = 0; i < resultado.length; i++) {
      if (resultado.elementAt(i).values?[0] != null) {
        favorecido = resultado.elementAt(i).values![0].toString();
        dtVenc = DateTime.parse(resultado.elementAt(i).values![1].toString());
        dtPag = DateTime.tryParse(resultado.elementAt(i).values![2].toString());
        valor = double.parse(resultado.elementAt(i).values![3].toString());
        valorPago = double.parse(resultado.elementAt(i).values![4].toString());
        formaPagamento = resultado.elementAt(i).values![5].toString();
        bx = resultado.elementAt(i).values![6].toString();

        Conta conta1 = Conta(favorecido,dtVenc,dtPag,valor,valorPago,formaPagamento,bx);
        resultadoFinal.add(conta1);
      }
    }
    return resultadoFinal;
  }

  Future<List<Conta>> pesquisarNomeData (String nomepesquisa, String isBx, String dataInicio, String dataFinal) async {

    var conn = await conectar();



    var resultado = await conn.query('SELECT f.for_fantasia, p.vencto, p.data_pagto, p.valor, p.valor_pago, p.codforma, p.bx FROM pagar p LEFT JOIN forneced f ON p.codfor = f.for_codigo WHERE p.bx = "$isBx" AND f.for_fantasia LIKE "%$nomepesquisa%" AND p.vencto BETWEEN "$dataInicio" AND "$dataFinal" ORDER BY p.vencto, f.for_fantasia;');

    desconectarDB(conn);

    List<Conta> resultadoFinal = [];

    //COLOCAR AQUI OS ATRIBUTOS NECESSARIOS DAS CONTAS PARA SEREM MOSTRADOS NA TELA DE LISTA
    String favorecido;
    DateTime dtVenc;
    DateTime? dtPag;
    double valor;
    double valorPago;
    String formaPagamento;
    String bx;

    for (int i = 0; i < resultado.length; i++) {
      if (resultado.elementAt(i).values?[0] != null) {
        favorecido = resultado.elementAt(i).values![0].toString();
        dtVenc = DateTime.parse(resultado.elementAt(i).values![1].toString());
        dtPag = DateTime.tryParse(resultado.elementAt(i).values![2].toString());
        valor = double.parse(resultado.elementAt(i).values![3].toString());
        valorPago = double.parse(resultado.elementAt(i).values![4].toString());
        formaPagamento = resultado.elementAt(i).values![5].toString();
        bx = resultado.elementAt(i).values![6].toString();

        Conta conta1 = Conta(favorecido,dtVenc,dtPag,valor,valorPago,formaPagamento,bx);
        resultadoFinal.add(conta1);
      }
    }
    return resultadoFinal;
  }
}