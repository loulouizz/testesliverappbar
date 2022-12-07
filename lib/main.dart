import 'package:flutter/material.dart';
import 'package:testes_mysql1/Data/cliente_inherited.dart';
import 'package:testes_mysql1/screens/list_screen.dart';
import 'package:testes_mysql1/screens/login_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: ClienteInherited(child: const ListScreen(),)
      home: LoginScreen(),
    );
  }
}