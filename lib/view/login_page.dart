import 'package:a_taverna/Components/default_input.dart';
import 'package:a_taverna/Components/password_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key key,
    this.image,
    this.backgroundColor,
    this.buttonColor,
    this.buttonFontColor = Colors.white,
    this.placeholderColor = Colors.black38,
  }) : super(key: key);

  /// Imagem principal [Logo]
  final AssetImage image;

  /// Cores de background e fontes
  final Color backgroundColor;
  final Color buttonColor;
  final Color buttonFontColor;
  final Color placeholderColor;

  /// Fontes da página.
  final String medievalFont = "Taverna";
  final String cinzelFont = "Cinzel";
  final String cinzelDecorative = "CinzelDecorative";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  /// Chave do formulário.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            /** Logo */
            Container(
              margin: EdgeInsets.only(top: 120, bottom: 20),
              child: Image(
                width: 110,
                image: widget.image,
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 35),
                children: <Widget>[
                  /** Formulário */
                  Form(
                    key: _formKey,
                    child: Container(
                      width: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          /** Campos de usuário e senha */
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 25),
                            child: DefaultInput(
                              "Usuário",
                              icon: Icons.people,
                              placeholderColor: widget.placeholderColor,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 25),
                            child: PasswordInput(
                              "Senha",
                              icon: Icons.vpn_key,
                              placeholderColor: widget.placeholderColor,
                            ),
                          ),
                          /** Botão para validação */
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: RaisedButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 40),
                              color: widget.buttonColor,
                              onPressed: () {
                                // Validate will return true if the form is valid, or false if
                                // the form is invalid.
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();

                                  Navigator.pushNamed(context, '/signUp');
                                }
                              },
                              child: Text(
                                'Login',
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
          ],
        ),
      ),
    );
  }
}
