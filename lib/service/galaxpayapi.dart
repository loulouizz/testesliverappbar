import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class GalaxpayAPI {
  static const String url = "https://api.sandbox.cloud.galaxpay.com.br/v2/token";
  static const String galaxID = "5473";
  static const String galaxHash = "83Mw5u8988Qj6fZqS4Z8K7LzOo1j28S706R0BeFe";



  adquirirToken() async {
    List<int> bits = utf8.encode("5473:83Mw5u8988Qj6fZqS4Z8K7LzOo1j28S706R0BeFe");
    String conversao = base64Url.encode(bits);

    var response = await http.post(Uri.parse(url), headers: {"Authorization":"Basic "+ conversao}, body: {
      "grant_type": "authorization_code",
      "scope": "customers.read customers.write plans.read plans.write transactions.read "
          "transactions.write webhooks.write cards.read cards.write card-brands.read "
          "subscriptions.read subscriptions.write charges.read charges.write boletos.read carnes.read"
    });

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  criarCliente(
      String id,
      String nome,
      String documento,
      String email,
      int telefone,
      String cep,
      String rua,
      String numero,
      String? complemento,
      String bairro,
      String cidade,
      String uf) {
    http.post(Uri.parse(url + "/customers"), body: {
      "myId": id,
      "name": nome,
      "document": documento,
      "emails": [email],
      "phones": [telefone],
      "Address": {
        "zipCode": cep,
        "street": rua,
        "number": numero,
        "complement": complemento,
        "neighborhood": bairro,
        "city": cidade,
        "state": uf
      }
    });
  }

  listarCliente(
      String? cpf,
      String? email,
      String? dataCriacaoInicio,
      String? dataCriacaoFinal,
      String? dataCriadoAtualizadoInicio,
      String? dataCriadoAtualizadoFinal,
      String? myIds,
      String? galaxPayids,
      int startAt,
      String? status,
      int limit,
      String? order) {

  }
}
