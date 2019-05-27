import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../common.dart';

Color expandTrailingColor = Color.fromRGBO(207, 158, 136, 1);

class ExpansiveListItemState extends State<ExpansiveListItem> {
  final String _title;
  final String _brief;
  final double _price;

  bool isExpanded = false;

  final String _imgUrl;

  @override
  ExpansiveListItemState(
    this._title,
    this._brief,
    this._price,
    this._imgUrl,
  );

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: false,
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(3.0),
          child: Image(
            image: AssetImage(_imgUrl),
            width: 42,
            height: 42,
          )),

      title: Text(
        _title,
        style: TextStyle(
          color: HexColor("#BF5817").withOpacity(.8),
          fontFamily: "Taverna",
          fontSize: 28,
          letterSpacing: 2,
        ),
        textAlign: TextAlign.left,
        textScaleFactor: 1,
      ),

      trailing: Icon(
        (isExpanded) ? Icons.minimize : Icons.expand_more,
        color: expandTrailingColor,
      ),

      onExpansionChanged: (isExpanded) {
        if (isExpanded)
          setState(() {
            this.isExpanded = true;
          });
        if (!isExpanded)
          setState(() {
            this.isExpanded = false;
          });
      },

      // List of sub items ( Description and price )
      children: <Widget>[
        // Brief text.
        Container(
          margin: EdgeInsets.only(top: 15, bottom: 20),
          child: Row(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Descrição: ",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(197, 108, 46, 1),
                          fontWeight: FontWeight.w600,
                          fontFamily: "CinzelDecorative"),
                      textAlign: TextAlign.right,
                      maxLines: null,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  children: <Widget>[
                    Text(
                      _brief,
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 12.0,
                          color: HexColor("#BF5817").withOpacity(.8),
                          fontWeight: FontWeight.w600,
                          fontFamily: "Cinzel"),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Price text.
        Container(
          margin: EdgeInsets.only(top: 5, bottom: 20),
          child: Row(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      " Preço: ",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(197, 108, 46, 1),
                          fontWeight: FontWeight.w600,
                          fontFamily: "CinzelDecorative"),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  children: <Widget>[
                    Text(
                      "\$" + _price.toString(),
                      style: TextStyle(
                          fontSize: 12.0,
                          color: HexColor("#BF5817").withOpacity(.6),
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ExpansiveListItem extends StatefulWidget {
  final String _title;
  final String _brief;
  final double _price;
  final String _imgUrl;

  ExpansiveListItem(
    String title,
    brief,
    price, {
    String imgUrl = "assets/images/NotFound.jpg",
  })  : _title = title,
        _brief = brief,
        _price = price,
        _imgUrl = imgUrl;

  @override
  ExpansiveListItemState createState() => new ExpansiveListItemState(
        _title,
        _brief,
        _price,
        _imgUrl,
      );
}
