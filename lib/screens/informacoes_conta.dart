import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:testes_mysql1/Data/conta_dao.dart';
import 'package:testes_mysql1/meus%20widgets/conta_baixar_dialogbox.dart';
import 'package:testes_mysql1/meus%20widgets/conta_dialog_box.dart';
import 'package:testes_mysql1/meus%20widgets/my_button.dart';
import 'package:testes_mysql1/screens/conta_editar_screen.dart';
import 'package:testes_mysql1/screens/contas_screen.dart';

class InformacoesConta extends StatefulWidget {
  final String id;
  String bx;
  late String data;
  late String vencimento;
  late String dataPag;
  late String valor;
  late String tipo;
  late String subtipo;
  late String fornecedor;
  late String descricao;
  late String parcela;
  late String id_doc;

  InformacoesConta({required this.id, required this.bx, Key? key}) : super(key: key);

  @override
  State<InformacoesConta> createState() => _InformacoesContaState();
}

class _InformacoesContaState extends State<InformacoesConta> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black, size: 32),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back)),
            title: Text("Gerenciar",
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black)),
          ),
          body: SingleChildScrollView(
            child: FutureBuilder(
              future: ContaDao().findInfoConta(widget.id),
              builder: (context, snapshot) {
                List<String>? items = snapshot.data?.toList();
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text('Nenhum'),
                        ],
                      ),
                    );
                    break;
                  case ConnectionState.waiting:
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [CircularProgressIndicator(), Text('Waiting')],
                      ),
                    );
                    break;
                  case ConnectionState.active:
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text('Conexão ativa')
                        ],
                      ),
                    );
                    break;
                  case ConnectionState.done:
                    if (snapshot.hasData && items != null) {
                      if (items.isNotEmpty) {
                        widget.data = items[1];
                        widget.vencimento = items[2];
                        widget.dataPag = items[3];
                        widget.valor = items[4];
                        widget.tipo = items[5];
                        widget.subtipo = items[6];
                        widget.fornecedor = items[7];
                        widget.descricao = items[8];
                        widget.parcela = items[9];
                        widget.id_doc = items[10];
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, bottom: 0, left: 1, right: 1),
                              child: Column(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          width: 360,
                                          height: 1,
                                          color: Colors.black54,
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 40 : 50,
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text("Número",
                                                        style: GoogleFonts
                                                            .quicksand(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize:
                                                            ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                            color: Colors
                                                                .black38)),
                                                    Text(items[0],
                                                        style: GoogleFonts
                                                            .quicksand(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize:
                                                            ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                            color: Colors
                                                                .black87)),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              SizedBox(
                                                height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 40 : 50,
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text("Data",
                                                        style: GoogleFonts
                                                            .quicksand(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize:
                                                            ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                            color: Colors
                                                                .black38)),
                                                    Text(
                                                        "${items[1].toString().substring(8, 10)}/${items[1].toString().substring(5, 7)}/${items[1].toString().substring(0, 4)}",
                                                        style: GoogleFonts.quicksand(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                            color: Colors
                                                                .black87)),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              SizedBox(
                                                height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 40 : 50,
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text("Vencimento",
                                                        style: GoogleFonts
                                                            .quicksand(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize:
                                                            ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                            color: Colors
                                                                .black38)),
                                                    Text(
                                                        "${items[2].toString().substring(8, 10)}/${items[2].toString().substring(5, 7)}/${items[2].toString().substring(0, 4)}",
                                                        style: GoogleFonts.quicksand(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                            color: Colors
                                                                .black87)),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              SizedBox(
                                                height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 40 : 50,
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                        "Data de pagamento",
                                                        style: GoogleFonts.quicksand(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                            color: Colors
                                                                .black38)),
                                                    Text(
                                                        items[3] == "null"
                                                            ? "Sem data de pagamento"
                                                            : "${items[3].toString().substring(8, 10)}/${items[3].toString().substring(5, 7)}/${items[3].toString().substring(0, 4)}",
                                                        style: GoogleFonts
                                                            .quicksand(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize:
                                                            ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                            color: Colors
                                                                .black87)),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                textDirection:
                                                TextDirection.ltr,
                                                children: [
                                                  SizedBox(
                                                    height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 50 : 81,
                                                    width: 100,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text("Valor",
                                                            style: GoogleFonts.quicksand(
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                                fontSize:
                                                                ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                                color: Colors
                                                                    .black38)),
                                                        Text(
                                                            "R\$ ${items[4].replaceAll(".", ",")}",
                                                            style: GoogleFonts.quicksand(
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                                fontSize:
                                                                ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                                color: Colors
                                                                    .black87)),
                                                        SizedBox(
                                                          height: 6,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 50 : 60,
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text("Tipo",
                                                        style: GoogleFonts
                                                            .quicksand(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize:
                                                            ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                            color: Colors
                                                                .black38)),
                                                    Text(items[5],
                                                        style: GoogleFonts
                                                            .quicksand(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize:
                                                            ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                            color: Colors
                                                                .black87)),
                                                    SizedBox(
                                                      height: 6,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 40 : 50,
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text("Sub-tipo",
                                                        style: GoogleFonts
                                                            .quicksand(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize:
                                                            ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                            color: Colors
                                                                .black38)),
                                                    Text(items[6],
                                                        style: GoogleFonts
                                                            .quicksand(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize:
                                                            ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                            color: Colors
                                                                .black87)),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              SizedBox(
                                                height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 40 : 50,
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text("Fornecedor",
                                                        style: GoogleFonts
                                                            .quicksand(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize:
                                                            ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                            color: Colors
                                                                .black38)),
                                                    Text(items[7],
                                                        style: GoogleFonts
                                                            .quicksand(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize:
                                                            ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                            color: Colors
                                                                .black87)),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              SizedBox(
                                                height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 40 : 50,
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text("Descrição",
                                                        style: GoogleFonts
                                                            .quicksand(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize:
                                                            ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                            color: Colors
                                                                .black38)),
                                                    Text(
                                                        items[8].isEmpty
                                                            ? "Sem descrição"
                                                            : items[8],
                                                        style: GoogleFonts
                                                            .quicksand(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize:
                                                            ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                            color: Colors
                                                                .black87)),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              SizedBox(
                                                height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 40 : 50,
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text("Parcela",
                                                        style: GoogleFonts
                                                            .quicksand(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize:
                                                            ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                            color: Colors
                                                                .black38)),
                                                    Text(items[9],
                                                        style: GoogleFonts
                                                            .quicksand(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize:
                                                            ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                            color: Colors
                                                                .black87)),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 40 : 50,
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text("ID do documento",
                                                        style: GoogleFonts
                                                            .quicksand(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize:
                                                            ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                            color: Colors
                                                                .black38)),
                                                    Text(items[10],
                                                        style: GoogleFonts
                                                            .quicksand(
                                                            fontWeight:
                                                            FontWeight
                                                                .w600,
                                                            fontSize:
                                                            ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 16 : 20,
                                                            color: Colors
                                                                .black87)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
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
          ),
          bottomNavigationBar: ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContaEditarScreen(
                                  id: widget.id,
                                  data: widget.data,
                                  dataPag: widget.dataPag,
                                  descricao: widget.descricao,
                                  fornecedor: widget.fornecedor,
                                  parcela: widget.parcela,
                                  id_doc: widget.id_doc,
                                  subtipo: widget.subtipo,
                                  tipo: widget.tipo,
                                  valor: widget.valor,
                                  vencimento: widget.vencimento,
                                )));
                  },
                  child: Text("Alterar")),
              widget.bx == 'N' ? ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return ContaBaixarDialogBox(id: widget.id);
                        });
                  },
                  child: Text("Baixar")) : SizedBox(),
              ElevatedButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) {
                        return ContaDialogBox(
                            onSave: () {
                              ContaDao().delete(id: int.parse(widget.id));
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Contas()));
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "Conta de ID ${widget.id} deletada com sucesso")));
                            },
                            onCancel: () => Navigator.of(context).pop(),
                            id: widget.id);
                      }),
                  child: Text("Excluir")),
            ],
          )),
    );
  }
}
