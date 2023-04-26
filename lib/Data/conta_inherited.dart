import 'package:flutter/material.dart';
import 'package:testes_mysql1/Data/conta_dao.dart';
import 'package:testes_mysql1/components/conta.dart';

class ContaInherited extends InheritedWidget {
  ContaInherited({
    super.key,
    required super.child,
  });

  final Future<List> contasAPagar = ContaDao().findAll("N");
  final Future<List> contasPagas = ContaDao().findAll("S");
  final Future<List> allContas = ContaDao().findAll("S");
  final Future<int> tamanho = ContaDao().findAll("").asStream().length;



  static ContaInherited of(BuildContext context) {
    final ContaInherited? result =
        context.dependOnInheritedWidgetOfExactType<ContaInherited>();
    assert(result != null, 'No ContaInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ContaInherited old) => allContas.toString().length != old.allContas.toString().length;
}
