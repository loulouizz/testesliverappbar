import 'package:mysql1/mysql1.dart';

Future<MySqlConnection> conectar () async {
  try {
    final conn = await MySqlConnection.connect(ConnectionSettings(
        host: 'jvsistema.com',
        port: 3306,
        user: 'jvsis287_desenv',
        db: 'jvsis287_desenv',
        password: '@desenv'
    ));
    return conn;
  } catch (e){
    print('Erro ao conectar ao banco de dados: $e');
    rethrow;
  }
}

void desconectarDB (MySqlConnection conn) {
  conn.close();
}


dynamic query (String query) async{
  var conn = await conectar();
  var resultado = await conn.query(query);
  desconectarDB(conn);

  return resultado;
}
