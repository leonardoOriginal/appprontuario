import 'package:flutter/material.dart';
import 'package:vida_leve/utils/appbar.dart';
import 'package:vida_leve/utils/drawer.dart';

class CadastroConsulta extends StatefulWidget {
  @override
  _CadastroConsulta createState() => _CadastroConsulta();
}

class _CadastroConsulta extends State<CadastroConsulta> {
  String selectedPatient = 'Paciente 1';

  List<String> patients = [
    'Paciente 1',
    'Paciente 2',
    'Paciente 3',
    'Paciente 4',
    'Paciente 5',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MyDrawer(),
      appBar: MyAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('caminho/para/sua/imagem.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              'Selecionar paciente:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButtonFormField<String>(
                value: selectedPatient,
                onChanged: (newValue) {
                  setState(() {
                    selectedPatient = newValue!;
                  });
                },
                items: patients.map((String patient) {
                  return DropdownMenuItem<String>(
                    value: patient,
                    child: Text(patient),
                  );
                }).toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite o nome do paciente',
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Horário:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite o horário',
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Descrição da consulta:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite a descrição da consulta',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}