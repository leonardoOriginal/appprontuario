import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vida_leve/pages/anamnese_geral.dart';
import 'package:vida_leve/utils/customtextfield.dart';
import 'package:vida_leve/utils/dados.dart';
import 'package:vida_leve/utils/drawer.dart';
import 'package:vida_leve/utils/global.dart';

import '../utils/appbar.dart';

class PerfilPaciente extends StatefulWidget {
  const PerfilPaciente({super.key});

  @override
  State<PerfilPaciente> createState() => _PerfilPacienteState();
}

class _PerfilPacienteState extends State<PerfilPaciente> {
  final pacienteId = Globals.pacienteId;
  TextEditingController emailController = TextEditingController();
  TextEditingController nomeCompletoController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController generoController = TextEditingController();
  TextEditingController profissaoController = TextEditingController();
  TextEditingController estadoCivilController = TextEditingController();
  TextEditingController etniaController = TextEditingController();
  TextEditingController religiaoController = TextEditingController();
  TextEditingController naturalidadeController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController complementoController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController estadoController = TextEditingController();

  TextEditingController telefoneResidencialController = TextEditingController();
  TextEditingController telefoneCelularController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();

  String getInitialValue(Map<String, dynamic> data, String key) {
    return data[key] != null ? data[key].toString() : '';
  }

  void _toggleEditing() {
    if (Globals.isEditing) {
      dados[pacienteId]['email'] = emailController.text;
      dados[pacienteId]['dataNascimento'] = dataNascimentoController.text;
      dados[pacienteId]['idade'] = idadeController.text;
      dados[pacienteId]['genero'] = generoController.text;
      dados[pacienteId]['profissao'] = profissaoController.text;
      dados[pacienteId]['estadoCivil'] = estadoCivilController.text;
      dados[pacienteId]['etnia'] = etniaController.text;
      dados[pacienteId]['religiao'] = religiaoController.text;
      dados[pacienteId]['naturalidade'] = naturalidadeController.text;
      dados[pacienteId]['endereco'] = enderecoController.text;
      dados[pacienteId]['bairro'] = bairroController.text;
      dados[pacienteId]['cidade'] = cidadeController.text;
            dados[pacienteId]['altura'] = alturaController.text;
      dados[pacienteId]['peso'] = pesoController.text;
      dados[pacienteId]['telefoneResidencial'] =
          telefoneResidencialController.text;
      dados[pacienteId]['telefoneCelular'] = telefoneCelularController.text;
      

      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Atualizações feitas',
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

        Globals.isEditing = false;
      });
    } else {
      setState(() {
        Globals.isEditing = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: MyDrawer(),
        appBar: MyAppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Column(children: [
                CircleAvatar(
                    radius: 45, // Define o raio do avatar
                    backgroundImage:
                        NetworkImage(dados[pacienteId]['foto'].toString())),
                SizedBox(height: 15),
                Text(
                  dados[pacienteId]['nomeCompleto'].toString(),
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
                        initialValue: getInitialValue(
                            dados[pacienteId], 'dataNascimento'),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                        labelText: "Idade",
                        controller: idadeController,
                        initialValue:
                            getInitialValue(dados[pacienteId], 'idade'),
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
                        initialValue:
                            getInitialValue(dados[pacienteId], 'naturalidade'),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: CustomTextField(
                        labelText: "Genero",
                        controller: generoController,
                        initialValue:
                            getInitialValue(dados[pacienteId], 'genero'),
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
                        initialValue:
                            getInitialValue(dados[pacienteId], 'etnia'),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                        labelText: "Altura",
                        controller: alturaController,
                        initialValue:
                            getInitialValue(dados[pacienteId], 'altura'),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                        labelText: "Peso",
                        controller: pesoController,
                        initialValue:
                            getInitialValue(dados[pacienteId], 'peso'),
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
                        initialValue:
                            getInitialValue(dados[pacienteId], 'religiao'),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                        labelText: "Estado civil",
                        controller: estadoCivilController,
                        initialValue:
                            getInitialValue(dados[pacienteId], 'estadoCivil'),
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  labelText: "Profissões e horário de trabalho",
                  controller: profissaoController,
                  initialValue: getInitialValue(dados[pacienteId], 'profissao'),
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
                  initialValue: getInitialValue(dados[pacienteId], 'email'),
                ),
                CustomTextField(
                  labelText: "Telefone Celular",
                  controller: telefoneCelularController,
                  initialValue:
                      getInitialValue(dados[pacienteId], 'telefoneCelular'),
                ),
                
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/anamnese");
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'Anamneses',
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleEditing,
        child: Globals.isEditing ? Icon(Icons.save) : Icon(Icons.edit),
      ),);
  }
}
