import 'package:flutter/material.dart';
import 'oggetto.dart';

class OggettoUI extends StatelessWidget
{
  Oggetto oggetto;
  OggettoUI(this.oggetto);
  
  @override
  Widget build(BuildContext context)
  {
    return new GridTile
    (
      child: new Container(decoration: new BoxDecoration(image: new DecorationImage(image: new NetworkImage(oggetto.image), fit: BoxFit.cover))),
      footer: new GridTileBar
      (
        backgroundColor: Colors.black.withAlpha(200),
        title: new Text(oggetto.nome),
        subtitle: new Text("${oggetto.prezzo} €"),
      ),
    );
  }
}