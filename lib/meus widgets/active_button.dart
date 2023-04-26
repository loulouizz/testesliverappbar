import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testes_mysql1/Data/cliente_dao.dart';
import 'package:testes_mysql1/Data/database.dart';
import 'package:testes_mysql1/global_var.dart';
import 'package:testes_mysql1/meus%20widgets/dialog_box.dart';
import 'package:testes_mysql1/screens/list_screen.dart';

class ActiveButton extends StatefulWidget {
  late String texto;
  String status;
  String nome_fantasia;
  int id;
  late Color cor;

  ActiveButton(this.texto, this.status, this.nome_fantasia, this.cor, this.id,
      {Key? key})
      : super(key: key);

  @override
  State<ActiveButton> createState() => _ActiveButtonState();
}

class _ActiveButtonState extends State<ActiveButton> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      width: 100,
      height: 32,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.blueGrey,
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.blueGrey,
            offset: const Offset(-1,0),
          )
        ], borderRadius: BorderRadius.circular(20)),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return DialogBox(
                      status: widget.status,
                      nome_fantasia: widget.nome_fantasia,
                      onSave: () async {
                        // conexao com banco de dados
                        var conn = await conectar();

                        // atualizar o valor no banco de dados
                        await conn.query('UPDATE clientes SET status = ${1 - int.parse(widget.status)} WHERE id = ${widget.id};');

                        // fechar a conexão com banco de dados
                        desconectarDB(conn);

                        // mostrar mensagem de sucesso na barra inferior
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${widget.status == "1" ? "Inativado" : "Ativado"} com sucesso")));

                        // fechar a dialogbox
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListScreen()));

                      },
                      onCancel: () => Navigator.of(context).pop(),
                    );
                  });
            },
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Row(
                children: [
                  SizedBox(
                    width: 6,
                  ),
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: widget.cor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.texto,
                    style: GoogleFonts.quicksand(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
