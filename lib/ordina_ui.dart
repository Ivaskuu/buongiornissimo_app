import 'package:flutter/material.dart';
import 'custom_colors.dart';
import 'main.dart';
import 'oggetto.dart';
import 'lista_oggetti.dart';
import 'checkout_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrdinaUI extends StatefulWidget
{
  @override
  OrdinaUIState createState() => new OrdinaUIState();
}

class OrdinaUIState extends State<OrdinaUI> with SingleTickerProviderStateMixin
{
  TabController controller;

  @override
  void initState()
  {
    super.initState();
    controller = new TabController(vsync: this, length: 4);
  }

  @override
  void dispose()
  {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      appBar: new TabBar
      (
        controller: controller,
        tabs: <Tab>
        [
          new Tab(icon: new Icon(Icons.local_cafe)),
          new Tab(icon: new Icon(Icons.local_drink)),
          new Tab(icon: new Icon(Icons.local_pizza)),
          new Tab(icon: new Icon(Icons.restaurant)),
        ]
      ),
      backgroundColor: colorCaffe,
      body: new TabBarView
      (
        controller: controller,
        children: <Widget>
        [
          gridList(context, ListaOggetti.getOggettiDellaMacchinetta(0)),
          gridList(context, ListaOggetti.getOggettiDellaMacchinetta(1)),
          gridList(context, ListaOggetti.getOggettiDellaMacchinetta(2)),
          gridList(context, ListaOggetti.getOggettiDellaMacchinetta(3)),
        ],
      ),
      floatingActionButton: carello.length > 0 // Show the FAB only if there are oggetti in the carello
        ? new Stack
        (
          alignment: FractionalOffset.topRight,
          children: <Widget>
          [
            new FloatingActionButton
            (
              onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (_) => new CheckoutUI())),
              child: new Icon(Icons.shopping_cart),
              backgroundColor: Colors.pinkAccent,
            ),
            new CircleAvatar
            (
              backgroundColor: Colors.amberAccent,
              radius: 10.0,
              child: new Text(carello.length.toString(), textScaleFactor: 0.7),
            ),
          ],
        )
        : null
    );
  }

  Widget gridList(var context, List<Oggetto> oggetti)
  {
    return new Container
    (
      margin: new EdgeInsets.all(0.0),
      child: new GridView.builder
      (
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount
        (
          crossAxisCount: 2,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0
        ),
        itemBuilder: (_, int pos) => oggettoUI(context, oggetti[pos]),
        itemCount: oggetti.length,
      )
    );
  }
  
  Widget oggettoUI(var context, Oggetto _oggetto)
  {
    return new GridTile
    (
      child: new Container
      (
        child: new InkWell
        (
          onTap: () => _showOggettoDialog(context, _oggetto),
          child: new Container
          (
            decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage("res/food_images/" + _oggetto.image), fit: BoxFit.cover)),
          ),
        ),
      ),
      footer: new GestureDetector
      (
        onTap: () => _showOggettoDialog(context, _oggetto),
        child: new GridTileBar
        (
          backgroundColor: Colors.black87,
          title: new Text(_oggetto.nome),
          subtitle: new Text("${_oggetto.prezzo.toStringAsFixed(2)} €"),
        )
      ),
    );
  }

  void _showOggettoDialog(var context, Oggetto _oggetto)
  {
    showDialog
    (
      context: context,
      barrierDismissible: true,
      child: new SimpleDialog
      (
        contentPadding: new EdgeInsets.all(0.0),
        children: <Widget>
        [
          new SizedBox.fromSize
          (
            size: new Size.fromHeight(200.0),
            child: new Container(decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage("res/food_images/" + _oggetto.image), fit: BoxFit.cover))),
          ),
          new ListTile
          (
            title: new Text(_oggetto.nome),
            subtitle: new Text("${_oggetto.prezzo.toStringAsFixed(2)} €"),
            trailing: new Column
              (
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>
                [
                  new Text(_oggetto.peso == null ? "" : "${_oggetto.peso}g"),
                  new Text(_oggetto.kcal == null ? "" : "${_oggetto.kcal} kcal"),
                ],
              )
          ),
          new Container
          (
            margin: new EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: new RaisedButton
            (
              onPressed: () => setState(() => aggiungiAlCarello(ListaOggetti.oggetti.indexOf(_oggetto))),
              child: new Text("AGGIUNGI AL CARELLO", style: new TextStyle(color: Colors.white)),
              color: colorCaffe,
            )
          )
        ],
      ),
    );
  }

  //Navigator.of(context).push(new MaterialPageRoute(builder: (_) => new OrdinaListUI())).then((Task task){if( task != null ){addTask(task);}})
}