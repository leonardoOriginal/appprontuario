import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:vida_leve/pages/anamnese_geral.dart';
import 'package:vida_leve/utils/customtextfield.dart';
import 'package:vida_leve/utils/drawer.dart';
import 'package:vida_leve/utils/global.dart';

import '../utils/appbar.dart';

class PerfilPaciente extends StatefulWidget {
  const PerfilPaciente({Key? key}) : super(key: key);

  @override
  _PerfilPacienteState createState() => _PerfilPacienteState();
}

class _PerfilPacienteState extends State<PerfilPaciente> {
  late TextEditingController emailController;
  late TextEditingController nomeCompletoController;
  late TextEditingController dataNascimentoController;
  late TextEditingController idadeController;
  late TextEditingController generoController;
  late TextEditingController profissaoController;
  late TextEditingController estadoCivilController;
  late TextEditingController etniaController;
  late TextEditingController religiaoController;
  late TextEditingController naturalidadeController;
  late TextEditingController enderecoController;
  late TextEditingController complementoController;
  late TextEditingController bairroController;
  late TextEditingController cidadeController;
  late TextEditingController estadoController;
  late TextEditingController telefoneResidencialController;
  late TextEditingController telefoneCelularController;
  late TextEditingController alturaController;
  late TextEditingController pesoController;

  late Map<String, dynamic> pacienteData;
  late bool isEditing;

  Future<Map<String, dynamic>> getPacienteFromFirebase() async {
    final response = await http.get(Uri.parse('https://loginfirebase-fe7e7-default-rtdb.firebaseio.com/pacientes/${Globals.pacienteId}.json'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erro ao obter dados do Firebase. Status code: ${response.statusCode}');
    }
  }

  void initState() {
    super.initState();
    isEditing = false;

    getPacienteFromFirebase().then((paciente) {
      setState(() {
        pacienteData = paciente;
        initializeControllers(pacienteData);
      });
    }).catchError((error) {
      print('Erro ao obter dados do Firebase: $error');
    });
  }

  void initializeControllers(Map<String, dynamic> data) {
    emailController = TextEditingController(text: data['email']);
    nomeCompletoController = TextEditingController(text: data['nomeCompleto']);
    dataNascimentoController = TextEditingController(text: data['dataNascimento']);
    idadeController = TextEditingController(text: data['idade']);
    generoController = TextEditingController(text: data['genero']);
    profissaoController = TextEditingController(text: data['profissao']);
    estadoCivilController = TextEditingController(text: data['estadoCivil']);
    etniaController = TextEditingController(text: data['etnia']);
    religiaoController = TextEditingController(text: data['religiao']);
    naturalidadeController = TextEditingController(text: data['naturalidade']);
    enderecoController = TextEditingController(text: data['endereco']);
    complementoController = TextEditingController(text: data['complemento']);
    bairroController = TextEditingController(text: data['bairro']);
    cidadeController = TextEditingController(text: data['cidade']);
    estadoController = TextEditingController(text: data['estado']);
    telefoneResidencialController = TextEditingController(text: data['telefoneResidencial']);
    telefoneCelularController = TextEditingController(text: data['telefoneCelular']);
    alturaController = TextEditingController(text: data['altura']);
    pesoController = TextEditingController(text: data['peso']);
  }

  void toggleEditing() {
    if (isEditing) {
      // Salvar as alterações no Firebase
      pacienteData['email'] = emailController.text;
      pacienteData['dataNascimento'] = dataNascimentoController.text;
      pacienteData['idade'] = idadeController.text;
      pacienteData['genero'] = generoController.text;
      pacienteData['profissao'] = profissaoController.text;
      pacienteData['estadoCivil'] = estadoCivilController.text;
      pacienteData['etnia'] = etniaController.text;
      pacienteData['religiao'] = religiaoController.text;
      pacienteData['naturalidade'] = naturalidadeController.text;
      pacienteData['endereco'] = enderecoController.text;
      pacienteData['complemento'] = complementoController.text;
      pacienteData['bairro'] = bairroController.text;
      pacienteData['cidade'] = cidadeController.text;
      pacienteData['estado'] = estadoController.text;
      pacienteData['telefoneResidencial'] = telefoneResidencialController.text;
      pacienteData['telefoneCelular'] = telefoneCelularController.text;
      pacienteData['altura'] = alturaController.text;
      pacienteData['peso'] = pesoController.text;

      updatePacienteOnFirebase(pacienteData).then((_) {
        setState(() {
          isEditing = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                'Atualizações salvas',
                textAlign: TextAlign.center,
              ),
              duration: Duration(seconds: 3),
              action: SnackBarAction(
                label: 'X',
                textColor: Colors.white,
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            ),
          );
        });
      }).catchError((error) {
        print('Erro ao atualizar dados no Firebase: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Erro ao salvar as atualizações',
              textAlign: TextAlign.center,
            ),
            duration: Duration(seconds: 3),
            action: SnackBarAction(
              label: 'X',
              textColor: Colors.white,
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
      });
    } else {
      setState(() {
        isEditing = true;
      });
    }
  }

  Future<void> updatePacienteOnFirebase(Map<String, dynamic> pacienteData) async {
    final response = await http.put(
      Uri.parse('https://loginfirebase-fe7e7-default-rtdb.firebaseio.com/pacientes/${Globals.pacienteId}.json'),
      body: json.encode(pacienteData),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao atualizar dados no Firebase. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (pacienteData == null) {
      return Scaffold(
        appBar: MyAppBar(),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      endDrawer: MyDrawer(),
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(pacienteData['foto'].toString()),
                ),
                SizedBox(height: 15),
                Text(
                  pacienteData['nomeCompleto'].toString(),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Informações Pessoais',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Color(0xFF00A896),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomTextField(
                        labelText: "Data de Nascimento",
                        controller: dataNascimentoController,
                        initialValue: getInitialValue(pacienteData, 'dataNascimento'),
                        //enabled: isEditing,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                        labelText: "Idade",
                        controller: idadeController,
                        initialValue: getInitialValue(pacienteData, 'idade'),
                        //enabled: isEditing,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: CustomTextField(
                        labelText: "Naturalidade",
                        controller: naturalidadeController,
                        initialValue: getInitialValue(pacienteData, 'naturalidade'),
                        //enabled: isEditing,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: CustomTextField(
                        labelText: "Gênero",
                        controller: generoController,
                        initialValue: getInitialValue(pacienteData, 'genero'),
                        //enabled: isEditing,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomTextField(
                        labelText: "Etnia",
                        controller: etniaController,
                        initialValue: getInitialValue(pacienteData, 'etnia'),
                        //enabled: isEditing,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                        labelText: "Altura",
                        controller: alturaController,
                        initialValue: getInitialValue(pacienteData, 'altura'),
                        //enabled: isEditing,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                        labelText: "Peso",
                        controller: pesoController,
                        initialValue: getInitialValue(pacienteData, 'peso'),
                        //enabled: isEditing,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                        labelText: "Religião",
                        controller: religiaoController,
                        initialValue: getInitialValue(pacienteData, 'religiao'),
                        //enabled: isEditing,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                        labelText: "Estado civil",
                        controller: estadoCivilController,
                        initialValue: getInitialValue(pacienteData, 'estadoCivil'),
                        //enabled: isEditing,
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  labelText: "Profissões e horário de trabalho",
                  controller: profissaoController,
                  initialValue: getInitialValue(pacienteData, 'profissao'),
                  //enabled: isEditing,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Informações de contato',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Color(0xFF00A896),
                    ),
                  ),
                ),
                CustomTextField(
                  labelText: "Email",
                  controller: emailController,
                  initialValue: getInitialValue(pacienteData, 'email'),
                  //enabled: isEditing,
                ),
                CustomTextField(
                  labelText: "Telefone Residencial",
                  controller: telefoneResidencialController,
                  initialValue: getInitialValue(pacienteData, 'telefoneResidencial'),
                  //enabled: isEditing,
                ),
                CustomTextField(
                  labelText: "Telefone Celular",
                  controller: telefoneCelularController,
                  initialValue: getInitialValue(pacienteData, 'telefoneCelular'),
                  //enabled: isEditing,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Endereço',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Color(0xFF00A896),
                    ),
                  ),
                ),
                CustomTextField(
                  labelText: "Endereço",
                  controller: enderecoController,
                  initialValue: getInitialValue(pacienteData, 'endereco'),
                  //enabled: isEditing,
                ),
                CustomTextField(
                  labelText: "Complemento",
                  controller: complementoController,
                  initialValue: getInitialValue(pacienteData, 'complemento'),
                  //enabled: isEditing,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomTextField(
                        labelText: "Bairro",
                        controller: bairroController,
                        initialValue: getInitialValue(pacienteData, 'bairro'),
                        //enabled: isEditing,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: CustomTextField(
                        labelText: "Cidade",
                        controller: cidadeController,
                        initialValue: getInitialValue(pacienteData, 'cidade'),
                        //enabled: isEditing,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                        labelText: "Estado",
                        controller: estadoController,
                        initialValue: getInitialValue(pacienteData, 'estado'),
                        //enabled: isEditing,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: toggleEditing,
                  child: Text(
                    isEditing ? 'Salvar' : 'Editar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getInitialValue(Map<String, dynamic> data, String field) {
    return data[field] != null ? data[field].toString() : '';
  }
}
