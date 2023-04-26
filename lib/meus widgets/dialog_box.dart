import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testes_mysql1/meus widgets/my_button.dart';

class DialogBox extends StatefulWidget {
  VoidCallback onSave;
  VoidCallback onCancel;
  String status;
  String nome_fantasia;

  DialogBox({
    Key? key,
    required this.onSave,
    required this.onCancel,
    required this.status,
    required this.nome_fantasia,
  }) : super(key: key);

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 400,
          height: 160,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // get user input

              Text("Confirmação",
                  style: GoogleFonts.quicksand(
                      fontSize: 20, fontWeight: FontWeight.w700)),

              Text("Deseja mesmo ${widget.status == "1" ? "inativar" : "ativar"} o cliente ${widget.nome_fantasia} ?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),

              // buttons -> save + cancel
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // save button
                  MyButton(
                      text: "Cancelar", onPressed: widget.onCancel, color: 0),

                  const SizedBox(width: 20),

                  // cancel button
                  MyButton(text: "Confirmar", onPressed: widget.onSave, color: 1),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}