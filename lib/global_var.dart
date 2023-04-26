import 'package:testes_mysql1/Data/cliente_dao.dart';
import 'package:testes_mysql1/components/cliente.dart';
import 'package:testes_mysql1/components/conta.dart';

Future<List<Cliente>> ListadeClientesGlobal = ClienteDao().findAll();

void atualizarListadeClientesGlobal (){

}

int listscreenbuildtimes = 0;
String pesquisa = "";

List<Cliente> listaClientesAtivos = [];
List<Cliente> listaClientesInativos = [];

bool ativo = true;

late List<Cliente> allClients      = [];
late List<Cliente> activeClients   = [];
late List<Cliente> inactiveClients = [];

late List<Conta> allContas         = [];
late List<Conta> contasPagas       = [];
late List<Conta> contasAPagar      = [];
late List<Conta> contasPesquisa    = [];

int cont = 0;