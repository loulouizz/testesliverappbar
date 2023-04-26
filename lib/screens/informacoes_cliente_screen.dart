import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testes_mysql1/Data/cliente_dao.dart';
import 'package:testes_mysql1/global_var.dart';
import 'package:testes_mysql1/meus%20widgets/active_button.dart';
import 'package:responsive_framework/responsive_framework.dart';

class InformacoesCliente extends StatefulWidget {
  final String id;
  final String ativo;
  final String nome_fantasia;
  final String razao_social;
  final String insc_estadual;
  final String cidade;
  final String cep;
  final String numero;
  final String bairro;
  final String telefone;
  final String email;
  final String sistema;


  const InformacoesCliente({required String this.id, required this.ativo, required this.nome_fantasia, required this.razao_social, required this.insc_estadual, required this.cidade, required this.cep, required this.numero, required this.bairro, required this.telefone, required this.email, required this.sistema, Key? key})
      : super(key: key);

  @override
  State<InformacoesCliente> createState() => _InformacoesClienteState();
}

class _InformacoesClienteState extends State<InformacoesCliente> {
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
          body: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 0, bottom: 0, left: 1, right: 1),
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
                            padding: EdgeInsets.only(left: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 8.0 : 100.0, right: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 8.0 : 200.0),
                            child: ResponsiveRowColumn(
                              rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                              columnCrossAxisAlignment: CrossAxisAlignment.start,
                              layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
                              children: [
                                ResponsiveRowColumnItem(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 45,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("Nome fantasia",
                                                style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: Colors.black38)),
                                            /*Text("Nome fantasia teste",
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87)),*/
                                            Text(widget.nome_fantasia, style: GoogleFonts.quicksand(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: 44,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("Razão social",
                                                style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: Colors.black38)),
                                            /*Text("Razão social teste",
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87)),*/
                                            Text(widget.razao_social, style: GoogleFonts.quicksand(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: 44,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("Inscrição Estadual",
                                                style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: Colors.black38)),
                                            Text(widget.insc_estadual, style: GoogleFonts.quicksand(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: 44,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("Cidade",
                                                style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: Colors.black38)),
                                            Text(widget.cidade, style: GoogleFonts.quicksand(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        textDirection: TextDirection.ltr,
                                        children: [
                                          SizedBox(
                                            height: 55,
                                            width: 100,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text("CEP",
                                                    style: GoogleFonts.quicksand(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 16,
                                                        color: Colors.black38)),
                                                Text(widget.cep, style: GoogleFonts.quicksand(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87)),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 50,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("Nº",
                                                style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: Colors.black38)),
                                            Text(widget.numero, style: GoogleFonts.quicksand(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87)),
                                            SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ResponsiveRowColumnItem(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 44,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Bairro",
                                                style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: Colors.black38)),
                                            Text(widget.bairro, style: GoogleFonts.quicksand(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: 44,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("Telefone",
                                                style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: Colors.black38)),
                                            Text(widget.telefone, style: GoogleFonts.quicksand(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: 44,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("E-mail",
                                                style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: Colors.black38)),
                                            Text(widget.email, style: GoogleFonts.quicksand(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: 44,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("Sistema",
                                                style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: Colors.black38)),
                                            Text(widget.sistema, style: GoogleFonts.quicksand(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87)),
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
                    )
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            width: 420,
            height: 60,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("ID:",
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white)),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(widget.id, style: GoogleFonts.quicksand(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87)),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ActiveButton(
                      widget.ativo == "1" ? "Ativo" : "Inativo",
                      widget.ativo,
                      widget.nome_fantasia,
                      widget.ativo == "1" ? Colors.green : Colors.red,
                      int.parse(widget.id)),
                ),
              ],
            ),
          ),
        ),

    );
  }
}


