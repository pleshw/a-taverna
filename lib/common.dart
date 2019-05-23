import 'dart:ui';

// ignore: slash_for_doc_comments
/** Get a hexadecimal color string then return it color. */
class HexColor extends Color {
  static int _getColorFromHex(String hexColor, {String opacity = "FF"}) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = opacity + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
