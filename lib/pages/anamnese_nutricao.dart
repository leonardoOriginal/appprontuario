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

  final id = Globals.id;

  String getInitialValue(Map<String, dynamic> data, String key) {
    return data[key] != null ? data[key].toString() : '';
  }

  void _toggleEditing() {
    if (Globals.isEditing) {
      dados[id]['email'] = emailController.text;
      dados[id]['nomeCompleto'] = nomeCompletoController.text;
      dados[id]['dataNascimento'] = dataNascimentoController.text;
      dados[id]['peso'] = pesoController.text;
      dados[id]['altura'] = alturaController.text;
      dados[id]['fezDieta'] = fezDietaController.text;
      dados[id]['tempoDieta'] = tempoDietaController.text;
      dados[id]['tipoDieta'] = tipoDietaController.text;
      dados[id]['desistiuDieta'] = desistiuDietaController.text;
      dados[id]['preferenciaAlimentar'] =
          preferenciaAlimentarController.text;
      dados[id]['aversaoAlimentar'] = aversaoAlimentarController.text;
      dados[id]['alteracoesApetite'] = alteracoesApetiteController.text;
      dados[id]['refeicoesDia'] = refeicoesDiaController.text;
      dados[id]['tempoRefeicoes'] = tempoRefeicoesController.text;
      dados[id]['tomarCafeManha'] = tomarCafeManhaController.text;
      dados[id]['dietaEspecial'] = dietaEspecialController.text;
      dados[id]['preparoRefeicoes'] = preparoRefeicoesController.text;
      dados[id]['localRefeicoes'] = localRefeicoesController.text;
      dados[id]['intestinoDiario'] = intestinoDiarioController.text;
      dados[id]['intestinoFrequencia'] =
          intestinoFrequenciaController.text;
      dados[id]['descontroleComida'] = descontroleComidaController.text;
      dados[id]['situacaoDescontrole'] =
          situacaoDescontroleController.text;
      dados[id]['consumoDejejuns'] = consumoDejejunsController.text;
      dados[id]['consumoColacao'] = consumoColacaoController.text;
      dados[id]['consumoAlmoco'] = consumoAlmocoController.text;
      dados[id]['consumoLancheTarde'] =
          consumoLancheTardeController.text;
      dados[id]['consumoJantar'] = consumoJantarController.text;
      dados[id]['consumoCeia'] = consumoCeiaController.text;
      dados[id]['intoleranciaAlimentar'] =
          intoleranciaAlimentarController.text;
      dados[id]['consumoCarnes'] = consumoCarnesController.text;
      dados[id]['consumoIntegrais'] = consumoIntegraisController.text;
      dados[id]['consumoPeixes'] = consumoPeixesController.text;
      dados[id]['consumoAgua'] = consumoAguaController.text;
      dados[id]['consumoBebidas'] = consumoBebidasController.text;
      dados[id]['energia'] = energiaController.text;
      dados[id]['consumoFrutas'] = consumoFrutasController.text;
      dados[id]['lancheSaudaveis'] = lancheSaudaveisController.text;
      dados[id]['suplementos'] = suplementosController.text;
      dados[id]['anabolizantes'] = anabolizantesController.text;

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
                            labelText: "Peso",
                            controller: pesoController,
                            initialValue:
                                getInitialValue(dados[id], 'peso'),
                          ),
                          CustomTextField(
                            labelText: "Altura",
                            controller: alturaController,
                            initialValue:
                                getInitialValue(dados[id], 'altura'),
                          ),
                          CustomTextField(
                            labelText: "Fez Alguma dieta?",
                            controller: fezDietaController,
                            initialValue:
                                getInitialValue(dados[id], 'fezDieta'),
                          ),
                          CustomTextField(
                            labelText: "Se sim, há quanto tempo?",
                            controller: tempoDietaController,
                            initialValue: getInitialValue(
                                dados[id], 'tempoDieta'),
                          ),
                          CustomTextField(
                            labelText: "Tipo de dieta que fez",
                            controller: tipoDietaController,
                            initialValue:
                                getInitialValue(dados[id], 'tipodieta'),
                          ),
                          CustomTextField(
                            labelText: "Porque desistiu",
                            controller: desistiuDietaController,
                            initialValue: getInitialValue(
                                dados[id], 'desistiuDieta'),
                          ),
                          CustomTextField(
                            labelText: "Preferência Alimentar",
                            controller: preferenciaAlimentarController,
                            initialValue: getInitialValue(
                                dados[id], 'preferenciaAlimentar'),
                          ),
                          CustomTextField(
                            labelText: "Aversão Alimentar",
                            controller: aversaoAlimentarController,
                            initialValue: getInitialValue(
                                dados[id], 'aversaoAlimentar'),
                          ),
                          CustomTextField(
                            labelText: "Alterações do Apetite",
                            controller: alteracoesApetiteController,
                            initialValue: getInitialValue(
                                dados[id], 'alteracoesApetite'),
                          ),
                          CustomTextField(
                            labelText: "Refeições por dia",
                            controller: refeicoesDiaController,
                            initialValue: getInitialValue(
                                dados[id], 'refeicoesDia'),
                          ),
                          CustomTextField(
                            labelText: "Tem tempo para fazer suas refeições?",
                            controller: tempoRefeicoesController,
                            initialValue: getInitialValue(
                                dados[id], 'tempoRefeicoes'),
                          ),
                          CustomTextField(
                            labelText: "Toma café da manhã diariamente?",
                            controller: tomarCafeManhaController,
                            initialValue: getInitialValue(
                                dados[id], 'tomarCafeManha'),
                          ),
                          CustomTextField(
                            labelText: "Atualmente segue uma dieta especial?",
                            controller: dietaEspecialController,
                            initialValue: getInitialValue(
                                dados[id], 'dietaEspecial'),
                          ),
                          CustomTextField(
                            labelText: "Quem prepara as refeições?",
                            controller: preparoRefeicoesController,
                            initialValue: getInitialValue(
                                dados[id], 'preparoRefeicoes'),
                          ),
                          CustomTextField(
                            labelText: "Onde realiza as refeições?",
                            controller: localRefeicoesController,
                            initialValue: getInitialValue(
                                dados[id], 'localRefeicoes'),
                          ),
                          CustomTextField(
                            labelText: "Seu instestino funciona todos dias?",
                            controller: intestinoDiarioController,
                            initialValue: getInitialValue(
                                dados[id], 'intestinoDiario'),
                          ),
                          CustomTextField(
                            labelText:
                                "Caso não, com qual frequencia funciona?",
                            controller: intestinoFrequenciaController,
                            initialValue: getInitialValue(
                                dados[id], 'intestinoFrequencia'),
                          ),
                          CustomTextField(
                            labelText: "Tem descontrole em relação a comida?",
                            controller: descontroleComidaController,
                            initialValue: getInitialValue(
                                dados[id], 'descontroleComida'),
                          ),
                          CustomTextField(
                            labelText:
                                "Qual situação ou comida que causa isso?",
                            controller: situacaoDescontroleController,
                            initialValue: getInitialValue(
                                dados[id], 'situacaoDescontrole'),
                          ),
                          CustomTextField(
                            labelText: "Como são as refeições de dejejuns?",
                            controller: consumoDejejunsController,
                            initialValue: getInitialValue(
                                dados[id], 'consumoDejejuns'),
                          ),
                          CustomTextField(
                            labelText: "Como são as refeições de colação?",
                            controller: consumoColacaoController,
                            initialValue: getInitialValue(
                                dados[id], 'consumoColacao'),
                          ),
                          CustomTextField(
                            labelText: "Como são as refeições de Almoço?",
                            controller: consumoAlmocoController,
                            initialValue: getInitialValue(
                                dados[id], 'consumoAlmoco'),
                          ),
                          CustomTextField(
                            labelText:
                                "Como são as refeições de Lanche da tarde?",
                            controller: consumoLancheTardeController,
                            initialValue: getInitialValue(
                                dados[id], 'consumoLancheTarde'),
                          ),
                          CustomTextField(
                            labelText: "Como são as refeições de Jantar?",
                            controller: consumoJantarController,
                            initialValue: getInitialValue(
                                dados[id], 'consumoJantar'),
                          ),
                          CustomTextField(
                            labelText: "Como são as refeições de Ceia?",
                            controller: consumoCeiaController,
                            initialValue: getInitialValue(
                                dados[id], 'consumoCeia'),
                          ),
                          CustomTextField(
                            labelText: "Possui intolerância alimentar? Qual?",
                            controller: intoleranciaAlimentarController,
                            initialValue: getInitialValue(
                                dados[id], 'intoleranciaAlimentar'),
                          ),
                          CustomTextField(
                            labelText: "Qual seu consumo diário de água ?",
                            controller: consumoAguaController,
                            initialValue: getInitialValue(
                                dados[id], 'consumoAgua'),
                          ),
                          CustomTextField(
                            labelText: "Qual o consumo de bebidas açucaradas",
                            controller: consumoBebidasController,
                            initialValue: getInitialValue(
                                dados[id], 'consumoBebidas'),
                          ),
                          CustomTextField(
                            labelText:
                                "Possui energia para realizar suas atividades?",
                            controller: energiaController,
                            initialValue:
                                getInitialValue(dados[id], 'energia'),
                          ),
                          CustomTextField(
                            labelText:
                                "Consumo de frutas, legumes, verduras no dia",
                            controller: consumoFrutasController,
                            initialValue: getInitialValue(
                                dados[id], 'consumoFrutas'),
                          ),
                          CustomTextField(
                            labelText:
                                "Possui habito de fazer lanches saudaveis ",
                            controller: lancheSaudaveisController,
                            initialValue: getInitialValue(
                                dados[id], 'lancheSaudaveis'),
                          ),
                          CustomTextField(
                            labelText: "Você usa suplementos? Quais ?",
                            controller: suplementosController,
                            initialValue: getInitialValue(
                                dados[id], 'suplementos'),
                          ),
                          CustomTextField(
                            labelText: "Você usa anabolizantes? Quais?",
                            controller: anabolizantesController,
                            initialValue: getInitialValue(
                                dados[id], 'anabolizantes'),
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
