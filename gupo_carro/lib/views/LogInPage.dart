import 'package:flutter/material.dart';
import 'package:gupo_carro/model/CarModel.dart';
import 'package:gupo_carro/shared/CarData.dart';
import 'package:gupo_carro/shared/AppData.dart';
import 'package:gupo_carro/shared/SelecionarServico.dart';

class LogInPage extends StatelessWidget {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  LogInPage({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Car"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: "Login"),
                style: const TextStyle(
                  fontSize: 18,
                ),
                controller:
                _usernameController, //controlador do nosso campo de texto
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: TextField(
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: "Password"),
                style: const TextStyle(
                  fontSize: 18,
                ),
                controller:
                _passwordController, //controlador do nosso campo de texto
              ),
            ),
            ElevatedButton(
              child: const Text("Adicionar"),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () {
                  // save data and change page
              },
            ),
          ],
        ),
      ),
    );
  }
}