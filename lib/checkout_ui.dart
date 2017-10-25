import 'package:flutter/material.dart';
import 'oggetto.dart';
import 'lista_oggetti.dart';
import 'custom_colors.dart';
import 'main.dart';

class CheckoutUI extends StatefulWidget
{
  List<int> carelloOrdinato = carello;
  List<int> occurences = new List();

  @override
  CheckoutUIState createState() => new CheckoutUIState();
}

class CheckoutUIState extends State<CheckoutUI>
{
  @override
  void initState()
  {
    for (int i = 0; i < widget.carelloOrdinato.length; i++)
    {
      int count = 1;
      for (int j = i + 1; j < widget.carelloOrdinato.length; j++)
      {
        if(widget.carelloOrdinato[i] == widget.carelloOrdinato[j])
        {
          count++;
          widget.carelloOrdinato.removeAt(j);
          j--;
        }
      }

      widget.occurences.add(count);
    }

    super.initState();
  }

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
              itemCount: widget.occurences.length,
              itemBuilder: (_, int pos) => cardOggetto(pos),
            ),
          ),
          pillButton(),
        ],
      ),
    );
  }

  Widget cardOggetto(int pos)
  {
    print(pos);
    print(widget.occurences[pos]);

    return new Card
    (
      child: new ListTile
      (
        //leading: new Center(child: new Text(widget.occurences[pos].toString())),
        title: new Text(ListaOggetti.oggetti[widget.carelloOrdinato[pos]].nome),
        subtitle: new Text("${ListaOggetti.oggetti[widget.carelloOrdinato[pos]].prezzo.toStringAsFixed(2)} €"),
        trailing: new IconButton
        (
          onPressed: ()
          {
            setState(()
            {
              widget.occurences[pos] -= 1;
              if(widget.occurences[pos] == 0) widget.carelloOrdinato.removeAt(pos);
            });
            
            if(widget.carelloOrdinato.length == 0) Navigator.pop(context);
          },
          icon: new Icon(Icons.delete),
        ),
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
              title: new Text("Un secondo, stiamo notificando le altre persone...")
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
}