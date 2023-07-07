import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testes_mysql1/Data/cliente_inherited.dart';
import 'package:testes_mysql1/Data/conta_dao.dart';
import 'package:testes_mysql1/Data/conta_inherited.dart';
import 'package:testes_mysql1/global_var.dart';
import 'package:testes_mysql1/screens/contas_screen.dart';
import 'package:testes_mysql1/screens/list_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(title: Text("JV App")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Image.asset("lib/images/logocolorida.png")),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),

                SizedBox(
                  width: 300,
                  height: 300,
                  child: Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Ink(
                                width: 120,
                                height: 140,
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Material(
                                        color: Colors.blue,
                                        child: InkWell(
                                          child: Container(
                                            width: 120,
                                            height: 140,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.group, color: Colors.white, size: 72),
                                                Text("Clientes", style: GoogleFonts.roboto(fontSize: 20, color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => ClienteInherited(child: ListScreen())));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 12,),
                              Ink(
                                width: 120,
                                height: 140,
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Material(
                                        color: Colors.green,
                                        child: InkWell(
                                          child: Container(
                                            width: 120,
                                            height: 140,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.attach_money, color: Colors.white, size: 72),
                                                Text("A receber", style: GoogleFonts.roboto(fontSize: 20, color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                          onTap: () async {
                                            //Navigator.push(context, MaterialPageRoute(builder: (context) => Contas()));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 120,
                                height: 140,
                                color: Colors.red,
                              ),
                              SizedBox(width: 12,),
                              Ink(
                                width: 120,
                                height: 140,
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Material(
                                        color: Colors.yellow,
                                        child: InkWell(
                                          child: Container(
                                            width: 120,
                                            height: 140,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.receipt_long, color: Colors.white, size: 72),
                                                Text("A pagar", style: GoogleFonts.roboto(fontSize: 20, color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => Contas()));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
