import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cliente extends StatefulWidget {
  late final String nome;
  late final String telefone;
  late final String fantasia;

  Cliente(this.nome, this.fantasia, this.telefone, {Key? key})
      : super(key: key);

  @override
  State<Cliente> createState() => _ClienteState();
}

class _ClienteState extends State<Cliente> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white70),
        height: 80,
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
                  child: Text(
                    widget.fantasia,
                    style: GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 250,
                        height: 20,
                        child: Text(
                          widget.nome,
                          style: GoogleFonts.quicksand(fontSize: 12, color: Colors.black), overflow: TextOverflow.fade,


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
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                  color: Colors.deepOrange),
              width: 12,
              height: 80,
            )
          ],
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
