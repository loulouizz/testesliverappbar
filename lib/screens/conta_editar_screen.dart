import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:testes_mysql1/Data/conta_dao.dart';
import 'package:validatorless/validatorless.dart';

class ContaEditarScreen extends StatefulWidget {
  String id;
  String data;
  String vencimento;
  String dataPag;
  String valor;
  String tipo;
  String subtipo;
  String fornecedor;
  String descricao;
  String parcela;
  String id_doc;

  ContaEditarScreen(
      {required this.id,
      required this.data,
      required this.vencimento,
      required this.dataPag,
      required this.valor,
      required this.tipo,
      required this.subtipo,
      required this.fornecedor,
      required this.descricao,
      required this.parcela,
      required this.id_doc,
      Key? key})
      : super(key: key);

  @override
  State<ContaEditarScreen> createState() => _ContaEditarScreenState();
}

class _ContaEditarScreenState extends State<ContaEditarScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _showErrorTextValor = false;

  //valor, tipo, subtipo, descricao, parcela, id_doc
  final _valorEC = TextEditingController();
  final _tipoEC = TextEditingController();
  final _subtipoEC = TextEditingController();
  final _descricaoEC = TextEditingController();
  final _parcelaEC = TextEditingController();
  final _idDocEC = TextEditingController();

  String _startDate = "";

  @override
  void dispose() {
    _valorEC.dispose();
    _tipoEC.dispose();
    _subtipoEC.dispose();
    _descricaoEC.dispose();
    _parcelaEC.dispose();
    _idDocEC.dispose();
    super.dispose();
  }


  @override
  void initState() {

    //atribuindo o valor dos campos aos controllers dos TextFormField
    _valorEC.text = widget.valor;
    _tipoEC.text = widget.tipo;
    _subtipoEC.text = widget.subtipo;
    _descricaoEC.text = widget.descricao;
    _parcelaEC.text = widget.parcela;
    _idDocEC.text = widget.id_doc;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
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
          title: Text("Edição",
              style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black)),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                      ? 8.0
                      : 100.0,
                  right: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                      ? 8.0
                      : 200.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Data",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black38)),
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            enabled: false,
                            obscureText: true,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                hoverColor: Colors.black,
                                focusColor: Colors.black,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black,
                                        width: 2.0)),
                                border: OutlineInputBorder(),
                                labelText: "${widget.data}"),
                          ),
                        ),
                        Flexible(
                            child: TextButton(
                                onPressed: () async {
                                  final DateTime? pickedDate =
                                      await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.utc(
                                        int.parse(widget.data
                                            .toString()
                                            .substring(0, 4)),
                                        int.parse(widget.data
                                            .toString()
                                            .substring(5, 7)),
                                        int.parse(widget.data
                                            .toString()
                                            .substring(8, 10))),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime.now(),
                                  );

                                  setState(() {
                                    widget.data = pickedDate.toString();
                                  });
                                },
                                child: Text('Alterar')))
                      ],
                    ),

                    Text("Vencimento",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black38)),
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            enabled: false,
                            obscureText: true,
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
                              labelText: widget.vencimento == "null"
                                  ? "Sem data de pagamento"
                                  : "${widget.vencimento.toString().substring(8, 10)}/${widget.vencimento.toString().substring(5, 7)}/${widget.vencimento.toString().substring(0, 4)}",
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextButton(
                                onPressed: () async {
                                  final DateTime? pickedDate =
                                  await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.utc(
                                        int.parse(widget.vencimento
                                            .toString()
                                            .substring(0, 4)),
                                        int.parse(widget.vencimento
                                            .toString()
                                            .substring(5, 7)),
                                        int.parse(widget.vencimento
                                            .toString()
                                            .substring(8, 10))),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime.now(),
                                  );

                                  setState(() {
                                    widget.vencimento =
                                        pickedDate.toString();
                                  });
                                },
                                child: Text('Alterar')))
                      ],
                    ),


                    Text("Data pagamento",
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black38)),
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            enabled: false,
                            obscureText: true,
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
                              labelText: widget.dataPag == "null"
                                  ? "Sem data de pagamento"
                                  : "${widget.dataPag.toString().substring(8, 10)}/${widget.dataPag.toString().substring(5, 7)}/${widget.dataPag.toString().substring(0, 4)}",
                            ),
                          ),
                        ),
                        Flexible(
                            child: TextButton(
                                onPressed: () async {
                                  final DateTime? pickedDate =
                                  await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.utc(
                                        int.parse(widget.dataPag
                                            .toString()
                                            .substring(0, 4)),
                                        int.parse(widget.dataPag
                                            .toString()
                                            .substring(5, 7)),
                                        int.parse(widget.dataPag
                                            .toString()
                                            .substring(8, 10))),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime.now(),
                                  );

                                  setState(() {
                                    widget.dataPag =
                                        pickedDate.toString();
                                  });
                                },
                                child: Text('Alterar')))
                      ],
                    ),


                    SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Valor",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black38)),
                          TextFormField(
                            validator:(value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo obrigatório';
                              }

                              // Tenta converter o valor para double
                              final double? parsedValue = double.tryParse(value);

                              if (parsedValue == null) {
                                return 'Digite um número válido';
                              }

                              return null;
                            },
                            controller: _valorEC,
                            obscureText: false,
                            enableInteractiveSelection: true,
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
                          SizedBox(height: _showErrorTextValor ? 16 : 0), // Espaço vazio que empurra o próximo TextFormField para baixo

                        ],
                      ),
                    ),

                    SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tipo",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black38)),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo obrigatório';
                              }

                              // Tenta converter o valor para double
                              final double? parsedValue = double.tryParse(value);

                              if (parsedValue == null) {
                                return 'Digite um número válido';
                              }

                              return null;
                            },
                            controller: _tipoEC,
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
                          SizedBox(
                            height: 6,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Subtipo",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black38)),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo obrigatório';
                              }

                              // Tenta converter o valor para double
                              final double? parsedValue = double.tryParse(value);

                              if (parsedValue == null) {
                                return 'Digite um número válido';
                              }

                              return null;
                            },
                            controller: _subtipoEC,
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
                    ),

                    SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Descrição",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black38)),
                          TextField(
                            obscureText: true,
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
                              labelText: "${widget.descricao}",
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Parcela",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black38)),
                          TextField(
                            obscureText: true,
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
                              labelText: "${widget.parcela}",
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ID do documento",
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black38)),
                          TextField(
                            obscureText: true,
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
                              labelText: "${widget.id_doc}",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: ButtonBar(
          alignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Cancelar")),
            ElevatedButton(
                onPressed: () {
                  var formValid = _formKey.currentState?.validate() ?? false;
                },
                child: Text("Confirmar")),
          ],
        ),
      ),
    );
  }
}
