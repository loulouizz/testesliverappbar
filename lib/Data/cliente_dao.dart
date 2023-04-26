import 'dart:async';

import 'package:testes_mysql1/Data/database.dart';
import 'package:testes_mysql1/components/cliente.dart';
import 'package:testes_mysql1/global_var.dart';

class ClienteDao {

  final StreamController<Cliente> _controller = StreamController<Cliente>();

  Stream<Cliente> get stream => _controller.stream;

  Future<String> findCampoEspecifico({required String parametro, required String argumento, required String campoParaPesquisar}) async {
    print('Acessando find...');

    var conn = await conectar();

    var resultado = await conn
        .query('SELECT $campoParaPesquisar FROM clientes where $parametro = ?', [argumento]);

    desconectarDB(conn);

    String resultadoFinal = resultado.elementAt(0).values![0].toString();

    return resultadoFinal;
  }

  Future<List<Cliente>> findAll() async {
    print('Acessando findAll...');

    var conn = await conectar();

    var resultado = await conn
        .query('SELECT razao_social, nome_fantasia, telefone, id, status FROM clientes ORDER BY nome_fantasia ASC');

    desconectarDB(conn);

    List<Cliente> resultadoFinal = [];

    String nome;
    String telefone;
    String fantasia;
    String id;
    String status;

    for (int i = 0; i < resultado.length; i++) {
      print('entrando no loop com tamanho de ${resultado.length}');
      print('O dado encontrado no banco de dados é: $resultado');
      print('O elemento na posição 0 é: ${resultado.elementAt(0)}');
      print(
          'O elemento no campo fields 0  é: ${resultado.elementAt(0).fields[0]}');
      print(
          'O elemento no campo values 0  é: ${resultado.elementAt(0).values?[0]}');
      print('**print para testes');

      if (resultado.elementAt(i).values?[0] != null) {
        print("Entrou no IF!");

        print("Adicionando nome");
        nome = resultado.elementAt(i).values![0].toString();

        print("Adicionando fantasia");
        fantasia = resultado.elementAt(i).values![1].toString();

        print("Adicionando telefone");
        telefone = resultado.elementAt(i).values![2].toString();

        print("Adicionando ID");
        id = resultado.elementAt(i).values![3].toString();

        print("Adicionando status");
        status = resultado.elementAt(i).values![4].toString();

        Cliente cliente1 = Cliente(nome, fantasia, telefone, id, status);
        print("Quase adicionando, hein!");
        resultadoFinal.add(cliente1);
        print("Adicionou!");
        print('Cliente adicionado à lista!');
      } else {
        print('O resultado era nulo ;-;');
      }

      print("batata");
    }

    allClients = resultadoFinal;
    return resultadoFinal;
  }

  //Busca no DB
  Future<List<Cliente>> findPesquisaDB(String nomepesquisa, int ativo) async {
    print('Acessando findPesquisaDB...');

    var conn = await conectar();

    //var resultado = await conn.query('SELECT razao_social, nome_fantasia, telefone FROM clientes where razao_social LIKE "?%"', [nomepesquisa]);
    var resultado = await conn.query('SELECT razao_social, nome_fantasia, telefone, id, status FROM clientes where razao_social LIKE "' + nomepesquisa + '%" AND status = ? ORDER BY nome_fantasia ASC', [ativo]);

    desconectarDB(conn);

    List<Cliente> resultadoFinal = [];

    String nome;
    String telefone;
    String fantasia;
    String id;
    String status;

    for (int i = 0; i < resultado.length; i++) {
      if (resultado.elementAt(i).values?[0] != null) {
        nome = resultado.elementAt(i).values![0].toString();
        fantasia = resultado.elementAt(i).values![1].toString();
        telefone = resultado.elementAt(i).values![2].toString();
        id = resultado.elementAt(i).values![3].toString();
        status = resultado.elementAt(i).values![4].toString();

        Cliente cliente1 = Cliente(nome, fantasia, telefone, id, status);
        resultadoFinal.add(cliente1);
      }
    }

    return resultadoFinal;
  }

  Future<List<String>> findTodasInformacoesCliente (String nome_fantasia, String razao_social) async{
    var conn = await conectar();
    var resultado = await conn.query('SELECT nome_fantasia, razao_social, insc_estadual, cidade, cep, numero, bairro, telefone, email, sistema, id, status FROM clientes WHERE razao_social = '+ razao_social +' and nome_fantasia = '+ nome_fantasia);
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
        resultadoFinal.add(resultado.elementAt(i).values![11].toString());
      }
    }

    print(resultadoFinal.toString());

    return resultadoFinal;
  }

  Future<List<String>> findInfoCliente (String id) async{
    var conn = await conectar();
    var resultado = await conn.query('SELECT insc_estadual, cidade, cep, numero, bairro, telefone, email, sistema FROM clientes WHERE id = '+ id);
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
      }
    }

    print(resultadoFinal.toString());

    return resultadoFinal;
  }
}
