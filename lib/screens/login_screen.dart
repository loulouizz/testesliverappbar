import 'package:flutter/material.dart';
import 'package:testes_mysql1/Data/database.dart';
import 'package:testes_mysql1/Data/login.dart';
import 'package:testes_mysql1/screens/initial_screen.dart';
import 'package:testes_mysql1/screens/list_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = false;
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 120),
                child:
                    Icon(Icons.account_box, size: 220.0, color: Colors.black87),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          controller: userController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Usuário',
                              icon: Icon(Icons.person, color: Colors.black54),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Senha',
                            icon: Icon(
                              Icons.lock,
                              color: Colors.black54,
                            ),
                            suffixIcon: GestureDetector(
                              child: Icon(
                                _showPassword == false
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black54,
                              ),
                              onTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                            ),
                          ),
                          obscureText: _showPassword == false ? true : false,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () async {
                      if (await fazerLogin(
                          userController.text, passwordController.text)) {
                        print('login realizado com êxito');
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListScreen()));
                      } else {
                        print('login inválido');
                        return showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              actionsAlignment: MainAxisAlignment.center,
                              alignment: Alignment.center,
                              backgroundColor: Colors.white,
                              title: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 70),
                                child: Text('Login inválido'),
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text(
                                      "Verifique as credenciais",
                                      textWidthBasis:
                                          TextWidthBasis.longestLine,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.deepOrange),
                                  ),
                                  child: const Text('Ok',
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.deepOrange),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.deepOrange)),
                      ),
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size.fromWidth(370),
                      ),
                    ),
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
