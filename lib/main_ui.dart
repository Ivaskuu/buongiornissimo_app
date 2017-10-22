import 'package:flutter/material.dart';
import 'colors.dart';

import 'ordina_ui.dart';
import 'consegna_ui.dart';

class MainUI extends StatefulWidget
{
  Widget body = new OrdinaUI();
  int currentIndex = 0;

  @override
  MainUIState createState() => new MainUIState();
}

class MainUIState extends State<MainUI>
{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      appBar: new AppBar
      (
        backgroundColor: colorCaffe,
        elevation: 0.0,
        leading: new Icon(Icons.local_cafe, color: Colors.white),
        title: new Text("Buongiornissimo", style: new TextStyle(color: Colors.white)),
        actions: <Widget>
        [
          new CircleAvatar
          (
            backgroundColor: Colors.white,
            child: new Icon(Icons.account_circle, color: colorCaffe),
          )
        ]
      ),
      body: widget.body,
      bottomNavigationBar: new BottomNavigationBar
      (
        fixedColor: colorCaffe,
        currentIndex: widget.currentIndex,
        items: <BottomNavigationBarItem>
        [
          new BottomNavigationBarItem
          (
            icon: new Icon(Icons.store),
            title: new Text("Ordina")
          ),
          new BottomNavigationBarItem
          (
            icon: new Icon(Icons.shopping_cart),
            title: new Text("Consegna")
          ),
        ],
        onTap: (int index)
        {
          switch(index)
          {
            case 0: setState(() => widget.body = new OrdinaUI()); break;
            case 1: setState(() => widget.body = new ConsegnaUI()); break;
          }

          widget.currentIndex = index;
        },
      )
    );
  }
}