import 'package:flutter/material.dart';
import '../common.dart';
import 'default_input.dart';

class ExpansiveFormState extends State<ExpansiveForm> {
  final String _title;
  final Color _fontColor;
  final Icon _trailing;
  final List<DefaultInput> _formInputs;

  int appendedFormIndex = 0;

  @override
  ExpansiveFormState(
    this._title,
    this._fontColor,
    this._trailing,
    this._formInputs,
  );

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        _title,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 22.0,
          color: HexColor("#BF5817"),
          fontFamily: "Taverna",
          letterSpacing: 3,
        ),
      ),

      // Trailing icon
      trailing: ClipRRect(
        borderRadius: BorderRadius.circular(3.0),
        child: Container(
          child: _trailing,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white12),
            gradient: LinearGradient(colors: [
              HexColor("#BF5817"),
              HexColor("#BF5817").withOpacity(.8),
            ]),
          ),
        ),
      ),

      children: <Widget>[
        GestureDetector(
          onHorizontalDragEnd: (horizontalChange) {
            double directionController =
                horizontalChange.velocity.pixelsPerSecond.dy;

            if (directionController > 0) {
              _formForward();
            }
            if (directionController < 0) {
              _formBackward();
            }
          },
          child: Container(

              padding: EdgeInsets.only(top: 12),
              child: Container(
                height: 190,
                width: 500,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                            itemCount: _formInputs.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  height: 75,
                                  padding: EdgeInsets.symmetric(horizontal: 25),
                                  child: _formInputs[index]);
                            }),
                      ),
                    ),
                    Divider(
                      color: Colors.black12,
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 8),
                        height: 40,
                        width: 40,
                        child: RaisedButton(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                          ),
                          key: UniqueKey(),
                          color: HexColor("#BF5817"),
                          onPressed: () {
                            return null;
                          }, // TO-DO: Check missing info and redirect to those text fields.
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }

  _formForward() {
    setState(() {
      if (appendedFormIndex >= (_formInputs.length - 1)) {
        appendedFormIndex = 0;
        return;
      }
      appendedFormIndex++;
    });
  }

  _formBackward() {
    setState(() {
      if (appendedFormIndex <= 0) {
        appendedFormIndex = _formInputs.length - 1;
        return;
      }
      appendedFormIndex--;
    });
  }
}

class ExpansiveForm extends StatefulWidget {
  final String _title;
  final Color _fontColor;
  final Icon _trailing;
  final List<DefaultInput> _formInputs;

  ExpansiveForm({
    title,
    fontColor,
    trailing,
    formInputs,
  })  : _title = title,
        _fontColor = fontColor,
        _trailing = trailing,
        _formInputs = formInputs;

  @override
  ExpansiveFormState createState() =>
      new ExpansiveFormState(_title, _fontColor, _trailing, _formInputs);
}
