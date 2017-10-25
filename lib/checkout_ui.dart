import 'package:flutter/material.dart';
import 'oggetto.dart';
import 'lista_oggetti.dart';
import 'custom_colors.dart';
import 'main.dart';

class CheckoutUI extends StatefulWidget
{
  @override
  CheckoutUIState createState() => new CheckoutUIState();
}

class CheckoutUIState extends State<CheckoutUI>
{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      appBar: new AppBar
      (
        title: new Text("Carello"),
        backgroundColor: colorCaffe,
      ),
      body: new Column
      (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>
        [
          new Expanded
          (
            child: new ListView.builder
            (
              itemBuilder: (_, int pos) => cardOggetto(carello[pos], pos),
              itemCount: carello.length,
            ),
          ),
          pillButton(),
        ],
      ),
    );
  }

  Widget pillButton()
  {
    double costo = 0.0;
    for (int i = 0; i < carello.length; i++)
    {
      costo += ListaOggetti.oggetti[carello[i]].prezzo;
    }

    return new Container
    (
      margin: new EdgeInsets.all(8.0),
      child: new Material
      (
        elevation: 8.0,
        borderRadius: new BorderRadius.circular(32.0),
        child: new InkWell
        (
          onTap: () => _ordina(),
          child: new Container
          (
            decoration: new BoxDecoration
            (
              borderRadius: new BorderRadius.circular(32.0),
              gradient: new LinearGradient
              (
                colors: [colorViola, colorBlue],
              ),
            ),
            child: new Text("ORDINA (${costo.toStringAsFixed(2)} €)", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            padding: new EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
          ),
        )
      )
    );
  }

  Widget cardOggetto(int id, int pos)
  {
    return new Card
    (
      child: new ListTile
      (
        title: new Text(ListaOggetti.oggetti[id].nome),
        subtitle: new Text("${ListaOggetti.oggetti[id].prezzo.toStringAsFixed(2)} €"),
        trailing: new IconButton
        (
          onPressed: ()
          {
            setState(() => carello.removeAt(pos));
            if(carello.length == 0) Navigator.pop(context);
          },
          icon: new Icon(Icons.delete),
        ),
      ),
    );
  }

  void _ordina()
  {
    showDialog
    (
      context: context,
      barrierDismissible: false,
      child: new SimpleDialog
      (
        children: <Widget>
        [
          new Container
          (
            margin: new EdgeInsets.all(8.0),
            child: new ListTile
            (
              leading: new CircularProgressIndicator(),
              title: new Text("Un secondo, stiamo notificando le altre persone")
            )
          )
        ],
      )
    );

    var ref = reference.push();
    ref.set
    ({
      "nome": googleSignIn.currentUser.displayName,
      "foto": googleSignIn.currentUser.photoUrl,
      "classe": "5^C",
      "aula": 24,
      "completato": false,
      "consegnatore": null,
      "id": ref.key
    });

    for (var i = 0; i < carello.length; i++)
    {
      ref.child("oggetti").set
      ({
        ListaOggetti.oggetti[carello[i]].nome:
        {
          "quantita": 1,
          "prezzo": ListaOggetti.oggetti[carello[i]].prezzo,
          "macchinetta": ListaOggetti.oggetti[carello[i]].macchinetta
        },
      });
    }
    
    //analytics.logEvent(name: "nuova_richiesta");
  }

  int numOggettiUguali(int id)
  {
    int numOgg = 0;
    for (var i = 0; i < carello.length; i++)
    {
      if(carello[i] == id) numOgg++;
    }

    return numOgg;
  }
}