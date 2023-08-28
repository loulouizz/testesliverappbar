

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:barcode/barcode.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testes_mysql1/Data/codebar_dao.dart';
import 'package:testes_mysql1/Data/database.dart';

class Codebar extends StatefulWidget {
  const Codebar({Key? key}) : super(key: key);

  @override
  State<Codebar> createState() => _CodebarState();
}

class _CodebarState extends State<Codebar> {

  TextEditingController numeroEC = TextEditingController();
  TextEditingController nomeEC = TextEditingController();
  TextEditingController unidadeEC = TextEditingController();
  TextEditingController valorEC = TextEditingController();
  TextEditingController quantidadeEC = TextEditingController();

  String ticket = '';

  readBarcode () async {
    String code = await FlutterBarcodeScanner.scanBarcode("#FFFFFF", "Cancelar", false, ScanMode.QR);

    setState(() {
      ticket = code != '-1' ? code : 'Não validado';
      numeroEC.text = ticket;
    },);
  }

  search () async {
    conectar();
    List<String> resultado = await CodebarDAO().find(id: int.parse(numeroEC.text));
    print(resultado[0].toString());
    setState(() {
      nomeEC.text = resultado[0].toString();
      unidadeEC.text = resultado[1].toString();
      valorEC.text = resultado[2].toString();
      quantidadeEC.text = resultado[3].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Nº do produto",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black38)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 3,
                        child: TextFormField(
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          controller: numeroEC,
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hoverColor: Colors.black,
                            focusColor: Colors.black,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0)),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: SizedBox(
                            width: 50,
                            child: InkWell(
                              onTap: () {
                                readBarcode();
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: Colors.blue, // Cor de fundo azul
                                  borderRadius: BorderRadius.circular(8), // Borda arredondada
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Icon(Icons.qr_code, color: Colors.white), // Ícone branco
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: InkWell(
                            onTap: () {
                              search();
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Ink(
                              decoration: BoxDecoration(
                                color: Colors.blue, // Cor de fundo azul
                                borderRadius: BorderRadius.circular(8), // Borda arredondada
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Icon(Icons.search_sharp, color: Colors.white), // Ícone branco
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nome do produto",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black38)),
                    TextFormField(
                      readOnly: true,
                      controller: nomeEC,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hoverColor: Colors.black,
                        focusColor: Colors.black,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0)),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Unidade",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black38)),
                    TextFormField(
                      readOnly: true,
                      controller: unidadeEC,
                      obscureText: false,
                      enableInteractiveSelection: false,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hoverColor: Colors.black,
                        focusColor: Colors.black,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0)),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Valor",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black38)),
                    TextFormField(
                      readOnly: true,
                      controller: valorEC,
                      obscureText: false,
                      enableInteractiveSelection: false,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hoverColor: Colors.black,
                        focusColor: Colors.black,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0)),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                Text("Quantidade em estoque",
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black38)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(flex: 2,child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          readOnly: true,
                          controller: quantidadeEC,
                          obscureText: false,
                          enableInteractiveSelection: false,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hoverColor: Colors.black,
                            focusColor: Colors.black,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0)),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: ElevatedButton.icon(
                          onPressed: (){},
                          icon: Icon(Icons.delete),
                          label: Text("Zerar"),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(110, 50),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      )
    );
  }
}

