import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testes_mysql1/Data/cliente_dao.dart';
import 'package:testes_mysql1/components/cliente.dart';
import 'package:testes_mysql1/global_var.dart';
import 'package:testes_mysql1/main.dart';
import 'package:testes_mysql1/screens/cliente_search_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> with TickerProviderStateMixin {
  List<Cliente> _listaClientes = [];

  TextEditingController searchController = TextEditingController();
  late TabController _tabController;
  int _seAtivo = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    buscarClientes(_seAtivo);
  }

  buscarClientes(int seAtivo) async {
    _listaClientes = await ClienteDao().findPesquisaDB(pesquisa, seAtivo);
    print("O NOME DA POSICAO 0 É: ${_listaClientes.elementAt(0).toString()}");
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
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  title: Text(
                    "Clientes",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClienteSearchScreen(_tabController.index == 0 ? activeClients : inactiveClients, _tabController.index)));
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
                          "Ativos",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Inativos",
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
                buildarListaClientes(1),
                buildarListaClientes(0),
              ],
            )),

        /*CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                "Clientes",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                        offset: Offset(-1.5, 4.0),
                        blurRadius: 4.0,
                        color: Color.fromRGBO(0, 0, 0, 0.25)),
                  ],
                ),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.search_sharp)),
              ],
              expandedHeight: 160,
              floating: true,
              pinned: true,
              backgroundColor: Colors.blue,
              flexibleSpace: FlexibleSpaceBar(),
            ),

            SliverToBoxAdapter(
              child: FutureBuilder<List<Cliente>>(
                future: ClienteDao().findPesquisaDB(pesquisa, 1),
                builder: (context, snapshot) {
                  List<Cliente>? items = snapshot.data?.cast<Cliente>();
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text('Carregando'),
                        ],
                      ));
                      break;
                    case ConnectionState.waiting:
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text('Carregando'),
                        ],
                      ));
                      break;
                    case ConnectionState.active:
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text('Carregando'),
                        ],
                      ));
                      break;

                    case ConnectionState.done:
                      buscarClientes();
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return SliverToBoxAdapter(child: _listaClientes.elementAt(index));
                          },
                        ),
                      );
                      break;
                  }
                },
              ),
            ),
          ],
        ),*/ //body 06/01/2023 tipo 2

        /*FutureBuilder<List<Cliente>>(
           future: ClienteDao().findPesquisaDB(pesquisa, (_selectedIndex == 0) ? 1 : 0),
          builder: (context, snapshot) {
            List<Cliente>? items = snapshot.data?.cast<Cliente>();
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text('Carregando'),
                  ],
                ));
                break;
              case ConnectionState.waiting:
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text('Carregando'),
                  ],
                ));
                break;
              case ConnectionState.active:
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text('Carregando'),
                  ],
                ));
                break;
              case ConnectionState.done:
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      title: Text(
                        "Clientes",
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w600,
                          fontSize: 32,
                          color: Colors.white,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(-1.5, 4.0),
                              blurRadius: 4.0,
                              color: Color.fromRGBO(0, 0, 0, 0.25)
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.search_sharp)),
                      ],
                      bottom: TabBar(tabs: []),
                      expandedHeight: 160,
                      floating: true,
                      pinned: true,
                      backgroundColor: Colors.blue,
                      flexibleSpace: FlexibleSpaceBar(),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return _listaClientes.elementAt(index);
                      }),
                    )
                  ],
                );
                break;
            }
          },
        ),*/ //body 05/01/2023 tipo 1

        /*SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: FutureBuilder<List<Cliente>>(
                    future: ClienteDao().findPesquisaDB(pesquisa, 1),
                    builder: (context, snapshot) {
                      List<Cliente>? items = snapshot.data?.cast<Cliente>();
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              Text('Carregando'),
                            ],
                          ));
                          break;
                        case ConnectionState.waiting:
                          return Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              Text('Carregando')
                            ],
                          ));
                          break;
                        case ConnectionState.active:
                          return Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              Text('Carregando')
                            ],
                          ));
                          break;
                        case ConnectionState.done:
                          if (snapshot.hasData && items != null) {
                            if (items.isNotEmpty) {
                              return ListView.builder(
                                  itemCount: items.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    final Cliente cliente = items[index];
                                    return cliente;
                                  });
                            }
                          }
                          return Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.info_sharp, size: 100),
                              Text('Não há nada no banco de dados',
                                  style: TextStyle(fontSize: 20)),
                            ],
                          ));
                      }
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: FutureBuilder<List<Cliente>>(
                    future: ClienteDao().findPesquisaDB(pesquisa, 0),
                    builder: (context, snapshot) {
                      List<Cliente>? items = snapshot.data?.cast<Cliente>();
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                  Text('Carregando'),
                                ],
                              ));
                          break;
                        case ConnectionState.waiting:
                          return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                  Text('Carregando')
                                ],
                              ));
                          break;
                        case ConnectionState.active:
                          return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                  Text('Carregando')
                                ],
                              ));
                          break;
                        case ConnectionState.done:
                          if (snapshot.hasData && items != null) {
                            if (items.isNotEmpty) {
                              return ListView.builder(
                                  itemCount: items.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    final Cliente cliente = items[index];
                                    return cliente;
                                  });
                            }
                          }
                          return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.info_sharp, size: 100),
                                  Text('Não há nada no banco de dados',
                                      style: TextStyle(fontSize: 20)),
                                ],
                              ));
                      }
                    }),
              ),
            ],
          ),
        ), // BODY ANTIGO*/ //antigo body

      ),
    );
  }



  Widget buildarListaClientes(int seAtivo) {
    return FutureBuilder<List<Cliente>>(
        future: ClienteDao().findPesquisaDB(pesquisa, seAtivo),
        builder: (context, snapshot) {
          List<Cliente>? items = snapshot.data?.cast<Cliente>();
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
                        final Cliente cliente = items[index];
                        return cliente;
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
        });
  }
}

