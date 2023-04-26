import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testes_mysql1/screens/list_screen.dart';
import 'package:testes_mysql1/screens/login_screen.dart';
import 'package:testes_mysql1/screens/cliente_search_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //pegando argumentos para quando chamar o navigator.pushnamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/list':
        return MaterialPageRoute(builder: (_) => ListScreen());
        break;
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text("ERROR"),
        ),
      );
    });
  }
}
