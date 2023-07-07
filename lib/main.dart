import 'package:flutter/material.dart';
import 'package:testes_mysql1/Data/cliente_dao.dart';
import 'package:testes_mysql1/Data/conta_dao.dart';
import 'package:testes_mysql1/global_var.dart';
import 'package:testes_mysql1/screens/initial_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  initState().whenComplete(({
      runApp(const MyApp())
  }));

}

@override initState() async {
  //await GalaxpayAPI().adquirirToken();
  allClients = await ClienteDao().findAll();
  activeClients = await ClienteDao().findPesquisaDB("", 1);
  inactiveClients =  await ClienteDao().findPesquisaDB("", 0);
  allContas = await ContaDao().findAll("");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: ClienteInherited(child: const ListScreen(),)
      home: InitialScreen(),
    );
  }
}