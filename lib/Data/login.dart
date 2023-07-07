import 'package:mysql1/mysql1.dart';
import 'package:testes_mysql1/Data/database.dart';

class Login {}

Future<bool> fazerLogin(String username, String password) async {
  //var conn = await conectar();
  print('conectando ao banco');

  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'jvsistema.com',
      port: 3306,
      user: 'jvsis287_desenv',
      db: 'jvsis287_desenv',
      password: '@desenv'));

  print('fazendo query');

  username = username.trim();
  password = password.trim();

  var resultado = await conn
      .query('SELECT senha FROM usuarios where username = ?', [username]);

  desconectarDB(conn);

  print('if 1');

  if (resultado.isNotEmpty) {
    print("não vazio");
    if (password == resultado.elementAt(0).values?[0].toString()) {
      print('true');
      return true;
    } else {
      print('false');
      return false;
    }
  } else {
    print("vazio");
    return false;
  }
}

int fazerLoginTeste(String username, String password) {
  if (username == 'usuario' && password == '123') {
    return 1;
  } else {
    return 0;
  }
}
