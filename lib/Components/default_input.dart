import 'package:flutter/material.dart';


/// Implementa um input com validador padrão para texto requerido no app.
class DefaultInput extends StatefulWidget {
  DefaultInput(
    this.placeholder, {
    Key key,
    this.controller,
    this.icon,
    this.fontFamily = "Taverna",
    this.mainColor = Colors.black87,
    this.placeholderColor = Colors.black54,
        this.keyboard = TextInputType.text,
  }) : super(key: key);

  /// Controlador do texto inserido.
  final TextEditingController controller;

  final TextInputType keyboard;

  /// Icone que é usado no sufixo do input.
  final IconData icon;

  /// Texto mostrando dentro do input antes da inserção de qualquer dado.
  final String placeholder;

  /// Estilização
  final String fontFamily;

  final Color mainColor;
  final Color placeholderColor;

  @override
  _DefaultInputState createState() => _DefaultInputState();
}

class _DefaultInputState extends State<DefaultInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textCapitalization: TextCapitalization.none,
      textAlign: TextAlign.left,
      maxLines: null,
      /** Tipo de teclado usado para a inserção de dado. */
      keyboardType: widget.keyboard,
      /** Decoração */
      decoration: InputDecoration(
        suffixIcon: Icon(widget.icon),
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 15),
        labelText: widget.placeholder,
        labelStyle: TextStyle(
            color: widget.placeholderColor,
            fontFamily: widget.fontFamily,
            letterSpacing: 2,
            fontSize: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      /** Validador */
      validator: (value) {
        if (value.isEmpty)
          return 'O campo de ${widget.placeholder} não pode ficar vazio.';
      },
    );
  }
}
