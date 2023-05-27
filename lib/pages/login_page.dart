import 'package:flutter/material.dart';
import 'package:vida_leve/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 168, 150, 100),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Image(
                height: 170.0,
                width: 170.0,
                image: AssetImage('images/logo_vidaleve.png'),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'VIDA LEVE',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Entrar',
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
              const SizedBox(height: 20.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    ' Digite seu email:',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              TextField(
                onChanged: (text) {
                  email = text;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 10.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    ' Digite sua senha:',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              Container(
                child: TextField(
                  onChanged: (text) {
                    senha = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50.0,
                width: 200.0,
                child: FilledButton(
                  onPressed: () {
                    if (email == 'teste@teste.com' && senha == 'teste123') {
                      Navigator.pushReplacementNamed(context, "/home");
                    } else {
                      print('Login invalido');
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
