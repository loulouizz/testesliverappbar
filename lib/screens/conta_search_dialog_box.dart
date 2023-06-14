import 'package:flutter/material.dart';
import 'package:testes_mysql1/Data/conta_dao.dart';
import 'package:testes_mysql1/global_var.dart';
import 'package:testes_mysql1/screens/conta_search_screen.dart';

class ContaSearchDialogBox extends StatefulWidget {
  String bx;

  ContaSearchDialogBox(this.bx, {Key? key}) : super(key: key);

  @override
  _ContaSearchDialogBox createState() => _ContaSearchDialogBox();
}

class _ContaSearchDialogBox extends State<ContaSearchDialogBox> {
  final _nameController = TextEditingController();
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Filtro de Pesquisa",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Nome",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Insira o nome",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Filtro pela Data de Vencimento",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "${_startDate.toLocal()}".split(' ')[0],
                    style: TextStyle(fontSize: 18),
                  ),
                  Text("-"),
                  Text(
                    "${_endDate.toLocal()}".split(' ')[0],
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );

                      if (pickedDate != null) {
                        setState(() {
                          _startDate = pickedDate;
                        });
                      }
                    },
                    child: Text("Data inicial"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );

                      if (pickedDate != null) {
                        setState(() {
                          _endDate = pickedDate;
                        });
                      }
                    },
                    child: Text("Data final"),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      //adicionar retorno isSearch false
                      Navigator.of(context).pop([false]);

                    },
                    child: Text("Cancelar"),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      String name = _nameController.text.trim();
                      String startDate =
                          "${_startDate.year}-${_startDate.month}-${_startDate.day}";
                      String endDate =
                          "${_endDate.year}-${_endDate.month}-${_endDate.day}";

                      // Do something with the search filters
                      print("Name: $name");
                      print("Start Date: $startDate");
                      print("End Date: $endDate");

                      //widget.bx == "N" ? contasAPagar = await ContaDao().pesquisarNomeData(name, widget.bx, startDate, endDate) : contasPagas = await ContaDao().pesquisarNomeData(name, widget.bx, startDate, endDate);


                      Navigator.of(context).pop([true, name, startDate, endDate]);
                      // Navigator.of(context).pop();
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ContaSearchScreen(widget.bx)));


                    },
                    child: Text(
                      "Pesquisar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
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
