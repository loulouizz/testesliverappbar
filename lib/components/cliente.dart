import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testes_mysql1/screens/detalhes_do_cliente_screen.dart';

class Cliente extends StatefulWidget {
  String _nome;
  String _telefone;
  String _fantasia;
  String _id;
  String _status;

  Cliente(this._nome, this._fantasia, this._telefone, this._id, this._status, {Key? key})
      : super(key: key);

  @override
  State<Cliente> createState() => _ClienteState();

  String get nome => _nome;
  set nome(String value) {
    _nome = value;
  }

  String get telefone => _telefone;
  set telefone(String value) {
    _telefone = value;
  }

  String get fantasia => _fantasia;
  set fantasia(String value) {
    _fantasia = value;
  }

  String get id => _id;
  set id(String value) {
    _id = value;
  }

  String get status => _status;
  set status(String value) {
    _status = value;
  }
}

class _ClienteState extends State<Cliente> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 2.0,left: 2.0,top: 0.0,bottom: 4.0),
      child: Ink(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white70), width: MediaQuery.of(context).size.width, height: 82,
        child: Container(
          child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white70,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetalhesDoClienteScreen(widget.fantasia, widget.nome, widget.id, widget.status)));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12), color: Colors.white70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              widget.fantasia,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.quicksand(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center ,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  height: 20,
                                  child: Text(
                                    widget.nome,
                                    style: GoogleFonts.quicksand(fontSize: 12, color: Colors.black), overflow: TextOverflow.ellipsis,


                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  widget.telefone,
                                  style: GoogleFonts.quicksand(fontSize: 12)
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                          color: widget.status == '1' ? Colors.blue[800] : Colors.red[800]
                      ),
                      width: 16,
                      height: 82,
                    )
                   ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: Colors.blue),
            height: 140,
          ),
          Column(
            children: [
              Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 320,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                widget.nome,
                                style: const TextStyle(
                                    fontSize: 20,
                                    overflow: TextOverflow.visible,
                                    shadows: <Shadow>[
                                      Shadow(
                                          offset: Offset(-1.0, 2.0),
                                          blurRadius: 3.0,
                                          color: Colors.black26)
                                    ]),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 115, left: 8, right: 8, bottom: 6),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 260,
                    child: Text(widget.fantasia,
                        style: TextStyle(
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,
                            shadows: <Shadow>[
                              Shadow(
                                  offset: Offset(-1.0, 2.0),
                                  blurRadius: 3.0,
                                  color: Colors.black54)
                            ])),
                  ),
                  Text(widget.telefone,
                      style: TextStyle(color: Colors.white, shadows: <Shadow>[
                        Shadow(
                            offset: Offset(-1.0, 2.0),
                            blurRadius: 3.0,
                            color: Colors.black54)
                      ])),
                ],
              ),
            ),
          )
        ],
      ),
    );*/
