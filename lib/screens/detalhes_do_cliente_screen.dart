import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testes_mysql1/Data/cliente_dao.dart';
import 'package:testes_mysql1/screens/informacoes_cliente_screen.dart';

class DetalhesDoClienteScreen extends StatefulWidget {
  final String nome_fantasia;
  final String razao_social;
  final String id;
  final String status;

  const DetalhesDoClienteScreen(
      this.nome_fantasia, this.razao_social, this.id, this.status,
      {Key? key})
      : super(key: key);

  @override
  State<DetalhesDoClienteScreen> createState() =>
      _DetalhesDoClienteScreenState();
}

class _DetalhesDoClienteScreenState extends State<DetalhesDoClienteScreen> {
  Future _query() async {
    Map<int, dynamic> resultados = Map();
    resultados[1] = await ClienteDao().findCampoEspecifico(
        parametro: 'id',
        argumento: widget.id,
        campoParaPesquisar: "insc_estadual");
    resultados[1] = await ClienteDao().findCampoEspecifico(
        parametro: 'id',
        argumento: widget.id,
        campoParaPesquisar: "insc_estadual");
    resultados[2] = await ClienteDao().findCampoEspecifico(
        parametro: 'id', argumento: widget.id, campoParaPesquisar: "cidade");
    resultados[3] = await ClienteDao().findCampoEspecifico(
        parametro: 'id', argumento: widget.id, campoParaPesquisar: "cep");
    resultados[4] = await ClienteDao().findCampoEspecifico(
        parametro: 'id', argumento: widget.id, campoParaPesquisar: "numero");
    resultados[5] = await ClienteDao().findCampoEspecifico(
        parametro: 'id', argumento: widget.id, campoParaPesquisar: "bairro");
    resultados[6] = await ClienteDao().findCampoEspecifico(
        parametro: 'id', argumento: widget.id, campoParaPesquisar: "telefone");
    resultados[7] = await ClienteDao().findCampoEspecifico(
        parametro: 'id', argumento: widget.id, campoParaPesquisar: "email");
    resultados[8] = await ClienteDao().findCampoEspecifico(
        parametro: 'id', argumento: widget.id, campoParaPesquisar: "sistema");

    return resultados;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, c) {
        final width = c.maxWidth;
        var fontSize = 16.0;
        if (width <= 480) {
          fontSize = 16.0;
        } else if (width > 480 && width <= 960) {
          fontSize = 22.0;
        } else {
          fontSize = 28.0;
        }

        return FutureBuilder(
            future: ClienteDao().findInfoCliente(widget.id),
            builder: (context, snapshot) {
              List<String>? items = snapshot.data?.toList();
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Scaffold(
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text('Carregando'),
                        ],
                      ),
                    ),
                  );
                  break;
                case ConnectionState.waiting:
                  return Scaffold(
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text('Carregando'),
                        ],
                      ),
                    ),
                  );
                  break;
                case ConnectionState.active:
                  return Scaffold(
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text('Carregando'),
                        ],
                      ),
                    ),
                  );
                  break;
                case ConnectionState.done:
                  return SafeArea(
                    child: Scaffold(
                      backgroundColor: Colors.white,
                      appBar: AppBar(
                        iconTheme: IconThemeData(color: Colors.black, size: 32),
                        backgroundColor: Colors.white,
                        elevation: 0,
                        centerTitle: true,
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Perfil",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: fontSize + 10,
                                  color: Colors.black)),
                        ),
                      ),
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    widget.nome_fantasia,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w600,
                                        fontSize: fontSize + 10),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    widget.razao_social,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w300,
                                        fontSize: fontSize),
                                    overflow: TextOverflow.fade,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height *
                                        0.003,
                                    color: Colors.black54,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Ink(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        height:
                                            MediaQuery.of(context).size.width <
                                                    500
                                                ? 82
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.099,
                                        child: Container(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Material(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    onTap: () async {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  InformacoesCliente(
                                                                    razao_social:
                                                                        widget
                                                                            .razao_social,
                                                                    nome_fantasia:
                                                                        widget
                                                                            .nome_fantasia,
                                                                    ativo: widget
                                                                        .status,
                                                                    bairro: snapshot
                                                                        .data![4],
                                                                    //4
                                                                    cep: snapshot
                                                                        .data![2],
                                                                    //2
                                                                    cidade: snapshot
                                                                        .data![1],
                                                                    //1
                                                                    email: snapshot
                                                                        .data![6],
                                                                    //6
                                                                    id: widget
                                                                        .id,
                                                                    insc_estadual:
                                                                        snapshot
                                                                            .data![0],
                                                                    //0
                                                                    numero: snapshot
                                                                        .data![3],
                                                                    //3
                                                                    sistema:
                                                                        snapshot
                                                                            .data![7],
                                                                    //7
                                                                    telefone: snapshot
                                                                            .data![
                                                                        5], //5
                                                                  )));
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              right: 10,
                                                              top: 10,
                                                              bottom: 10),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height: 52,
                                                            width: 52,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6),
                                                              color: Colors
                                                                  .blue[600],
                                                            ),
                                                            child: Icon(
                                                                Icons
                                                                    .manage_accounts_outlined,
                                                                size: 40),
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                    "Gerenciar",
                                                                    style: GoogleFonts.quicksand(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            fontSize)),
                                                                Icon(
                                                                  Icons
                                                                      .keyboard_double_arrow_right_sharp,
                                                                  size: 50,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          height: 2,
                                        ),
                                      ),
                                      Ink(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        height:
                                            MediaQuery.of(context).size.width <
                                                    500
                                                ? 82
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.099,
                                        child: Container(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Material(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: InkWell(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    onTap: () async {
                                                      String bairro =
                                                          await ClienteDao()
                                                              .findCampoEspecifico(
                                                                  parametro:
                                                                      "id",
                                                                  argumento:
                                                                      widget.id,
                                                                  campoParaPesquisar:
                                                                      "bairro");
                                                      String cep = await ClienteDao()
                                                          .findCampoEspecifico(
                                                              parametro: "id",
                                                              argumento:
                                                                  widget.id,
                                                              campoParaPesquisar:
                                                                  "cep");
                                                      String cidade =
                                                          await ClienteDao()
                                                              .findCampoEspecifico(
                                                                  parametro:
                                                                      "id",
                                                                  argumento:
                                                                      widget.id,
                                                                  campoParaPesquisar:
                                                                      "cidade");
                                                      String email = await ClienteDao()
                                                          .findCampoEspecifico(
                                                              parametro: "id",
                                                              argumento:
                                                                  widget.id,
                                                              campoParaPesquisar:
                                                                  "email");
                                                      String insc_estadual =
                                                          await ClienteDao()
                                                              .findCampoEspecifico(
                                                                  parametro:
                                                                      "id",
                                                                  argumento:
                                                                      widget.id,
                                                                  campoParaPesquisar:
                                                                      "insc_estadual");
                                                      String numero =
                                                          await ClienteDao()
                                                              .findCampoEspecifico(
                                                                  parametro:
                                                                      "id",
                                                                  argumento:
                                                                      widget.id,
                                                                  campoParaPesquisar:
                                                                      "numero");
                                                      String telefone =
                                                          await ClienteDao()
                                                              .findCampoEspecifico(
                                                                  parametro:
                                                                      "id",
                                                                  argumento:
                                                                      widget.id,
                                                                  campoParaPesquisar:
                                                                      "telefone");
                                                      String sistema =
                                                          await ClienteDao()
                                                              .findCampoEspecifico(
                                                                  parametro:
                                                                      "id",
                                                                  argumento:
                                                                      widget.id,
                                                                  campoParaPesquisar:
                                                                      "sistema");

                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  InformacoesCliente(
                                                                    razao_social:
                                                                        widget
                                                                            .razao_social,
                                                                    nome_fantasia:
                                                                        widget
                                                                            .nome_fantasia,
                                                                    ativo: widget
                                                                        .status,
                                                                    bairro:
                                                                        bairro,
                                                                    cep: cep,
                                                                    cidade:
                                                                        cidade,
                                                                    email:
                                                                        email,
                                                                    id: widget
                                                                        .id,
                                                                    insc_estadual:
                                                                        insc_estadual,
                                                                    numero:
                                                                        numero,
                                                                    sistema:
                                                                        sistema,
                                                                    telefone:
                                                                        telefone,
                                                                  )));
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              right: 10,
                                                              top: 10,
                                                              bottom: 10),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height: 52,
                                                            width: 52,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6),
                                                              color: Colors
                                                                  .green[600],
                                                            ),
                                                            child: Icon(
                                                                Icons
                                                                    .payments_outlined,
                                                                size: 40),
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Expanded(
                                                              child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text("Pagamento",
                                                                  style: GoogleFonts.quicksand(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          fontSize)),
                                                              Icon(
                                                                Icons
                                                                    .keyboard_double_arrow_right_sharp,
                                                                size: 50,
                                                                //color: Colors.green[600],
                                                              )
                                                            ],
                                                          ))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                  break;
              }
            });
      },
    );
  }
}
