import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testes_mysql1/screens/informacoes_conta.dart';

class Conta extends StatefulWidget {
  String _id;
  String _favorecido;
  DateTime _dtVenc;
  DateTime? _dtPag;
  double _valor;
  double _valorPago;
  String _formaPagamento;
  String _bx;

  Conta(this._id, this._favorecido, this._dtVenc, this._dtPag, this._valor,
      this._valorPago, this._formaPagamento, this._bx,
      {Key? key})
      : super(key: key);



  @override
  State<Conta> createState() => _ContaState();


  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get favorecido => _favorecido;

  set favorecido(String value) {
    _favorecido = value;
  }

  double get valor => _valor;

  set valor(double value) {
    _valor = value;
  }

  double get valorPago => _valorPago;

  set valorPago(double value) {
    _valorPago = value;
  }

  String get formaPagamento => _formaPagamento;

  set formaPagamento(String value) {
    _formaPagamento = value;
  }

  String get bx => _bx;

  set bx(String value) {
    _bx = value;
  }


  DateTime? get dtPag => _dtPag;

  set dtPag(DateTime? value) {
    _dtPag = value;
  }

  DateTime get dtVenc => _dtVenc;

  set dtVenc(DateTime value) {
    _dtVenc = value;
  }
}

class _ContaState extends State<Conta> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white70,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InformacoesConta(widget.id)));
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 26,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 2.0, left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Text(widget.favorecido,
                                style: GoogleFonts.quicksand(
                                    fontSize: 16, color: Colors.black),maxLines: 2,
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Text(
                                "R\$ ${widget.valor}".replaceAll(".", ","),
                                style: GoogleFonts.quicksand(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Data Vencimento: ${widget.dtVenc.toString().substring(8,10)}/${widget.dtVenc.toString().substring(5,7)}/${widget.dtVenc.toString().substring(0,4)}",
                                  style: GoogleFonts.quicksand(
                                      fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),
                            SafeArea(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  widget.bx == "S"
                                      ? Text(
                                          "Data Pagamento: ${widget.dtPag.toString().substring(8,10)}/${widget.dtPag.toString().substring(5,7)}/${widget.dtPag.toString().substring(0,4)}",
                                          style: GoogleFonts.quicksand(
                                              fontSize: 14,
                                              color: Colors.black54),
                                        )
                                      : SizedBox(),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.06,
                                  ),
                                  widget.bx == "S"
                                      ? Text(
                                          "R\$${widget.valorPago}", style: TextStyle(fontSize: 16, color: Colors.blue),)
                                      : const SizedBox(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12)),
                        color: widget.bx == 'S'
                            ? Colors.blue[800]
                            : Colors.red[800]),
                    width: 16,
                    height: 82,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
