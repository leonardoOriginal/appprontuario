import 'package:flutter/material.dart';
import 'package:vida_leve/pages/anamnese.dart';
import 'package:vida_leve/pages/anamnese_educacao_fisica.dart';
import 'package:vida_leve/pages/anamnese_farmacia.dart';
import 'package:vida_leve/pages/anamnese_geral.dart';
import 'package:vida_leve/pages/anamnese_nutricao.dart';
import 'package:vida_leve/pages/anamnese_psicologia.dart';
import 'package:vida_leve/pages/cadastro_pacientes.dart';
import 'package:vida_leve/pages/calendar_page.dart';
import 'package:vida_leve/pages/login_page.dart';
import 'package:vida_leve/pages/pacientes.dart';
import 'package:vida_leve/pages/perfil_paciente_page.dart';
import 'package:vida_leve/pages/cadastro_consulta.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'pages/home_page.dart';

void main() async {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData telaPrincipal = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: telaPrincipal.copyWith(
          colorScheme: telaPrincipal.colorScheme.copyWith(
              primary: const Color.fromRGBO(0, 168, 150, 100),
              secondary: const Color.fromRGBO(2, 128, 144, 100))),
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/pacientes": (context) => Pacientes(),
        "/cadastro_pacientes": (context) => CadastroPacientes(),
        "/calendario": (context) => CalendarPage(),
        "/anamnese": (context) => AnamnesePage(),
        "/perfil_paciente": (context) => PerfilPaciente(),
        "/anamnese_geral": (context) => AnamneseGeralPage(),
        "/anamnese_nutricao": (context) => AnamneseNutricaoPage(),
        "/anamnese_psicologia": (context) => AnamnesePsicologiaPage(),
        "/anamnese_farmacia": (context) => AnamneseFarmaciaPage(),
        "/anamnese_educacao_fisica": (context) => AnamneseEducacaoFisicaPage(),
        "/cadastro_consulta": (context) => CadastroConsulta(),
      },
    );
  }
}
