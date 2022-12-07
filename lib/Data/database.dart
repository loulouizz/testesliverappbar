import 'package:mysql1/mysql1.dart';

Future<MySqlConnection> conectar () async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
  ));

  return conn;
}

void desconectarDB (MySqlConnection conn) {
  conn.close();
}
