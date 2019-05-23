import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({
    Key key,
    this.image,
    this.backgroundColor,
  }) : super(key: key);

  final AssetImage image;
  final Color backgroundColor;
  final String medievalFont = "Taverna";
  final String cinzelFont = "Cinzel";
  final String cinzelDecorative = "CinzelDecorative";

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              width: 190,
              image: widget.image,
            ),
          ],
        ),
      ),
    );
  }
}
