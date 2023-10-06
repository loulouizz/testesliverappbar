import 'package:testes_mysql1/Data/database.dart';
import 'package:testes_mysql1/components/conta.dart';
import 'package:testes_mysql1/global_var.dart';

class ContaDao{

  Future<List<Conta>> findAll(String isBx) async {

    var conn = await conectar();

    var resultado = await conn.query('SELECT p.numero, f.for_fantasia, p.vencto, p.data_pagto, p.valor, p.valor_pago, p.codforma, p.bx FROM pagar p LEFT JOIN forneced f ON p.codfor = f.for_codigo WHERE p.bx LIKE "%$isBx" LIMIT 500');

    desconectarDB(conn);


    List<Conta> resultadoFinal = [];


    String numero;
    String favorecido;
    DateTime dtVenc;
    DateTime? dtPag;
    double valor;
    double valorPago;
    String formaPagamento;
    String bx;

    for (int i = 0; i < resultado.length; i++) {
      if (resultado.elementAt(i).values?[0] != null) {
        numero = resultado.elementAt(i).values![0].toString();
        favorecido = resultado.elementAt(i).values![1].toString();
        dtVenc = DateTime.parse(resultado.elementAt(i).values![2].toString());
        dtPag = DateTime.tryParse(resultado.elementAt(i).values![3].toString());
        valor = double.parse(resultado.elementAt(i).values![4].toString());
        valorPago = double.parse(resultado.elementAt(i).values![5].toString());
        formaPagamento = resultado.elementAt(i).values![6].toString();
        bx = resultado.elementAt(i).values![7].toString();

        Conta conta1 = Conta(numero,favorecido,dtVenc,dtPag,valor,valorPago,formaPagamento,bx);
        resultadoFinal.add(conta1);
      }
    }

    print(resultadoFinal.length);

    return resultadoFinal;
  }

  Future<List<Conta>> findPesquisaDB (String nomepesquisa, String isBx) async {

    var conn = await conectar();

    var resultado = await conn.query('SELECT p.numero, f.for_fantasia, p.vencto, p.data_pagto, p.valor, p.valor_pago, p.codforma, p.bx FROM pagar p LEFT JOIN forneced f ON p.codfor = f.for_codigo WHERE p.bx LIKE "%$isBx" ORDER BY f.for_fantasia ASC');

    desconectarDB(conn);

    List<Conta> resultadoFinal = [];

    //COLOCAR AQUI OS ATRIBUTOS NECESSARIOS DAS CONTAS PARA SEREM MOSTRADOS NA TELA DE LISTA
    String numero;
    String favorecido;
    DateTime dtVenc;
    DateTime? dtPag;
    double valor;
    double valorPago;
    String formaPagamento;
    String bx;

    for (int i = 0; i < resultado.length; i++) {
      if (resultado.elementAt(i).values?[0] != null) {
        numero = resultado.elementAt(i).values![0].toString();
        favorecido = resultado.elementAt(i).values![1].toString();
        dtVenc = DateTime.parse(resultado.elementAt(i).values![2].toString());
        dtPag = DateTime.tryParse(resultado.elementAt(i).values![3].toString());
        valor = double.parse(resultado.elementAt(i).values![4].toString());
        valorPago = double.parse(resultado.elementAt(i).values![5].toString());
        formaPagamento = resultado.elementAt(i).values![6].toString();
        bx = resultado.elementAt(i).values![7].toString();

        Conta conta1 = Conta(numero,favorecido,dtVenc,dtPag,valor,valorPago,formaPagamento,bx);
        resultadoFinal.add(conta1);
      }
    }
    return resultadoFinal;
  }

  Future<List<Conta>> pesquisarNomeData (String nomepesquisa, String isBx, String dataInicio, String dataFinal) async {

    var conn = await conectar();



    var resultado = await conn.query('SELECT p.numero, f.for_fantasia, p.vencto, p.data_pagto, p.valor, p.valor_pago, p.codforma, p.bx FROM pagar p LEFT JOIN forneced f ON p.codfor = f.for_codigo WHERE p.bx = "$isBx" AND f.for_fantasia LIKE "%$nomepesquisa%" AND p.vencto BETWEEN "$dataInicio" AND "$dataFinal" ORDER BY p.vencto, f.for_fantasia;');

    desconectarDB(conn);

    List<Conta> resultadoFinal = [];

    //COLOCAR AQUI OS ATRIBUTOS NECESSARIOS DAS CONTAS PARA SEREM MOSTRADOS NA TELA DE LISTA
    String numero;
    String favorecido;
    DateTime dtVenc;
    DateTime? dtPag;
    double valor;
    double valorPago;
    String formaPagamento;
    String bx;

    for (int i = 0; i < resultado.length; i++) {
      if (resultado.elementAt(i).values?[0] != null) {
        numero = resultado.elementAt(i).values![0].toString();
        favorecido = resultado.elementAt(i).values![1].toString();
        dtVenc = DateTime.parse(resultado.elementAt(i).values![2].toString());
        dtPag = DateTime.tryParse(resultado.elementAt(i).values![3].toString());
        valor = double.parse(resultado.elementAt(i).values![4].toString());
        valorPago = double.parse(resultado.elementAt(i).values![5].toString());
        formaPagamento = resultado.elementAt(i).values![6].toString();
        bx = resultado.elementAt(i).values![7].toString();

        Conta conta1 = Conta(numero,favorecido,dtVenc,dtPag,valor,valorPago,formaPagamento,bx);
        resultadoFinal.add(conta1);
      }
    }
    return resultadoFinal;
  }

  Future<List<String>> findInfoConta (String id) async{
    var conn = await conectar();
    // numero, data, vencimento, data pagamento, valor, tipo, sub-tipo, descrição, parcela, fornecedor
    var resultado = await conn.query('SELECT p.numero, p.data, p.vencto, p.data_pagto, p.valor, p.codtipo, p.codsubtipo, f.for_fantasia, p.descricao, p.parcela, p.id_doc FROM pagar p LEFT JOIN forneced f ON p.codfor = f.for_codigo WHERE p.numero = ' + id);

    desconectarDB(conn);

    List<String> resultadoFinal = [];

    for (int i = 0; i < resultado.length; i++){
      if (resultado.elementAt(i).values?[0] != null) {
        resultadoFinal.add(resultado.elementAt(i).values![0].toString());
        resultadoFinal.add(resultado.elementAt(i).values![1].toString());
        resultadoFinal.add(resultado.elementAt(i).values![2].toString());
        resultadoFinal.add(resultado.elementAt(i).values![3].toString());
        resultadoFinal.add(resultado.elementAt(i).values![4].toString());
        resultadoFinal.add(resultado.elementAt(i).values![5].toString());
        resultadoFinal.add(resultado.elementAt(i).values![6].toString());
        resultadoFinal.add(resultado.elementAt(i).values![7].toString());
        resultadoFinal.add(resultado.elementAt(i).values![8].toString());
        resultadoFinal.add(resultado.elementAt(i).values![9].toString());
        resultadoFinal.add(resultado.elementAt(i).values![10].toString());
      }
    }

    print(resultadoFinal.toString());

    return resultadoFinal;
  }

  Future<String> update ({required String data, required String vencto, required String data_pgto, required String codtipo, required String codsubtipo, required String valor, required String descricao, required String parcela, required String id_doc, required String id}) async {
    var conn = await conectar();
    // numero, data, vencimento, data pagamento, valor, tipo, sub-tipo, descrição, parcela, fornecedor
    var resultado = await conn.query('UPDATE pagar SET data = "${data}", vencto = "${vencto}", data_pagto = "${data_pgto}", valor = "${valor}", codtipo = "${codtipo}", codsubtipo = "${codsubtipo}", descricao = "${descricao}", parcela = "${parcela}", id_doc = "${id_doc}" WHERE numero = "${id}";');

    print(resultado.toString());
    desconectarDB(conn);
    return "";
  }

  Future<String> baixar ({required String data_pgto, required String valor_pago, required String bx, required String id}) async {
    var conn = await conectar();
    // numero, data, vencimento, data pagamento, valor, tipo, sub-tipo, descrição, parcela, fornecedor
    var resultado = await conn.query('UPDATE pagar SET data_pagto = "${data_pgto}", valor_pago = ${valor_pago}, bx = "${bx}" WHERE numero = ${id};');

    print(resultado.toString());
    desconectarDB(conn);
    return "";
  }

  Future<String> delete ({required int id}) async {
    var conn = await conectar();

    var resultado = await conn.query('DELETE FROM pagar WHERE numero = $id');
    desconectarDB(conn);

    return "";
  }
}