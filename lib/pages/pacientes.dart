import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vida_leve/pages/anamnese_geral.dart';
import 'package:vida_leve/pages/perfil_paciente_page.dart';
import 'package:vida_leve/utils/appbar.dart';
import 'package:vida_leve/utils/drawer.dart';
import 'package:vida_leve/utils/global.dart';
import 'package:http/http.dart' as http;

class Pacientes extends StatefulWidget {
  @override
  _PacientesState createState() => _PacientesState();
}

class _PacientesState extends State<Pacientes> {
  TextEditingController _searchController =
      TextEditingController(); // Novo controller

  Future<List<dynamic>> getPacientesFromFirebase() async {
    final response = await http.get(Uri.parse('https://loginfirebase-fe7e7-default-rtdb.firebaseio.com/pacientes.json'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> pacientes = [];

      data.forEach((key, value) {
        pacientes.add(value);
      });

      return pacientes;
    } else {
      throw Exception('Erro ao obter dados do Firebase. Status code: ${response.statusCode}');
    }
  }

  void initState() {
    super.initState();
    Globals.isEditing = false;

    getPacientesFromFirebase().then((pacientes) {
      setState(() {
        dados = pacientes;
        filteredPacientes = dados;
      });
    }).catchError((error) {
      print('Erro ao obter pacientes do Firebase: $error');
    });
  }

  @override
  void dispose() {
    _searchController.dispose(); // Certifique-se de descartar o controller
    super.dispose();
  }

  List<dynamic> dados = [];
  List<dynamic> filteredPacientes = []; // Lista de pacientes filtrada

  void filterPacientes(String query) {
    setState(() {
      filteredPacientes = dados.where((paciente) {
        final nome = paciente['nomeCompleto'].toString().toLowerCase();
        return nome.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MyDrawer(),
      appBar: MyAppBar(showBackButton: false),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Pacientes',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Color(0xFF00A896),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromRGBO(0, 168, 150, 100),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      iconSize: 30,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, "/cadastro_pacientes");
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: _searchController, // Atribua o controller ao TextField
              onChanged: filterPacientes,
              decoration: InputDecoration(
                hintText: 'Pesquisar...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPacientes.length, // Use a lista filtrada
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/perfil_paciente');
                    Globals.id =
                        int.parse(filteredPacientes[index]['id']);
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(filteredPacientes[index]
                                        ['foto']
                                    .toString()),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                filteredPacientes[index]['nomeCompleto']
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                filteredPacientes[index]['idade'].toString() +
                                    ' Anos - ' +
                                    filteredPacientes[index]['dataNascimento']
                                        .toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
