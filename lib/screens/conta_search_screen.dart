import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testes_mysql1/Data/conta_dao.dart';
import 'package:testes_mysql1/components/conta.dart';
import 'package:testes_mysql1/global_var.dart';
import 'package:testes_mysql1/screens/conta_search_dialog_box.dart';



class ContaSearchScreen extends StatefulWidget {
  late String bx;
  late List<Conta> contasLista;

  String nomePesquisa = "";
  String dataInicio = "2020-01-01";
  String dataFinal  = "2023-01-01";
  bool isSearch = false;

  ContaSearchScreen(this.bx, {Key? key}) : super(key: key) {}

  @override
  State<ContaSearchScreen> createState() => _ContaSearchScreenState();
}

class _ContaSearchScreenState extends State<ContaSearchScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _carregarDados();
  }

  @override
  void dispose(){
    super.dispose();
    widget.isSearch = false;
  }

  Future<void> _carregarDados() async{
    contasPagas = await ContaDao().findAll("S");
    contasAPagar = await ContaDao().findAll("N");
    setState(() {
      widget.contasLista = widget.bx == "S" ? contasPagas : contasAPagar;
    });
  }

  DateTimeRange selectedDates = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text("Pesquisar Contas")
          ),
          body: FutureBuilder<List<Conta>>(
            future: widget.isSearch ? ContaDao().pesquisarNomeData(widget.nomePesquisa, widget.bx, widget.dataInicio, widget.dataFinal) :  ContaDao().findAll(widget.bx),
            builder: (context, snapshot) {
              List<Conta>? items = snapshot.data?.cast<Conta>();
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
                    ),
                  );
                  break;
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [CircularProgressIndicator(), Text('Carregando')],
                    ),
                  );
                  break;
                case ConnectionState.active:
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [CircularProgressIndicator(), Text('Carregando')],
                    ),
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
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              List<dynamic> result = await showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return ContaSearchDialogBox(widget.bx);
                  });

              if (!mounted) return;

              ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar(content: Text("${result[1]}")));

              setState(() {
                widget.isSearch = result[0];
                widget.nomePesquisa = result[1];
                widget.dataInicio = result[2];
                widget.dataFinal = result[3];
              });
            },
            child: Icon(Icons.search_sharp),
          ),
        ),

    );
  }

  void searchConta(String query){
    final List<Conta> listainicial = widget.bx == "N" ? contasAPagar : contasPagas;

    final suggestions = listainicial.where((conta) {
      return conta.favorecido.contains(query.toUpperCase());
    }).toList();

    setState(() => widget.contasLista = suggestions);

  }
}
