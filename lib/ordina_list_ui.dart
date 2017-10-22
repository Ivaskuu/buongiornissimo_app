import 'package:flutter/material.dart';
import 'custom_colors.dart';

class OrdinaListUI extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      backgroundColor: Colors.white,
      appBar: new AppBar
      (
        title: new Text("Caffè"),
      ),
      body: new ListView
      (
        children: <Widget>
        [
          new Card
          (
            child: new InkWell
            (
              onTap: () => null,
              child: new ListTile
              (
                leading: new Icon(Icons.local_cafe),
                title: new Text("Caffè espresso"),
                trailing: new Text("0.25 €", style: new TextStyle(color: Colors.green, fontWeight: FontWeight.w800)),
              )
            ),
          ),
          new Card
          (
            child: new InkWell
            (
              onTap: () => null,
              child: new ListTile
              (
                leading: new Icon(Icons.local_cafe),
                title: new Text("Caffè lungo"),
                trailing: new Text("0.25 €", style: new TextStyle(color: Colors.green, fontWeight: FontWeight.w800)),
              )
            ),
          ),
          new Card
          (
            child: new InkWell
            (
              onTap: () => null,
              child: new ListTile
              (
                leading: new Icon(Icons.local_cafe),
                title: new Text("Cioccolata"),
                trailing: new Text("0.25 €", style: new TextStyle(color: Colors.green, fontWeight: FontWeight.w800)),
              )
            ),
          ),
          new Card
          (
            child: new InkWell
            (
              onTap: () => null,
              child: new ListTile
              (
                leading: new Icon(Icons.local_cafe),
                title: new Text("Capuccino"),
                trailing: new Text("0.25 €", style: new TextStyle(color: Colors.green, fontWeight: FontWeight.w800)),
              )
            ),
          ),
          new Card
          (
            child: new InkWell
            (
              onTap: () => null,
              child: new ListTile
              (
                leading: new Icon(Icons.local_cafe),
                title: new Text("Thè caldo"),
                trailing: new Text("0.25 €", style: new TextStyle(color: Colors.green, fontWeight: FontWeight.w800)),
              )
            ),
          ),
        ],
      ),
    );
  }
}