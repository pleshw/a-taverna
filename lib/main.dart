import 'package:a_taverna/common.dart';
import 'package:a_taverna/view/history_page.dart';
import 'package:a_taverna/view/itempedia_page.dart';
import 'package:a_taverna/view/login_page.dart';
import 'package:a_taverna/view/sign_up_page.dart';
import 'package:flutter/material.dart';

import 'Components/Item.dart';

var catalog = new Map<String, Item>();

// Create and return a new item.
Item makeItem(String name, String brief, {double price = 0, String imgUrl}) {
  Item item = new Item(name, brief, price: price, imageUrl: imgUrl);
  return item;
}

// Add an item to the catalog if that item doesn't already exist.
bool catalogItem(Item item) {
  if (catalog.containsKey(item.name())) return false;
  catalog[item.id()] = item;
  return true;
}

void main() => runApp(MyApp());

/// ESSA CLASSE E PÁGINA LIDA APENAS COM A CRIAÇÃO DE ROTAS E COM A DEFINIÇÃO
/// DE ESTILOS PARA AS PÁGINAS INSTANCIADAS.
class MyApp extends StatelessWidget {
  final Color backgroundColor = Colors.amber[200];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    catalogItem(makeItem("Pow-Pow", "Uma metralhadora selvagem.",
        price: 20000, imgUrl: "assets/images/Pow-Pow.jpg"));

    catalogItem(makeItem(
        "Fishbones", "Uma bazuca.",
        price: 20000, imgUrl: "assets/images/Fishbones.jpg"));

    catalogItem(makeItem("Resposta", "Fornece ao jogador uma resposta.",
        price: 99999999999999, imgUrl: "assets/images/NotFound.png"));

    catalogItem(makeItem(
        "Zap", "Uma arma de raios.",
        price: 20000, imgUrl: "assets/images/Zap.jpg"));

    catalogItem(makeItem("Explosivo",
        "Uma bomba forte não convencional.",
        price: 50, imgUrl: "assets/images/ZiggsHexplosives.jpg"));

    catalogItem(makeItem(
        "Cronômetro Parado", "Para o tempo por um curto período.",
        price: 100000, imgUrl: "assets/images/ZileanStopwatch.png"));

    return MaterialApp(
      /** Rota inicial. */
      initialRoute: '/itempedia',

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
        '/createHistory': (context) => HistoryPage(
              backgroundColor: backgroundColor,
              buttonColor: HexColor("#BD5517"),
              buttonFontColor: Colors.white,
              placeholderColor: HexColor("#BF5817"),
            ),
        '/itempedia': (context) => ItemList(catalog),
      },
      title: 'A taverna',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}
