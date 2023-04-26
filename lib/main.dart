import 'package:flutter/material.dart';
import 'package:testes_mysql1/Data/cliente_dao.dart';
import 'package:testes_mysql1/Data/conta_dao.dart';
import 'package:testes_mysql1/Data/conta_inherited.dart';
import 'package:testes_mysql1/global_var.dart';
import 'package:testes_mysql1/route_generator.dart';
import 'package:testes_mysql1/screens/initial_screen.dart';
import 'package:testes_mysql1/screens/login_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:testes_mysql1/service/galaxpayapi.dart';

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
    return ContaInherited(
      child: MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          breakpoints: const [
            ResponsiveBreakpoint.resize(350, name: MOBILE),
            ResponsiveBreakpoint.autoScale(600, name: TABLET),
            ResponsiveBreakpoint.resize(800, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
          ],
        ),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: ClienteInherited(child: const ListScreen(),)
        onGenerateRoute: RouteGenerator.generateRoute,
        home: InitialScreen(),
      ),
    );
  }
}