import 'package:a_taverna/common.dart';
import 'package:a_taverna/view/history_page.dart';
import 'package:a_taverna/view/login_page.dart';
import 'package:a_taverna/view/sign_up_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// ESSA CLASSE E PÁGINA LIDA APENAS COM A CRIAÇÃO DE ROTAS E COM A DEFINIÇÃO
/// DE ESTILOS PARA AS PÁGINAS INSTANCIADAS.
class MyApp extends StatelessWidget {
  final Color backgroundColor = Colors.amber[200];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /** Rota inicial. */
      initialRoute: '/createHistory',

      /** Todas as rotas */
      /// Rotas devem ser instanciadas em camelCase e em inglês com o nome
      /// do que a página propõe.
      /// Evite usar mais de 2 palavras para um nome.
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        '/': (context) => LoginPage(
          image: AssetImage("assets/images/logo_pequena_marrom.png"),
          backgroundColor: backgroundColor,
          buttonColor: HexColor("#BD5517"),
          buttonFontColor: Colors.white,
          placeholderColor: HexColor("#BF5817"),
        ),
        '/signUp': (context) => SignUpPage(
          image: AssetImage("assets/images/cerveja_pequena.png"),
          backgroundColor: backgroundColor,
          buttonColor: HexColor("#BD5517"),
          buttonFontColor: Colors.white,
          placeholderColor: HexColor("#BF5817"),
        ),
        '/createHistory': (context) => CreateHistoryPage(
          backgroundColor: backgroundColor,
          buttonColor: HexColor("#BD5517"),
          buttonFontColor: Colors.white,
          placeholderColor: HexColor("#BF5817"),
        ),
      },
      title: 'A taverna',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}

