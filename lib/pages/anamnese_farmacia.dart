import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vida_leve/utils/global.dart';

import '../utils/appbar.dart';
import '../utils/customtextfield.dart';
import '../utils/dados.dart';
import '../utils/drawer.dart';

class AnamneseFarmaciaPage extends StatefulWidget {
  const AnamneseFarmaciaPage({super.key});

  @override
  State<AnamneseFarmaciaPage> createState() => _AnamneseFarmaciaPageState();
}

class _AnamneseFarmaciaPageState extends State<AnamneseFarmaciaPage> {
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
  TextEditingController bairroController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController telefoneResidencialController = TextEditingController();
  TextEditingController telefoneCelularController = TextEditingController();
  TextEditingController escolaridadeController = TextEditingController();
  TextEditingController trabalhaAtualmenteController = TextEditingController();
  TextEditingController trabalhoAtivoParadoController = TextEditingController();
  TextEditingController habitosController = TextEditingController();
  TextEditingController rendaFamiliarController = TextEditingController();
  TextEditingController pressaoArterialController = TextEditingController();
  TextEditingController frequenciaCardiacaController = TextEditingController();
  TextEditingController glicemiaCapilarController = TextEditingController();
  TextEditingController pulsoController = TextEditingController();
  TextEditingController temperaturaController = TextEditingController();
  TextEditingController saturacaoController = TextEditingController();
  TextEditingController frequenciaRespiratoriaController =
      TextEditingController();
  TextEditingController doresController = TextEditingController();
  TextEditingController queixaPrincipalController = TextEditingController();
  TextEditingController patologiasController = TextEditingController();
  TextEditingController antecedentesController = TextEditingController();
  TextEditingController condicoesGeraisController = TextEditingController();
  TextEditingController marcapassoController = TextEditingController();
  TextEditingController anticoncepcionalController = TextEditingController();
  TextEditingController cicloMenstrualController = TextEditingController();
  TextEditingController gestanteController = TextEditingController();
  TextEditingController filhosController = TextEditingController();
  TextEditingController alergiasController = TextEditingController();
  TextEditingController protesesController = TextEditingController();
  TextEditingController sonoController = TextEditingController();
  TextEditingController funcionamentoIntestinalController =
      TextEditingController();
  TextEditingController eliminacaoFisiologicaController =
      TextEditingController();
  TextEditingController locomocaoController = TextEditingController();
  TextEditingController tendenciaGanhoPesoController = TextEditingController();
  TextEditingController efGeralController = TextEditingController();
  TextEditingController efOlhosController = TextEditingController();
  TextEditingController efPescocoController = TextEditingController();
  TextEditingController estadoHigieneController = TextEditingController();
  TextEditingController fumanteController = TextEditingController();
  TextEditingController frequenciaAlcoolicaController = TextEditingController();

  final pacienteId = Globals.pacienteId;

  String getInitialValue(Map<String, dynamic> data, String key) {
    return data[key] != null ? data[key].toString() : '';
  }

  void _toggleEditing() {
    if (Globals.isEditing) {
      dados[pacienteId]['email'] = emailController.text;
      dados[pacienteId]['nomeCompleto'] = nomeCompletoController.text;
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
      dados[pacienteId]['telefoneResidencial'] =
          telefoneResidencialController.text;
      dados[pacienteId]['telefoneCelular'] = telefoneCelularController.text;
      dados[pacienteId]['escolaridade'] = escolaridadeController.text;
      dados[pacienteId]['trabalhaAtualmente'] =
          trabalhaAtualmenteController.text;
      dados[pacienteId]['trabalhoAtivoParado'] =
          trabalhoAtivoParadoController.text;
      dados[pacienteId]['habitos'] = habitosController.text;
      dados[pacienteId]['rendaFamiliar'] = rendaFamiliarController.text;
      dados[pacienteId]['pressaoArterial'] = pressaoArterialController.text;
      dados[pacienteId]['frequenciaCardiaca'] =
          frequenciaCardiacaController.text;
      dados[pacienteId]['glicemiaCapilar'] = glicemiaCapilarController.text;
      dados[pacienteId]['pulso'] = pulsoController.text;
      dados[pacienteId]['temperatura'] = temperaturaController.text;
      dados[pacienteId]['saturacao'] = saturacaoController.text;
      dados[pacienteId]['frequenciaRespiratoria'] =
          frequenciaRespiratoriaController.text;
      dados[pacienteId]['dores'] = doresController.text;
      dados[pacienteId]['queixaPrincipal'] = queixaPrincipalController.text;
      dados[pacienteId]['patologias'] = patologiasController.text;
      dados[pacienteId]['antecedentes'] = antecedentesController.text;
      dados[pacienteId]['condicoesGerais'] = condicoesGeraisController.text;
      dados[pacienteId]['marcapasso'] = marcapassoController.text;
      dados[pacienteId]['anticoncepcional'] = anticoncepcionalController.text;
      dados[pacienteId]['cicloMenstrual'] = cicloMenstrualController.text;
      dados[pacienteId]['gestante'] = gestanteController.text;
      dados[pacienteId]['filhos'] = filhosController.text;
      dados[pacienteId]['alergias'] = alergiasController.text;
      dados[pacienteId]['proteses'] = protesesController.text;
      dados[pacienteId]['sono'] = sonoController.text;
      dados[pacienteId]['funcionamentoIntestinal'] =
          funcionamentoIntestinalController.text;
      dados[pacienteId]['eliminacaoFisiologica'] =
          eliminacaoFisiologicaController.text;
      dados[pacienteId]['locomocao'] = locomocaoController.text;
      dados[pacienteId]['tendenciaGanhoPeso'] =
          tendenciaGanhoPesoController.text;
      dados[pacienteId]['efGeral'] = efGeralController.text;
      dados[pacienteId]['efOlhos'] = efOlhosController.text;
      dados[pacienteId]['efPescoco'] = efPescocoController.text;
      dados[pacienteId]['estadoHigiene'] = estadoHigieneController.text;
      dados[pacienteId]['fumante'] = fumanteController.text;
      dados[pacienteId]['frequenciaAlcoolica'] =
          frequenciaAlcoolicaController.text;

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
            child: Column(
              children: [
                CircleAvatar(
                  radius: 45, // Define o raio do avatar
                  backgroundImage:
                      NetworkImage(dados[pacienteId]['foto'].toString()),
                ),
                SizedBox(height: 15),
                Text(
                  dados[pacienteId]['nomeCompleto'].toString(),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFAFF00)
                        .withOpacity(0.4), // Define o raio para as bordas
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.medication,
                          size: 50,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Fármacia",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F5FF).withOpacity(0.95),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CustomTextField(
                            labelText: "Email",
                            controller: emailController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'email'),
                          ),
                          CustomTextField(
                            labelText: "Nome Completo",
                            controller: nomeCompletoController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'nomeCompleto'),
                          ),
                          CustomTextField(
                            labelText: "Data de Nascimento",
                            controller: dataNascimentoController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'dataNascimento'),
                          ),
                          CustomTextField(
                            labelText: "Idade",
                            controller: idadeController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'idade'),
                          ),
                          CustomTextField(
                            labelText: "Genero",
                            controller: generoController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'genero'),
                          ),
                          CustomTextField(
                            labelText: "Profissões e horário de trabalho",
                            controller: profissaoController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'profissao'),
                          ),
                          CustomTextField(
                            labelText: "Estado civil",
                            controller: estadoCivilController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'estadoCivil'),
                          ),
                          CustomTextField(
                            labelText: "Etnia",
                            controller: etniaController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'etnia'),
                          ),
                          CustomTextField(
                            labelText: "Religião",
                            controller: religiaoController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'religiao'),
                          ),
                          CustomTextField(
                            labelText: "Naturalidade",
                            controller: naturalidadeController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'naturalidade'),
                          ),
                          CustomTextField(
                            labelText: "Endereço",
                            controller: enderecoController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'endereco'),
                          ),
                          CustomTextField(
                            labelText: "Bairro",
                            controller: bairroController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'bairro'),
                          ),
                          CustomTextField(
                            labelText: "Cidade",
                            controller: cidadeController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'cidade'),
                          ),
                          CustomTextField(
                            labelText: "Telefone Residencial",
                            controller: telefoneResidencialController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'telefoneResidencial'),
                          ),
                          CustomTextField(
                            labelText: "Telefone Celular",
                            controller: telefoneCelularController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'telefoneCelular'),
                          ),
                          CustomTextField(
                            labelText: "Escolaridade",
                            controller: escolaridadeController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'escolaridade'),
                          ),
                          CustomTextField(
                            labelText: "Trabalha Atualmente",
                            controller: trabalhaAtualmenteController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'trabalhaAtualmente'),
                          ),
                          CustomTextField(
                            labelText: "Seu trabalho é ativo ou parado?",
                            controller: trabalhoAtivoParadoController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'trabalhoAtivoParado'),
                          ),
                          CustomTextField(
                            labelText: "Hábitos",
                            controller: habitosController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'Hábitos'),
                          ),
                          CustomTextField(
                            labelText: "Renda Familiar",
                            controller: rendaFamiliarController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'rendaFamiliar'),
                          ),
                          CustomTextField(
                            labelText: "Pressão Arterial",
                            controller: pressaoArterialController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'pressaoArterial'),
                          ),
                          CustomTextField(
                            labelText: "Frequência Cardiaca",
                            controller: frequenciaCardiacaController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'frequenciaCardiaca'),
                          ),
                          CustomTextField(
                            labelText: "Glicemia Capilar",
                            controller: glicemiaCapilarController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'glicemiaCapilar'),
                          ),
                          CustomTextField(
                            labelText: "Pulso",
                            controller: pulsoController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'pulso'),
                          ),
                          CustomTextField(
                            labelText: "Temperatura",
                            controller: temperaturaController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'temperatura'),
                          ),
                          CustomTextField(
                            labelText: "Saturação",
                            controller: saturacaoController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'saturacao'),
                          ),
                          CustomTextField(
                            labelText: "Frequência Respiratória",
                            controller: frequenciaRespiratoriaController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'frequenciaRespiratoria'),
                          ),
                          CustomTextField(
                            labelText: "Possui dor(es) ? Quais ?",
                            controller: doresController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'dores'),
                          ),
                          CustomTextField(
                            labelText: "Queixa principal",
                            controller: queixaPrincipalController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'queixaPrincipal'),
                          ),
                          CustomTextField(
                            labelText:
                                "Patologias pregressas / Cirurgias Anteriores",
                            controller: patologiasController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'patologias'),
                          ),
                          CustomTextField(
                            labelText: "Antecedentes familiares",
                            controller: antecedentesController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'antecedentes'),
                          ),
                          CustomTextField(
                            labelText:
                                "Condições gerais, medicamentos de uso continuo",
                            controller: condicoesGeraisController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'condicoesGerais'),
                          ),
                          CustomTextField(
                            labelText: "Portador de marcapasso ?",
                            controller: marcapassoController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'marcapasso'),
                          ),
                          CustomTextField(
                            labelText: "Faz uso de anticoncepcional ? Qual ?",
                            controller: anticoncepcionalController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'anticoncepcional'),
                          ),
                          CustomTextField(
                            labelText: "Possui ciclo menstrual regular ?",
                            controller: cicloMenstrualController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'cicloMenstrual'),
                          ),
                          CustomTextField(
                            labelText: "Gestante ?",
                            controller: gestanteController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'gestante'),
                          ),
                          CustomTextField(
                            labelText: "Possui filhos ? Quantos ?",
                            controller: filhosController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'filhos'),
                          ),
                          CustomTextField(
                            labelText: "Alergias",
                            controller: alergiasController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'alergias'),
                          ),
                          CustomTextField(
                            labelText: "Uso de próteses",
                            controller: protesesController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'proteses'),
                          ),
                          CustomTextField(
                            labelText: "Sono e Repouso? Horas por dia",
                            controller: sonoController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'sono'),
                          ),
                          CustomTextField(
                            labelText: "Funcionamento intestinal é regular ?",
                            controller: funcionamentoIntestinalController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'funcionamentoIntestinal'),
                          ),
                          CustomTextField(
                            labelText: "Eliminição Fisiológica",
                            controller: eliminacaoFisiologicaController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'eliminacaoFisiologica'),
                          ),
                          CustomTextField(
                            labelText: "Locomoção",
                            controller: locomocaoController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'locomocao'),
                          ),
                          CustomTextField(
                            labelText: "Tendência de ganho de peso",
                            controller: tendenciaGanhoPesoController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'tendenciaGanhoPeso'),
                          ),
                          CustomTextField(
                            labelText: "Exame Fisico: Estado Geral",
                            controller: efGeralController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'efGeral'),
                          ),
                          CustomTextField(
                            labelText: "E F: Olhos, Ouvidos, Boca e Nariz",
                            controller: efOlhosController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'efOlhos'),
                          ),
                          CustomTextField(
                            labelText:
                                "E F: Pescoço, Respiração, Circulação e Pele",
                            controller: efPescocoController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'efPescoco'),
                          ),
                          CustomTextField(
                            labelText: "Estado de higiene",
                            controller: estadoHigieneController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'estadoHigiene'),
                          ),
                          CustomTextField(
                            labelText: "Fumante",
                            controller: fumanteController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'fumante'),
                          ),
                          CustomTextField(
                            labelText:
                                "Sua frequência do uso de bebida alcoólica",
                            controller: frequenciaAlcoolicaController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'frequenciaAlcoolica'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleEditing,
        child: Globals.isEditing ? Icon(Icons.save) : Icon(Icons.edit),
      ),
    );
  }
}
