import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  PasswordInput(
    this.placeholder, {
    Key key,
    this.controller,
    this.passwordValidator,
    this.icon,
    this.fontFamily = "Taverna",
    this.mainColor = Colors.black87,
    this.placeholderColor = Colors.black54,
  }) : super(key: key);

  /// String que caracteriza o password como o primário
  /// ou o password a ser confirmado.
  /// Se utilizada essa variável deve receber o texto do password primário.
  final String passwordValidator;

  /// Controlador do texto inserido.
  final TextEditingController controller;

  /// Icone que é usado no sufixo do input.
  final IconData icon;

  /// Texto mostrando dentro do input antes da inserção de qualquer dado.
  final String placeholder;

  /// Estilização
  final String fontFamily;

  final Color mainColor;
  final Color placeholderColor;


  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {

  /// Se o estado dessa variável for mudado para falso
  /// o texto inserido nesse campo será mostrado.
  bool hideText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textCapitalization: TextCapitalization.none,
      textAlign: TextAlign.left,
      /** Tipo de teclado usado */
      keyboardType: TextInputType.text,
      obscureText: hideText,
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
      validator: (value) {
        /** Se vazio */
        if (value.isEmpty) return '${widget.placeholder} não pode ficar vazio.';

        /** Se tamanho menor que 8 */
        if (value.length < 8)
          return '${widget.placeholder} deve ter 8 ou mais caracteres.';

        /** Se for um password de validação e não for igual ao valor primário */
        if( widget.passwordValidator != null )
          if (value != widget.passwordValidator)
            return 'Texto diferente da senha inserida.';

      },
    );
  }
}
