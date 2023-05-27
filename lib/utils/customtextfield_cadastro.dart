import 'package:flutter/material.dart';

class CustomTextFieldCadastro extends StatefulWidget {
  final String labelText;
  final TextEditingController controller; // Adicionando o parâmetro controller

  const CustomTextFieldCadastro({
    Key? key,
    required this.labelText,
    required this.controller, // Adicionando o parâmetro controller
  }) : super(key: key);

  @override
  _CustomTextFieldCadastroState createState() =>
      _CustomTextFieldCadastroState();
}

class _CustomTextFieldCadastroState extends State<CustomTextFieldCadastro> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: TextFormField(
        controller: widget.controller, // Usando o controller fornecido
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Color(0xFF00A896)),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF00A896)),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF00A896), width: 2.0),
            borderRadius: BorderRadius.circular(10),
          ),
          focusColor: Colors.white,
        ),
      ),
    );
  }
}
