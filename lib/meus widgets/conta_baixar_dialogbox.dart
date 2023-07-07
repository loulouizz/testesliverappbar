import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testes_mysql1/Data/conta_dao.dart';
import 'package:testes_mysql1/meus widgets/my_button.dart';

class ContaBaixarDialogBox extends StatefulWidget {
  String id;

  ContaBaixarDialogBox({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ContaBaixarDialogBox> createState() => _ContaBaixarDialogBoxState();
}

class _ContaBaixarDialogBoxState extends State<ContaBaixarDialogBox> {
  final TextEditingController valorPagoController = TextEditingController();

  TextEditingController dataPagamentoController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  late String dataEscolhida;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dataPagamentoController.text =
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";

        dataEscolhida = "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
      });
    }
  }

  @override
  void dispose() {
    valorPagoController.dispose();
    dataPagamentoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      backgroundColor: Colors.white,
      content: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 400,
          height: 240, // Aumentei a altura para acomodar os TextFormField
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // get user input
              Text(
                "Baixar",
                style: GoogleFonts.quicksand(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextFormField(
                inputFormatters: [DigitInputFormatter()],
                keyboardType: TextInputType.number,
                controller: valorPagoController,
                decoration: InputDecoration(
                  labelText: 'Valor pago',
                  prefixText: "R\$",
                  hoverColor: Colors.black,
                  focusColor: Colors.black,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: 10),
                ),
              ),
              InkWell(
                onTap: () => _selectDate(context),
                child: IgnorePointer(
                  child: TextFormField(
                    controller: dataPagamentoController,
                    decoration: InputDecoration(
                      labelText: 'Data de Pagamento',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ),
              // buttons -> save + cancel
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // save button
                  MyButton(
                    text: "Cancelar",
                    onPressed: () => Navigator.of(context).pop(),
                    color: 0,
                  ),
                  const SizedBox(width: 20),
                  // cancel button
                  MyButton(
                    text: "Confirmar",
                    onPressed: () {
                      ContaDao().baixar(
                          data_pgto: dataEscolhida,
                          valor_pago: valorPagoController.text.replaceAll(',', '.'),
                          bx: "S",
                          id: widget.id);
                    },
                    color: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class DigitInputFormatter extends TextInputFormatter {
  static const _allowedChars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', ','];

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String filteredValue = '';

    for (int i = 0; i < newValue.text.length; i++) {
      if (_allowedChars.contains(newValue.text[i])) {
        filteredValue += newValue.text[i];
      }
    }

    return TextEditingValue(
      text: filteredValue,
      selection: TextSelection.collapsed(offset: filteredValue.length),
    );
  }
}
