import 'package:a_taverna/Components/Item.dart';
import 'package:a_taverna/Components/expansive_list.dart';
import 'package:flutter/material.dart';

import '../common.dart';

// Item list app build.
class ItemListState extends State<ItemList> {
  Map<String, Item> _itemMap;

  @override
  ItemListState(this._itemMap);

  @override
  Widget build(BuildContext context) {
    var leadingImage = ExactAssetImage(
        "assets/images/logo_pequena_marrom.png"); // icon by https://www.flaticon.com/authors/freepik

    return new Scaffold(
      // Make the header/appbar with a controlled size image on leading
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber[100],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: Container(
              height: 48.0,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.ac_unit,
                      color: HexColor("#BD5517").withOpacity(.5),
                    ),
                    onPressed: () {
                      return null;
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.accessibility,
                      color: HexColor("#BD5517").withOpacity(.5),
                    ),
                    onPressed: () {
                      return null;
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.adb,
                      color: HexColor("#BD5517").withOpacity(.5),
                    ),
                    onPressed: () {
                      return null;
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.format_paint,
                      color: HexColor("#BD5517").withOpacity(.5),
                    ),
                    onPressed: () {
                      return null;
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: HexColor("#BD5517"),
            ),
            onPressed: () {
              return null;
            },
          )
        ],
        leading: OverflowBox(
          minHeight: 34,
          minWidth: 34,
          child: Image(
            image: leadingImage,
            fit: BoxFit.cover,
            width: 32,
            height: 32,
          ),
        ),
        title: Text(
          "Itempedia",
          textAlign: TextAlign.right,
          style: TextStyle(
              color: HexColor("#BF5817"), fontFamily: "Cinzel", fontSize: 26),
        ),
        shape: Border(bottom: BorderSide(color: Colors.black12)),
      ),

      body: SafeArea(
          child: Container(
              color: Colors.amber[100],
              child: Column(
                children: <Widget>[
                  // Make an expanded with
                  Expanded(
                    child: ListView.builder(
                        itemCount: _itemMap.length,
                        itemBuilder: (BuildContext context, int index) {
                          var _keys = _itemMap.keys.toList();
                          return _itemRow(_itemMap[_keys[index]]);
                        }),
                  ),
//                  Divider(
//                    color: Colors.black12,
//                  ),
//                  Padding(
//                    padding: EdgeInsets.symmetric(horizontal: 45),
//                    child: ExpansiveForm(
//                      title: " Adicione um item.",
//                      fontColor: Color.fromRGBO(227, 148, 76, 1),
//                      trailing: Icon(
//                        Icons.add,
//                        color: Colors.white,
//                      ),
//                      formInputs: <DefaultInput>[
//                        DefaultInput("Nome &"),
//                        DefaultInput("Descrição @"),
//                        DefaultInput("Preço \$"),
//                      ],
//                    ),
//                  ),
                ],
              ))),
      floatingActionButton: Padding(
          padding: EdgeInsets.only(right: 15, bottom: 10),
          child: FloatingActionButton(
            backgroundColor: HexColor("#BD5517"),
            onPressed: () {
              return null;
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          )),
    );
  }

  //
  //  _addItem( String name, String brief, {double price = 0, String imgUrl } ) {
  //    catalogItem( makeItem( name, brief, price: price, imgUrl: imgUrl) );
  //    print( catalog );
  //  }

  // Build and that shows the item info on tap.
  Widget _itemRow(Item item) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: <Widget>[
          ExpansiveListItem(
            item.name(),
            item.brief(),
            item.price(),
            imgUrl: item.image(),
          ),
          Divider(height: 10,color: Colors.black12,),
        ],
      )
    );
  }
}

class ItemList extends StatefulWidget {
  final Map<String, Item> catalog;
  ItemList(this.catalog);

  @override
  ItemListState createState() => new ItemListState(catalog);
}
