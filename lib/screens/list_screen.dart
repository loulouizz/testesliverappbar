import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:testes_mysql1/Data/cliente_dao.dart';
import 'package:testes_mysql1/components/cliente.dart';
import 'package:testes_mysql1/global_var.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  TextEditingController searchController = TextEditingController();
  late PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      /*appBar: AppBar(
          leading: Container(),
          actions: [IconButton(onPressed: () {
            pesquisa = searchController.text;
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ListScreen()));
          }, icon: Icon(Icons.search))],
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Pesquisa'),
                ),
              ),
            ),
          ),

      ), // APP BAR*/ //APP BAR ANTIGA

      /*body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index){
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
                              children: [CircularProgressIndicator(), Text('Carregando')],
                            ));
                        break;
                      case ConnectionState.active:
                        return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [CircularProgressIndicator(), Text('Carregando')],
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
                                Text('Não há nada no banco de dados', style: TextStyle(fontSize: 20)),
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
                              children: [CircularProgressIndicator(), Text('Carregando')],
                            ));
                        break;
                      case ConnectionState.active:
                        return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [CircularProgressIndicator(), Text('Carregando')],
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
                                Text('Não há nada no banco de dados', style: TextStyle(fontSize: 20)),
                              ],
                            ));
                    }
                  }),
            ),
          ],
        ),
      ),*/ // BODY ANTIGO

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 160.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Clientes'),
              background: FlutterLogo(),
            ),
          ),
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
                            children: [CircularProgressIndicator(), Text('Carregando')],
                          ));
                      break;
                    case ConnectionState.active:
                      return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [CircularProgressIndicator(), Text('Carregando')],
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
                              Text('Não há nada no banco de dados', style: TextStyle(fontSize: 20)),
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
                            children: [CircularProgressIndicator(), Text('Carregando')],
                          ));
                      break;
                    case ConnectionState.active:
                      return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [CircularProgressIndicator(), Text('Carregando')],
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
                              Text('Não há nada no banco de dados', style: TextStyle(fontSize: 20)),
                            ],
                          ));
                  }
                }),
          ),

        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        itemCornerRadius: 100,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        selectedIndex: _selectedIndex,
        onItemSelected: (int index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: Icon(Icons.account_circle), title: Text("Ativos")),
          BottomNavyBarItem(
              icon: Icon(Icons.account_circle_outlined),
              title: Text("Inativos"))
        ],
      ),

      /*bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Ativos'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Inativos'
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),*/
    );
  }
}
