import 'package:flutter/material.dart';
import 'package:testes_mysql1/components/cliente.dart';
import 'package:testes_mysql1/global_var.dart';

class ClienteSearchScreen extends StatefulWidget {
  late List<Cliente> clientes;
  late int ativo;


  ClienteSearchScreen(this.clientes, this.ativo, {Key? key}) : super(key: key);

  @override
  State<ClienteSearchScreen> createState() => _ClienteSearchScreenState();
}

class _ClienteSearchScreenState extends State<ClienteSearchScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: TextField(
              controller: searchController,
              onChanged: searchCliente,
              decoration: InputDecoration(
                hintText: "Pesquisa",
                fillColor: Colors.blue[100],
                filled: true
              ),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: widget.clientes.length,
            itemBuilder: (context, index){
            return SafeArea(child: widget.clientes.elementAt(index));
          }),
      ),
    );
  }

  void searchCliente(String query){
    final List<Cliente> listainicial = widget.ativo == 0 ? activeClients : inactiveClients;

    final suggestions = listainicial.where((cliente) {
      return cliente.fantasia.contains(query.toUpperCase());
    }).toList();

    setState(() => widget.clientes = suggestions);

  }
}



