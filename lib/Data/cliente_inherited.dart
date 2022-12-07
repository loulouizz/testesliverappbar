import 'package:flutter/material.dart';
import 'package:testes_mysql1/components/cliente.dart';

class ClienteInherited extends InheritedWidget {
  ClienteInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Cliente> clientelist = [
    Cliente('nome', 'fantasia', 'telefone')
  ];

  void newCliente(int id, String nome, String fantasia, String telefone){
    clientelist.add(Cliente(nome,fantasia,telefone));
  }

  static ClienteInherited of(BuildContext context) {
    final ClienteInherited? result =
        context.dependOnInheritedWidgetOfExactType<ClienteInherited>();
    assert(result != null, 'No ClienteInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ClienteInherited oldWidget) {
    return oldWidget.clientelist.length != clientelist.length;
  }
}
