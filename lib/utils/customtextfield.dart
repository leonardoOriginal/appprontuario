import 'package:flutter/material.dart';
import 'package:vida_leve/utils/global.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String initialValue;
  final TextEditingController controller; // Adicionando o parâmetro controller

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.initialValue,
    required this.controller, // Adicionando o parâmetro controller
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
    widget.controller.text =
        widget.initialValue; // Usando o controller para definir o valor inicial
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: TextFormField(
        enabled: Globals.isEditing,
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
