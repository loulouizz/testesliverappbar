import 'package:mysql1/mysql1.dart';
import 'package:testes_mysql1/Data/database.dart';
import 'package:testes_mysql1/components/cliente.dart';
import 'package:testes_mysql1/global_var.dart';

class ClienteDao {
  Future<List<Cliente>> find(int id) async {
    print('Acessando find...');

    var conn = await conectar();

    var resultado = await conn
        .query('SELECT razao_social FROM clientes where id = ?', [id]);

    desconectarDB(conn);

    List<Cliente> resultadoFinal = [];

    String nome;
    String fantasia;
    String telefone;

    Cliente cliente1 = Cliente("", "", "");

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
        nome = resultado.elementAt(i).values![0].toString();
        print("Vou adicionar o nome no cliente!!");
        //Cliente cliente1 = Cliente(nome, fantasia, telefone);
        print("Quase adicionando, hein!");
        resultadoFinal.add(cliente1);
        print("Adicionou!");
        print('Cliente adicionado à lista!');
      } else {
        print('O resultado era nulo ;-;');
      }

      print("batata");
    }

    return resultadoFinal;
  }

  Future<List<Cliente>> findAll() async {
    print('Acessando findAll...');

    var conn = await conectar();

    var resultado = await conn
        .query('SELECT razao_social, nome_fantasia, telefone FROM clientes');

    desconectarDB(conn);

    List<Cliente> resultadoFinal = [];

    String nome;
    String telefone;
    String fantasia;

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

        Cliente cliente1 = Cliente(nome, fantasia, telefone);
        print("Quase adicionando, hein!");
        resultadoFinal.add(cliente1);
        print("Adicionou!");
        print('Cliente adicionado à lista!');
      } else {
        print('O resultado era nulo ;-;');
      }

      print("batata");
    }

    return resultadoFinal;
  }

  //Busca local
  /*List<Cliente> findPesquisaLocal async(String pesquisa) {
    Map<dynamic,Cliente>? resultado;

    int tamanho = ListadeClientesGlobal.asStream().length as int;
    for(int i = 0; tamanho > i; i++){
      if (pesquisa == ListadeClientesGlobal.asStream().elementAt(i)){
        resultado?.addEntries(ListadeClientesGlobal);
      }
    }
  }*/

  //Busca no DB
  Future<List<Cliente>> findPesquisaDB(String nomepesquisa, int ativo) async {
    print('Acessando findPesquisaDB...');

    var conn = await conectar();

    //var resultado = await conn.query('SELECT razao_social, nome_fantasia, telefone FROM clientes where razao_social LIKE "?%"', [nomepesquisa]);
    var resultado = await conn.query('SELECT razao_social, nome_fantasia, telefone FROM clientes where razao_social LIKE "' + nomepesquisa + '%" AND status = ? ORDER BY nome_fantasia ASC', [ativo]);

    desconectarDB(conn);

    List<Cliente> resultadoFinal = [];

    String nome;
    String telefone;
    String fantasia;

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

        Cliente cliente1 = Cliente(nome, fantasia, telefone);
        print("Quase adicionando, hein!");
        resultadoFinal.add(cliente1);
        print("Adicionou!");
        print('Cliente adicionado à lista!');
      } else {
        print('O resultado era nulo ;-;');
      }

      print("batata");
    }

    /*if(ativo == 1) {
      listaClientesAtivos = resultadoFinal;
    } else if(ativo == 0){
      listaClientesInativos = resultadoFinal;
    }*/

    return resultadoFinal;
  }
}
