import 'package:a_taverna/Components/default_input.dart';
import 'package:flutter/material.dart';

class CreateHistoryPage extends StatefulWidget {
  CreateHistoryPage({
    Key key,
    this.backgroundColor,
    this.buttonColor,
    this.buttonFontColor = Colors.white,
    this.placeholderColor = Colors.black38,
  }) : super(key: key);

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
  _CreateHistoryPageState createState() => _CreateHistoryPageState();
}

// An image under a container, the image will fit the container width and height.
class _CreateHistoryPageState extends State<CreateHistoryPage> {
  final PageController pageController = new PageController();

  final titleController = TextEditingController();

  int currentPage = 0;

  @override
  // ignore: must_call_super
  void initState() {
    pageController.addListener(() {
      int nextPage = pageController.page.round();

      if (currentPage != nextPage)
        setState(() {
          currentPage = nextPage;
        });
    });
  }

  _buildFistPage() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text("Página de criação de histórias."),
            subtitle: Text(
              "Arraste pro lado para criar sua história.",
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _titlePage() {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.amber[100],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 350,
                child: ListTile(
                  title: Text(
                    "Qual será o nome desse lugar?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: widget.cinzelDecorative,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 26, bottom: 16),
                child: Icon(Icons.alternate_email),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: 270,
                  child: DefaultInput(
                    "Titulo",
                    placeholderColor: widget.placeholderColor,
                    controller: titleController,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _textPage() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.amber[100],
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50),
            width: 350,
            child: ListTile(
              title: Text(
                "Qual a história de ${titleController.text}?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: widget.cinzelDecorative,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 26, bottom: 18),
            child: Icon(Icons.library_books),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: 270,
              child: DefaultInput(
                "História",
                placeholderColor: widget.placeholderColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mapPage() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.amber[100],
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 45),
            width: 350,
            child: ListTile(
              title: Text(
                "Envie-nos uma imagem do mapa ou da região",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: widget.cinzelDecorative,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 26, bottom: 18),
            child: Icon(Icons.zoom_out_map),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: 270,
              child: DefaultInput(
                "Mapa",
                placeholderColor: widget.placeholderColor,
                icon: Icons.map,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _confirmPage() {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    return null;
                  },
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                  child: Text(
                    "Salvar Mapa",
                    style: TextStyle(
                        color: widget.buttonColor,
                        fontFamily: widget.medievalFont,
                        fontSize: 25),
                  ),
                  color: widget.buttonFontColor,
                  shape: StadiumBorder(
                      side: BorderSide(color: widget.buttonColor)),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/map_example.jpg"),
                  fit: BoxFit.cover)),
        ));
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 1:
        return _titlePage();
      case 2:
        return _textPage();
      case 3:
        return _mapPage();
      default:
        return _confirmPage();
    }
  }

  /// Prepara a página a ser mostrada e quando ela for ativa a estiliza.
  _buildPageViewOf(int index, bool isActive) {
    /** Se ativa => ? Se inativa => : */
    final double blur = isActive ? 20 : 0;
    final double offset = isActive ? 5 : 0;
    final double bottomMargin = isActive ? 160 : 180;
    final double horizontalMargin = isActive ? 8 : 7;

    return AnimatedContainer(
      child: _buildPage(index),
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.symmetric(
          vertical: bottomMargin, horizontal: horizontalMargin),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: (index < 4) /** Add shadow if not in the last index */
              ? [
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: blur,
                      offset: Offset(offset, offset))
                ]
              : null),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0)
              return _buildFistPage();
            else if (index <= 4) {
              bool isActive =
                  currentPage == index; // if the current page is active
              return _buildPageViewOf(index, isActive);
            }
          },
        ),
      ),
    );
  }
}
