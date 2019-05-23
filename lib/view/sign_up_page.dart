import 'package:a_taverna/Components/default_input.dart';
import 'package:a_taverna/Components/password_input.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({
    Key key,
    this.image,
    this.backgroundColor,
    this.buttonColor,
    this.buttonFontColor = Colors.white,
    this.placeholderColor = Colors.black38,
  }) : super(key: key);

  /// Imagem principal
  final AssetImage image;

  /// Cores de fonte e background.
  final Color backgroundColor;
  final Color buttonColor;
  final Color buttonFontColor;
  final Color placeholderColor;

  /// Estilos de fonte da página.
  final String medievalFont = "Taverna";
  final String cinzelFont = "Cinzel";
  final String cinzelDecorative = "CinzelDecorative";

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

/// Armazena e define o valor inicial do dropdown
String dropdownValue = '@gmail.com';

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  /// Controladores de texto dos campos de inserção de dados.
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    /// Limpa os controladores quando a janela sai da arvore de navegação.
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              /** Imagem principal */
              Container(
                margin: EdgeInsets.only(top: 65, bottom: 0),
                child: Image(
                  width: 150,
                  image: widget.image,
                ),
              ),

              /** Formulário */
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        child: DefaultInput(
                          "Usuário",
                          placeholderColor: widget.placeholderColor,
                          controller: usernameController,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: PasswordInput(
                          "Senha",
                          placeholderColor: widget.placeholderColor,
                          controller: passwordController,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: PasswordInput(
                          "Confirmar Senha",
                          placeholderColor: widget.placeholderColor,
                          controller: confirmPasswordController,
                          passwordValidator: passwordController.text,
                        ),
                      ),
                      /** Campo contendo email e dropdown com o `@servidor.com`. */
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: Row(children: <Widget>[
                          Container(
                            width: 150,
                            margin: EdgeInsets.only(right: 20),
                            child: DefaultInput(
                              "Email",
                              placeholderColor: widget.placeholderColor,
                              controller: emailController,
                            ),
                          ),
                          Container(
                            width: 140,
                            child: DropdownButton<String>(
                              isDense: true,
                              isExpanded: true,
                              iconSize: 28,
                              value: dropdownValue,
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              style: TextStyle(
                                fontFamily: widget.medievalFont,
                                fontSize: 25,
                                color: widget.placeholderColor,
                                letterSpacing: 0.5,
                              ),
                              items: <String>[
                                '@gmail.com',
                                '@hotmail.com',
                                '@outlook.com',
                                '@yahoo.com'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ]),
                      ),

                      /** Botão para validação */
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 80),
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(vertical: 13),
                          color: widget.buttonColor,
                          onPressed: () {
                            /** Se o formulário for validado de acordo com os
                             * validadores de cada campo */
                            if (_formKey.currentState.validate()) {
                              print(usernameController.text);
                              print(passwordController.text);
                              print(confirmPasswordController.text);
                              print(emailController.text+dropdownValue);
                            }else
                              _formKey.currentState.save();
                          },
                          child: Text(
                            'Cadastre-se',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: widget.cinzelDecorative,
                              color: widget.buttonFontColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
