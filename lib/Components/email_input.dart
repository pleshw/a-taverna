import 'package:flutter/material.dart';

class EmailInput extends StatefulWidget {
  EmailInput(
    this.placeholder, {
    Key key,
        this.controller,
    this.icon,
    this.fontFamily = "Taverna",
    this.mainColor = Colors.black87,
    this.placeholderColor = Colors.black54,
  }) : super(key: key);

  final TextEditingController controller;

  final IconData icon;

  final String placeholder;

  final String fontFamily;

  final Color mainColor;
  final Color placeholderColor;

  @override
  _EmailInputState createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
      textAlign: TextAlign.left,
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
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(value)) return 'Use um email válido.';
      },
    );
  }
}
