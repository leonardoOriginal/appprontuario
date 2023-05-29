import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PerfilPaciente extends StatefulWidget {
  final int id;

  const PerfilPaciente({Key? key, required this.id}) : super(key: key);

  @override
  _PerfilPacienteState createState() => _PerfilPacienteState();
}

class _PerfilPacienteState extends State<PerfilPaciente> {
  Map<String, dynamic>? pacienteData;

  Future<Map<String, dynamic>?> getPacienteDataFromFirebase(int id) async {
    final response = await http.get(Uri.parse('https://loginfirebase-fe7e7-default-rtdb.firebaseio.com/pacientes/$id.json'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data != null && data is Map<String, dynamic>) {
        return data;
      }
    }
    return null;
  }




  @override
  void initState() {
    super.initState();

    getPacienteDataFromFirebase(widget.id)
        .then((pacienteData) {
      setState(() {
        this.pacienteData = pacienteData;
      });
    })
        .catchError((error) {
      print('Erro ao obter dados do paciente do Firebase: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    if (pacienteData == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Perfil do Paciente'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Perfil do Paciente'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nome: ${pacienteData!['nomeCompleto'] ?? 'Dados indisponíveis'}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Idade: ${pacienteData!['idade'] ?? 'Dados indisponíveis'}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Data de Nascimento: ${pacienteData!['dataNascimento'] ?? 'Dados indisponíveis'}',
                  style: const TextStyle(fontSize: 16),
                ),
                // Adicione outras informações do paciente aqui
              ],
            ),
          ),
        ),
      );
    }
  }
}
