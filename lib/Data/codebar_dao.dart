import 'dart:async';
import 'package:needle_orm_mariadb/mariadb.dart';
import 'package:testes_mysql1/Data/database.dart';
import 'package:testes_mysql1/components/cliente.dart';
import 'package:testes_mysql1/global_var.dart';

class CodebarDAO{

  Future<List<String>> find({required int id}) async {
    print('entrou na função find');

    var conn = await conectar();
    print('conectou');

    var resultado = await conn.query('SELECT prod_nome, prod_und, prod_tabela, prod_estoque FROM produtos WHERE prod_codigo = $id');
    print('query');

    desconectarDB(conn);
    print('desconectou');

    List<String> resultadoFinal = [];

    for (int i = 0; i < resultado.length; i++){
      if (resultado.elementAt(i).values?[0] != null) {
        resultadoFinal.add(resultado.elementAt(i).values![0].toString());
        resultadoFinal.add(resultado.elementAt(i).values![1].toString());
        resultadoFinal.add(resultado.elementAt(i).values![2].toString());
        resultadoFinal.add(resultado.elementAt(i).values![3].toString());
      }
    }

    print(resultadoFinal.toString());

    return resultadoFinal;
  }
}