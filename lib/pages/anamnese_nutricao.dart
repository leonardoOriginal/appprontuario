import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vida_leve/utils/global.dart';

import '../utils/appbar.dart';
import '../utils/customtextfield.dart';
import '../utils/dados.dart';
import '../utils/drawer.dart';

class AnamneseNutricaoPage extends StatefulWidget {
  const AnamneseNutricaoPage({super.key});

  @override
  State<AnamneseNutricaoPage> createState() => _AnamneseNutricaoPageState();
}

class _AnamneseNutricaoPageState extends State<AnamneseNutricaoPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nomeCompletoController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  TextEditingController fezDietaController = TextEditingController();
  TextEditingController tempoDietaController = TextEditingController();
  TextEditingController tipoDietaController = TextEditingController();
  TextEditingController desistiuDietaController = TextEditingController();
  TextEditingController preferenciaAlimentarController =
      TextEditingController();
  TextEditingController aversaoAlimentarController = TextEditingController();
  TextEditingController alteracoesApetiteController = TextEditingController();
  TextEditingController refeicoesDiaController = TextEditingController();
  TextEditingController tempoRefeicoesController = TextEditingController();
  TextEditingController tomarCafeManhaController = TextEditingController();
  TextEditingController dietaEspecialController = TextEditingController();
  TextEditingController preparoRefeicoesController = TextEditingController();
  TextEditingController localRefeicoesController = TextEditingController();
  TextEditingController intestinoDiarioController = TextEditingController();
  TextEditingController intestinoFrequenciaController = TextEditingController();
  TextEditingController descontroleComidaController = TextEditingController();
  TextEditingController situacaoDescontroleController = TextEditingController();
  TextEditingController consumoDejejunsController = TextEditingController();
  TextEditingController consumoColacaoController = TextEditingController();
  TextEditingController consumoAlmocoController = TextEditingController();
  TextEditingController consumoLancheTardeController = TextEditingController();
  TextEditingController consumoJantarController = TextEditingController();
  TextEditingController consumoCeiaController = TextEditingController();
  TextEditingController intoleranciaAlimentarController =
      TextEditingController();
  TextEditingController consumoCarnesController = TextEditingController();
  TextEditingController consumoIntegraisController = TextEditingController();
  TextEditingController consumoPeixesController = TextEditingController();
  TextEditingController consumoAguaController = TextEditingController();
  TextEditingController consumoBebidasController = TextEditingController();
  TextEditingController energiaController = TextEditingController();
  TextEditingController consumoFrutasController = TextEditingController();
  TextEditingController lancheSaudaveisController = TextEditingController();
  TextEditingController suplementosController = TextEditingController();
  TextEditingController anabolizantesController = TextEditingController();

  final pacienteId = Globals.pacienteId;

  String getInitialValue(Map<String, dynamic> data, String key) {
    return data[key] != null ? data[key].toString() : '';
  }

  void _toggleEditing() {
    if (Globals.isEditing) {
      dados[pacienteId]['email'] = emailController.text;
      dados[pacienteId]['nomeCompleto'] = nomeCompletoController.text;
      dados[pacienteId]['dataNascimento'] = dataNascimentoController.text;
      dados[pacienteId]['peso'] = pesoController.text;
      dados[pacienteId]['altura'] = alturaController.text;
      dados[pacienteId]['fezDieta'] = fezDietaController.text;
      dados[pacienteId]['tempoDieta'] = tempoDietaController.text;
      dados[pacienteId]['tipoDieta'] = tipoDietaController.text;
      dados[pacienteId]['desistiuDieta'] = desistiuDietaController.text;
      dados[pacienteId]['preferenciaAlimentar'] =
          preferenciaAlimentarController.text;
      dados[pacienteId]['aversaoAlimentar'] = aversaoAlimentarController.text;
      dados[pacienteId]['alteracoesApetite'] = alteracoesApetiteController.text;
      dados[pacienteId]['refeicoesDia'] = refeicoesDiaController.text;
      dados[pacienteId]['tempoRefeicoes'] = tempoRefeicoesController.text;
      dados[pacienteId]['tomarCafeManha'] = tomarCafeManhaController.text;
      dados[pacienteId]['dietaEspecial'] = dietaEspecialController.text;
      dados[pacienteId]['preparoRefeicoes'] = preparoRefeicoesController.text;
      dados[pacienteId]['localRefeicoes'] = localRefeicoesController.text;
      dados[pacienteId]['intestinoDiario'] = intestinoDiarioController.text;
      dados[pacienteId]['intestinoFrequencia'] =
          intestinoFrequenciaController.text;
      dados[pacienteId]['descontroleComida'] = descontroleComidaController.text;
      dados[pacienteId]['situacaoDescontrole'] =
          situacaoDescontroleController.text;
      dados[pacienteId]['consumoDejejuns'] = consumoDejejunsController.text;
      dados[pacienteId]['consumoColacao'] = consumoColacaoController.text;
      dados[pacienteId]['consumoAlmoco'] = consumoAlmocoController.text;
      dados[pacienteId]['consumoLancheTarde'] =
          consumoLancheTardeController.text;
      dados[pacienteId]['consumoJantar'] = consumoJantarController.text;
      dados[pacienteId]['consumoCeia'] = consumoCeiaController.text;
      dados[pacienteId]['intoleranciaAlimentar'] =
          intoleranciaAlimentarController.text;
      dados[pacienteId]['consumoCarnes'] = consumoCarnesController.text;
      dados[pacienteId]['consumoIntegrais'] = consumoIntegraisController.text;
      dados[pacienteId]['consumoPeixes'] = consumoPeixesController.text;
      dados[pacienteId]['consumoAgua'] = consumoAguaController.text;
      dados[pacienteId]['consumoBebidas'] = consumoBebidasController.text;
      dados[pacienteId]['energia'] = energiaController.text;
      dados[pacienteId]['consumoFrutas'] = consumoFrutasController.text;
      dados[pacienteId]['lancheSaudaveis'] = lancheSaudaveisController.text;
      dados[pacienteId]['suplementos'] = suplementosController.text;
      dados[pacienteId]['anabolizantes'] = anabolizantesController.text;

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
                    color: Color(0xFF0C8E09)
                        .withOpacity(0.4), // Define o raio para as bordas
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu_book,
                          size: 50,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Nutrição",
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
                            labelText: "Peso",
                            controller: pesoController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'peso'),
                          ),
                          CustomTextField(
                            labelText: "Altura",
                            controller: alturaController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'altura'),
                          ),
                          CustomTextField(
                            labelText: "Fez Alguma dieta?",
                            controller: fezDietaController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'fezDieta'),
                          ),
                          CustomTextField(
                            labelText: "Se sim, há quanto tempo?",
                            controller: tempoDietaController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'tempoDieta'),
                          ),
                          CustomTextField(
                            labelText: "Tipo de dieta que fez",
                            controller: tipoDietaController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'tipodieta'),
                          ),
                          CustomTextField(
                            labelText: "Porque desistiu",
                            controller: desistiuDietaController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'desistiuDieta'),
                          ),
                          CustomTextField(
                            labelText: "Preferência Alimentar",
                            controller: preferenciaAlimentarController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'preferenciaAlimentar'),
                          ),
                          CustomTextField(
                            labelText: "Aversão Alimentar",
                            controller: aversaoAlimentarController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'aversaoAlimentar'),
                          ),
                          CustomTextField(
                            labelText: "Alterações do Apetite",
                            controller: alteracoesApetiteController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'alteracoesApetite'),
                          ),
                          CustomTextField(
                            labelText: "Refeições por dia",
                            controller: refeicoesDiaController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'refeicoesDia'),
                          ),
                          CustomTextField(
                            labelText: "Tem tempo para fazer suas refeições?",
                            controller: tempoRefeicoesController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'tempoRefeicoes'),
                          ),
                          CustomTextField(
                            labelText: "Toma café da manhã diariamente?",
                            controller: tomarCafeManhaController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'tomarCafeManha'),
                          ),
                          CustomTextField(
                            labelText: "Atualmente segue uma dieta especial?",
                            controller: dietaEspecialController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'dietaEspecial'),
                          ),
                          CustomTextField(
                            labelText: "Quem prepara as refeições?",
                            controller: preparoRefeicoesController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'preparoRefeicoes'),
                          ),
                          CustomTextField(
                            labelText: "Onde realiza as refeições?",
                            controller: localRefeicoesController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'localRefeicoes'),
                          ),
                          CustomTextField(
                            labelText: "Seu instestino funciona todos dias?",
                            controller: intestinoDiarioController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'intestinoDiario'),
                          ),
                          CustomTextField(
                            labelText:
                                "Caso não, com qual frequencia funciona?",
                            controller: intestinoFrequenciaController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'intestinoFrequencia'),
                          ),
                          CustomTextField(
                            labelText: "Tem descontrole em relação a comida?",
                            controller: descontroleComidaController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'descontroleComida'),
                          ),
                          CustomTextField(
                            labelText:
                                "Qual situação ou comida que causa isso?",
                            controller: situacaoDescontroleController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'situacaoDescontrole'),
                          ),
                          CustomTextField(
                            labelText: "Como são as refeições de dejejuns?",
                            controller: consumoDejejunsController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'consumoDejejuns'),
                          ),
                          CustomTextField(
                            labelText: "Como são as refeições de colação?",
                            controller: consumoColacaoController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'consumoColacao'),
                          ),
                          CustomTextField(
                            labelText: "Como são as refeições de Almoço?",
                            controller: consumoAlmocoController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'consumoAlmoco'),
                          ),
                          CustomTextField(
                            labelText:
                                "Como são as refeições de Lanche da tarde?",
                            controller: consumoLancheTardeController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'consumoLancheTarde'),
                          ),
                          CustomTextField(
                            labelText: "Como são as refeições de Jantar?",
                            controller: consumoJantarController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'consumoJantar'),
                          ),
                          CustomTextField(
                            labelText: "Como são as refeições de Ceia?",
                            controller: consumoCeiaController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'consumoCeia'),
                          ),
                          CustomTextField(
                            labelText: "Possui intolerância alimentar? Qual?",
                            controller: intoleranciaAlimentarController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'intoleranciaAlimentar'),
                          ),
                          CustomTextField(
                            labelText: "Qual seu consumo diário de água ?",
                            controller: consumoAguaController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'consumoAgua'),
                          ),
                          CustomTextField(
                            labelText: "Qual o consumo de bebidas açucaradas",
                            controller: consumoBebidasController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'consumoBebidas'),
                          ),
                          CustomTextField(
                            labelText:
                                "Possui energia para realizar suas atividades?",
                            controller: energiaController,
                            initialValue:
                                getInitialValue(dados[pacienteId], 'energia'),
                          ),
                          CustomTextField(
                            labelText:
                                "Consumo de frutas, legumes, verduras no dia",
                            controller: consumoFrutasController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'consumoFrutas'),
                          ),
                          CustomTextField(
                            labelText:
                                "Possui habito de fazer lanches saudaveis ",
                            controller: lancheSaudaveisController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'lancheSaudaveis'),
                          ),
                          CustomTextField(
                            labelText: "Você usa suplementos? Quais ?",
                            controller: suplementosController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'suplementos'),
                          ),
                          CustomTextField(
                            labelText: "Você usa anabolizantes? Quais?",
                            controller: anabolizantesController,
                            initialValue: getInitialValue(
                                dados[pacienteId], 'anabolizantes'),
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
