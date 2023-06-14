import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testes_mysql1/Data/cliente_dao.dart';
import 'package:testes_mysql1/Data/conta_dao.dart';
import 'package:testes_mysql1/Data/conta_inherited.dart';
import 'package:testes_mysql1/components/conta.dart';
import 'package:testes_mysql1/global_var.dart';
import 'package:testes_mysql1/screens/conta_search_dialog_box.dart';
import 'package:testes_mysql1/screens/conta_search_screen.dart';

class Contas extends StatefulWidget {
  late List<Conta> contasLista;

  String nomePesquisa = "";
  String dataInicio = "2020-01-01";
  String dataFinal  = "2023-01-01";
  bool isSearch = false;

  List<Conta> contasPagasRaiz = [];
  List<Conta> contasAPagarRaiz = [];

  late Future<List<Conta>> contasPagas;
  late Future<List<Conta>> contasAPagar;

  Contas({Key? key}) : super(key: key);

  @override
  State<Contas> createState() => _ContasState();
}

class _ContasState extends State<Contas> with TickerProviderStateMixin {



  late TabController _tabController;
  int _bx = 1;

  void carregarDados() async {
    widget.contasPagas      = ContaDao().findAll("S");
    widget.contasAPagar     = ContaDao().findAll("N");
    widget.contasPagasRaiz  = await ContaDao().findAll("S");
    widget.contasAPagarRaiz = await ContaDao().findAll("N");
  }

  @override
  void initState()  {
    carregarDados();
    super.initState();
    _tabController          = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, value){
              return [
                SliverAppBar(
                  title: Text(
                    "Contas a Pagar",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () async {
                        List<dynamic> result = await showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return ContaSearchDialogBox(_tabController.index == 0 ? "N" : "S");
                            });

                        if (!mounted) return;

                        if(result[0] == true){
                          //ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar(content: Text("${result[1]}")));

                          // fazer um if. Se o result[0] for true, então fazer o setstate abaixo, senão, fazer um setstate atualizando a lista para a original
                          setState(() {
                            widget.isSearch = result[0];
                            widget.nomePesquisa = result[1];
                            widget.dataInicio = result[2];
                            widget.dataFinal = result[3];
                          });

                          _tabController.index == 0 ? widget.contasAPagar = ContaDao().pesquisarNomeData(result[1], "N", result[2], result[3]) : widget.contasPagas = ContaDao().pesquisarNomeData(result[1], "S", result[2], result[3]);

                        }


                      },
                      icon: Icon(Icons.search_sharp),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                  bottom: TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(
                        child: Text(
                          "A pagar",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Pagas",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: [
                buildarListaContas(widget.contasAPagar),
                buildarListaContas(widget.contasPagas),
              ],
            ),
          ),
        ),
    );
  }

  Widget buildarListaContas(Future<List<Conta>> futuro) {
    return FutureBuilder<List<Conta>>(
        future: futuro,
        builder: (context, snapshot) {
          List<Conta>? items = snapshot.data?.cast<Conta>();
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text('Carregando'),
                ],
              );
              break;
            case ConnectionState.waiting:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [CircularProgressIndicator(), Text('Carregando')],
              );
              break;
            case ConnectionState.active:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [CircularProgressIndicator(), Text('Carregando')],
              );
              break;
            case ConnectionState.done:
              if (snapshot.hasData && items != null) {
                if (items.isNotEmpty) {
                  return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Conta conta = items[index];
                        return conta;
                      });
                }
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.info_sharp, size: 100),
                  Text('Não há nada no banco de dados',
                      style: TextStyle(fontSize: 20)),
                ],
              );
          }
        },
    );
  }
}
