import 'package:testes_mysql1/Data/cliente_dao.dart';
import 'package:testes_mysql1/components/cliente.dart';

Future<List<Cliente>> ListadeClientesGlobal = ClienteDao().findAll();

void atualizarListadeClientesGlobal (){

}

int listscreenbuildtimes = 0;
String pesquisa = "";

List<Cliente> listaClientesAtivos = [];
List<Cliente> listaClientesInativos = [];