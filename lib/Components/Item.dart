class Item {
  String  _name;
  String   _brief;
  double _price;
  String _imageUrl;

  Item( String name, String brief, {double price = 0, String imageUrl = "NotFound.png"} ) {
    _name = name;
    _brief = brief;
    _price = price;
    _imageUrl = imageUrl;
  }

  String name()  { return _name; }

  String brief() { return _brief; }

  double price(){ return _price; }

  String id(){ return _name.trim().replaceAll(new RegExp(r"\s+\b|\b\s"), ""); }

  String image(){ return _imageUrl.trim().replaceAll(new RegExp(r"\s+\b|\b\s"), ""); }

  void update({ String name, String brief, String imgUrl, double price })
  {
    if( name != _name && name.isNotEmpty ) _name = name;
    if( brief != _brief && brief.isNotEmpty ) _brief = brief;
    if( imgUrl != _imageUrl && imgUrl.isNotEmpty ) _imageUrl = imgUrl;
    if( price != _price && price >= 0 ) _price = price;
  }

}