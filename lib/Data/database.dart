import 'package:mysql1/mysql1.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:needle_orm_mariadb/mariadb.dart';

Future<MySqlConnection> conectar () async {
  final conn = await MySqlConnection.connect(ConnectionSettings(

      /*host: 'jvsistema.com',
      port: 3306,
      user: 'jvsis287_desenv',
      db: 'jvsis287_desenv',
      password: '@desenv'*/

      /*host: '192.168.15.82',
      port: 3306,
      user: 'user',
      db: 'mytestedb',
      password: 'password'*/

      host: '192.168.15.82',
      port: 3306,
      user: 'master',
      db: 'db_sgv',
      password: 'sgv147258'


  ));

  print(conn.toString());

  return conn;
}

void desconectarDB (MySqlConnection conn) {
  conn.close();
}

void desconectarMariaDB (MySQLConnection conn) {
  conn.close();
}


Future<MySQLConnection> initMariaDb() async {
    final conn = await MySQLConnection.createConnection(
      host: 'localhost',
      port: 3306,
      userName: 'master',
      databaseName: 'db_sgv',
      password: 'sgv147258', // optional
    );

    await conn.connect();

    print("Connected");

    print('passou da conexão');

    return conn;
}

dynamic query (String query) async{
  var conn = await conectar();
  var resultado = await conn.query(query);
  desconectarDB(conn);

  return resultado;
}
