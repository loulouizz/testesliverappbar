import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testes_mysql1/Data/cliente_dao.dart';
import 'package:testes_mysql1/Data/conta_dao.dart';
import 'package:testes_mysql1/Data/conta_inherited.dart';
import 'package:testes_mysql1/components/conta.dart';
import 'package:testes_mysql1/global_var.dart';
import 'package:testes_mysql1/screens/conta_search_screen.dart';

class Contas extends StatefulWidget {
  const Contas({Key? key}) : super(key: key);

  @override
  State<Contas> createState() => _ContasState();
}

class _ContasState extends State<Contas> with TickerProviderStateMixin {



  late TabController _tabController;
  int _bx = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContaSearchScreen(_tabController.index == 0 ? "N" : "S")));
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
                Expanded(child: buildarListaContas(ContaDao().findAll("N"))),
                Expanded(child: buildarListaContas(ContaDao().findAll("S"))),
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
