import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vida_leve/utils/global.dart';

import '../utils/appbar.dart';
import '../utils/customtextfield.dart';
import '../utils/dados.dart';
import '../utils/drawer.dart';

class AnamnesePsicologiaPage extends StatefulWidget {
  const AnamnesePsicologiaPage({super.key});

  @override
  State<AnamnesePsicologiaPage> createState() => _AnamnesePsicologiaPageState();
}

class _AnamnesePsicologiaPageState extends State<AnamnesePsicologiaPage> {
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

  final id = Globals.id;

  String getInitialValue(Map<String, dynamic> data, String key) {
    return data[key] != null ? data[key].toString() : '';
  }

  void _toggleEditing() {
    if (Globals.isEditing) {
      dados[id]['email'] = emailController.text;
      dados[id]['nomeCompleto'] = nomeCompletoController.text;
      dados[id]['dataNascimento'] = dataNascimentoController.text;
      dados[id]['idade'] = idadeController.text;
      dados[id]['genero'] = generoController.text;
      dados[id]['profissao'] = profissaoController.text;
      dados[id]['estadoCivil'] = estadoCivilController.text;
      dados[id]['etnia'] = etniaController.text;
      dados[id]['religiao'] = religiaoController.text;
      dados[id]['naturalidade'] = naturalidadeController.text;
      dados[id]['endereco'] = enderecoController.text;
      dados[id]['bairro'] = bairroController.text;
      dados[id]['cidade'] = cidadeController.text;
      dados[id]['telefoneResidencial'] =
          telefoneResidencialController.text;
      dados[id]['telefoneCelular'] = telefoneCelularController.text;
      dados[id]['escolaridade'] = escolaridadeController.text;
      dados[id]['trabalhaAtualmente'] =
          trabalhaAtualmenteController.text;
      dados[id]['trabalhoAtivoParado'] =
          trabalhoAtivoParadoController.text;
      dados[id]['habitos'] = habitosController.text;
      dados[id]['rendaFamiliar'] = rendaFamiliarController.text;
      dados[id]['pressaoArterial'] = pressaoArterialController.text;
      dados[id]['frequenciaCardiaca'] =
          frequenciaCardiacaController.text;
      dados[id]['glicemiaCapilar'] = glicemiaCapilarController.text;
      dados[id]['pulso'] = pulsoController.text;
      dados[id]['temperatura'] = temperaturaController.text;
      dados[id]['saturacao'] = saturacaoController.text;
      dados[id]['frequenciaRespiratoria'] =
          frequenciaRespiratoriaController.text;
      dados[id]['dores'] = doresController.text;
      dados[id]['queixaPrincipal'] = queixaPrincipalController.text;
      dados[id]['patologias'] = patologiasController.text;
      dados[id]['antecedentes'] = antecedentesController.text;
      dados[id]['condicoesGerais'] = condicoesGeraisController.text;
      dados[id]['marcapasso'] = marcapassoController.text;
      dados[id]['anticoncepcional'] = anticoncepcionalController.text;
      dados[id]['cicloMenstrual'] = cicloMenstrualController.text;
      dados[id]['gestante'] = gestanteController.text;
      dados[id]['filhos'] = filhosController.text;
      dados[id]['alergias'] = alergiasController.text;
      dados[id]['proteses'] = protesesController.text;
      dados[id]['sono'] = sonoController.text;
      dados[id]['funcionamentoIntestinal'] =
          funcionamentoIntestinalController.text;
      dados[id]['eliminacaoFisiologica'] =
          eliminacaoFisiologicaController.text;
      dados[id]['locomocao'] = locomocaoController.text;
      dados[id]['tendenciaGanhoPeso'] =
          tendenciaGanhoPesoController.text;
      dados[id]['efGeral'] = efGeralController.text;
      dados[id]['efOlhos'] = efOlhosController.text;
      dados[id]['efPescoco'] = efPescocoController.text;
      dados[id]['estadoHigiene'] = estadoHigieneController.text;
      dados[id]['fumante'] = fumanteController.text;
      dados[id]['frequenciaAlcoolica'] =
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
                      NetworkImage(dados[id]['foto'].toString()),
                ),
                SizedBox(height: 15),
                Text(
                  dados[id]['nomeCompleto'].toString(),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF2764FF)
                        .withOpacity(0.4), // Define o raio para as bordas
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.psychology,
                          size: 50,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Psicologia",
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
                                getInitialValue(dados[id], 'email'),
                          ),
                          CustomTextField(
                            labelText: "Nome Completo",
                            controller: nomeCompletoController,
                            initialValue: getInitialValue(
                                dados[id], 'nomeCompleto'),
                          ),
                          CustomTextField(
                            labelText: "Data de Nascimento",
                            controller: dataNascimentoController,
                            initialValue: getInitialValue(
                                dados[id], 'dataNascimento'),
                          ),
                          CustomTextField(
                            labelText: "Idade",
                            controller: idadeController,
                            initialValue:
                                getInitialValue(dados[id], 'idade'),
                          ),
                          CustomTextField(
                            labelText: "Genero",
                            controller: generoController,
                            initialValue:
                                getInitialValue(dados[id], 'genero'),
                          ),
                          CustomTextField(
                            labelText: "Profissões e horário de trabalho",
                            controller: profissaoController,
                            initialValue:
                                getInitialValue(dados[id], 'profissao'),
                          ),
                          CustomTextField(
                            labelText: "Estado civil",
                            controller: estadoCivilController,
                            initialValue: getInitialValue(
                                dados[id], 'estadoCivil'),
                          ),
                          CustomTextField(
                            labelText: "Etnia",
                            controller: etniaController,
                            initialValue:
                                getInitialValue(dados[id], 'etnia'),
                          ),
                          CustomTextField(
                            labelText: "Religião",
                            controller: religiaoController,
                            initialValue:
                                getInitialValue(dados[id], 'religiao'),
                          ),
                          CustomTextField(
                            labelText: "Naturalidade",
                            controller: naturalidadeController,
                            initialValue: getInitialValue(
                                dados[id], 'naturalidade'),
                          ),
                          CustomTextField(
                            labelText: "Endereço",
                            controller: enderecoController,
                            initialValue:
                                getInitialValue(dados[id], 'endereco'),
                          ),
                          CustomTextField(
                            labelText: "Bairro",
                            controller: bairroController,
                            initialValue:
                                getInitialValue(dados[id], 'bairro'),
                          ),
                          CustomTextField(
                            labelText: "Cidade",
                            controller: cidadeController,
                            initialValue:
                                getInitialValue(dados[id], 'cidade'),
                          ),
                          CustomTextField(
                            labelText: "Telefone Residencial",
                            controller: telefoneResidencialController,
                            initialValue: getInitialValue(
                                dados[id], 'telefoneResidencial'),
                          ),
                          CustomTextField(
                            labelText: "Telefone Celular",
                            controller: telefoneCelularController,
                            initialValue: getInitialValue(
                                dados[id], 'telefoneCelular'),
                          ),
                          CustomTextField(
                            labelText: "Escolaridade",
                            controller: escolaridadeController,
                            initialValue: getInitialValue(
                                dados[id], 'escolaridade'),
                          ),
                          CustomTextField(
                            labelText: "Trabalha Atualmente",
                            controller: trabalhaAtualmenteController,
                            initialValue: getInitialValue(
                                dados[id], 'trabalhaAtualmente'),
                          ),
                          CustomTextField(
                            labelText: "Seu trabalho é ativo ou parado?",
                            controller: trabalhoAtivoParadoController,
                            initialValue: getInitialValue(
                                dados[id], 'trabalhoAtivoParado'),
                          ),
                          CustomTextField(
                            labelText: "Hábitos",
                            controller: habitosController,
                            initialValue:
                                getInitialValue(dados[id], 'Hábitos'),
                          ),
                          CustomTextField(
                            labelText: "Renda Familiar",
                            controller: rendaFamiliarController,
                            initialValue: getInitialValue(
                                dados[id], 'rendaFamiliar'),
                          ),
                          CustomTextField(
                            labelText: "Pressão Arterial",
                            controller: pressaoArterialController,
                            initialValue: getInitialValue(
                                dados[id], 'pressaoArterial'),
                          ),
                          CustomTextField(
                            labelText: "Frequência Cardiaca",
                            controller: frequenciaCardiacaController,
                            initialValue: getInitialValue(
                                dados[id], 'frequenciaCardiaca'),
                          ),
                          CustomTextField(
                            labelText: "Glicemia Capilar",
                            controller: glicemiaCapilarController,
                            initialValue: getInitialValue(
                                dados[id], 'glicemiaCapilar'),
                          ),
                          CustomTextField(
                            labelText: "Pulso",
                            controller: pulsoController,
                            initialValue:
                                getInitialValue(dados[id], 'pulso'),
                          ),
                          CustomTextField(
                            labelText: "Temperatura",
                            controller: temperaturaController,
                            initialValue: getInitialValue(
                                dados[id], 'temperatura'),
                          ),
                          CustomTextField(
                            labelText: "Saturação",
                            controller: saturacaoController,
                            initialValue:
                                getInitialValue(dados[id], 'saturacao'),
                          ),
                          CustomTextField(
                            labelText: "Frequência Respiratória",
                            controller: frequenciaRespiratoriaController,
                            initialValue: getInitialValue(
                                dados[id], 'frequenciaRespiratoria'),
                          ),
                          CustomTextField(
                            labelText: "Possui dor(es) ? Quais ?",
                            controller: doresController,
                            initialValue:
                                getInitialValue(dados[id], 'dores'),
                          ),
                          CustomTextField(
                            labelText: "Queixa principal",
                            controller: queixaPrincipalController,
                            initialValue: getInitialValue(
                                dados[id], 'queixaPrincipal'),
                          ),
                          CustomTextField(
                            labelText:
                                "Patologias pregressas / Cirurgias Anteriores",
                            controller: patologiasController,
                            initialValue: getInitialValue(
                                dados[id], 'patologias'),
                          ),
                          CustomTextField(
                            labelText: "Antecedentes familiares",
                            controller: antecedentesController,
                            initialValue: getInitialValue(
                                dados[id], 'antecedentes'),
                          ),
                          CustomTextField(
                            labelText:
                                "Condições gerais, medicamentos de uso continuo",
                            controller: condicoesGeraisController,
                            initialValue: getInitialValue(
                                dados[id], 'condicoesGerais'),
                          ),
                          CustomTextField(
                            labelText: "Portador de marcapasso ?",
                            controller: marcapassoController,
                            initialValue: getInitialValue(
                                dados[id], 'marcapasso'),
                          ),
                          CustomTextField(
                            labelText: "Faz uso de anticoncepcional ? Qual ?",
                            controller: anticoncepcionalController,
                            initialValue: getInitialValue(
                                dados[id], 'anticoncepcional'),
                          ),
                          CustomTextField(
                            labelText: "Possui ciclo menstrual regular ?",
                            controller: cicloMenstrualController,
                            initialValue: getInitialValue(
                                dados[id], 'cicloMenstrual'),
                          ),
                          CustomTextField(
                            labelText: "Gestante ?",
                            controller: gestanteController,
                            initialValue:
                                getInitialValue(dados[id], 'gestante'),
                          ),
                          CustomTextField(
                            labelText: "Possui filhos ? Quantos ?",
                            controller: filhosController,
                            initialValue:
                                getInitialValue(dados[id], 'filhos'),
                          ),
                          CustomTextField(
                            labelText: "Alergias",
                            controller: alergiasController,
                            initialValue:
                                getInitialValue(dados[id], 'alergias'),
                          ),
                          CustomTextField(
                            labelText: "Uso de próteses",
                            controller: protesesController,
                            initialValue:
                                getInitialValue(dados[id], 'proteses'),
                          ),
                          CustomTextField(
                            labelText: "Sono e Repouso? Horas por dia",
                            controller: sonoController,
                            initialValue:
                                getInitialValue(dados[id], 'sono'),
                          ),
                          CustomTextField(
                            labelText: "Funcionamento intestinal é regular ?",
                            controller: funcionamentoIntestinalController,
                            initialValue: getInitialValue(
                                dados[id], 'funcionamentoIntestinal'),
                          ),
                          CustomTextField(
                            labelText: "Eliminição Fisiológica",
                            controller: eliminacaoFisiologicaController,
                            initialValue: getInitialValue(
                                dados[id], 'eliminacaoFisiologica'),
                          ),
                          CustomTextField(
                            labelText: "Locomoção",
                            controller: locomocaoController,
                            initialValue:
                                getInitialValue(dados[id], 'locomocao'),
                          ),
                          CustomTextField(
                            labelText: "Tendência de ganho de peso",
                            controller: tendenciaGanhoPesoController,
                            initialValue: getInitialValue(
                                dados[id], 'tendenciaGanhoPeso'),
                          ),
                          CustomTextField(
                            labelText: "Exame Fisico: Estado Geral",
                            controller: efGeralController,
                            initialValue:
                                getInitialValue(dados[id], 'efGeral'),
                          ),
                          CustomTextField(
                            labelText: "E F: Olhos, Ouvidos, Boca e Nariz",
                            controller: efOlhosController,
                            initialValue:
                                getInitialValue(dados[id], 'efOlhos'),
                          ),
                          CustomTextField(
                            labelText:
                                "E F: Pescoço, Respiração, Circulação e Pele",
                            controller: efPescocoController,
                            initialValue:
                                getInitialValue(dados[id], 'efPescoco'),
                          ),
                          CustomTextField(
                            labelText: "Estado de higiene",
                            controller: estadoHigieneController,
                            initialValue: getInitialValue(
                                dados[id], 'estadoHigiene'),
                          ),
                          CustomTextField(
                            labelText: "Fumante",
                            controller: fumanteController,
                            initialValue:
                                getInitialValue(dados[id], 'fumante'),
                          ),
                          CustomTextField(
                            labelText:
                                "Sua frequência do uso de bebida alcoólica",
                            controller: frequenciaAlcoolicaController,
                            initialValue: getInitialValue(
                                dados[id], 'frequenciaAlcoolica'),
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
