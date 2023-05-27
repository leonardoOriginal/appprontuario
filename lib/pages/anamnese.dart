import 'package:flutter/material.dart';
import 'package:vida_leve/utils/appbar.dart';
import 'package:vida_leve/utils/drawer.dart';
import 'package:vida_leve/pages/pacientes.dart';
import 'package:vida_leve/utils/global.dart';

class AnamnesePage extends StatefulWidget {
  @override
  State<AnamnesePage> createState() => _AnamnesePageState();
}

class _AnamnesePageState extends State<AnamnesePage> {
  void initState() {
    super.initState();
    // Chame a função desejada aqui
    Globals.isEditing = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MyDrawer(),
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 25),
        child: Container(
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Anamnese',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  color: Color(0xFF00A896),
                ),
              ),
              SizedBox(height: 10),
              Divider(
                thickness: 0.5, // Espessura da linha
                color: Color(0xFF00A896), // Cor da linha
              ),
              SizedBox(height: 40),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/anamnese_geral");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF00A896).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(
                                10), // Define o raio para as bordas
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.health_and_safety,
                                size: 70,
                              ),
                              Text("Geral",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: GestureDetector(
                                                onTap: () {
                          Navigator.pushNamed(context, "/anamnese_nutricao");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF0C8E09).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(
                                10), // Define o raio para as bordas
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.menu_book,
                                size: 70,
                              ),
                              Text("Nutrição",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                                                onTap: () {
                          Navigator.pushNamed(context, "/anamnese_psicologia");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF2764FF).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(
                                10), // Define o raio para as bordas
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.psychology,
                                size: 70,
                              ),
                              Text("Psicologia",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: GestureDetector(
                                                onTap: () {
                          Navigator.pushNamed(context, "/anamnese_farmacia");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFAFF00).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(
                                10), // Define o raio para as bordas
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.medication,
                                size: 70,
                              ),
                              Text("Farmácia",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                                                onTap: () {
                          Navigator.pushNamed(context, "/anamnese_educacao_fisica");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF00FF19).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(
                                10), // Define o raio para as bordas
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.pool,
                                size: 70,
                              ),
                              Text("Educação Física",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
