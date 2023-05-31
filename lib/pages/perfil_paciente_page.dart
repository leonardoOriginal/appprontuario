import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PerfilPaciente extends StatefulWidget {
  final String pacienteId;

  PerfilPaciente({required this.pacienteId});

  @override
  _PerfilPacienteState createState() => _PerfilPacienteState();
}

class _PerfilPacienteState extends State<PerfilPaciente> {
  Map<String, dynamic> paciente = {};

  @override
  void initState() {
    super.initState();
    getPacienteFromFirebase();
  }

  Future<void> getPacienteFromFirebase() async {
    final response = await http.get(
      Uri.parse('https://loginfirebase-fe7e7-default-rtdb.firebaseio.com/pacientes/${widget.pacienteId}.json'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        paciente = data;
      });
    } else {
      throw Exception('Erro ao obter dados do paciente. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Paciente'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nome: ${paciente['nomeCompleto']}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Idade: ${paciente['idade']}',
              style: TextStyle(fontSize: 24),
            ),
            // Restante dos detalhes do paciente...
          ],
        ),
      ),
    );
  }
}
