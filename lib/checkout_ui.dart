import 'package:flutter/material.dart';
import 'oggetto.dart';
import 'lista_oggetti.dart';
import 'custom_colors.dart';
import 'main.dart';

class CheckoutUI extends StatefulWidget
{
  @override
  State createState()
  {
    print("create state");
    return new CheckoutUIState();
  }
}
//€idrien
class CheckoutUIState extends State<CheckoutUI>
{
  List<PiuOggetti> _listaOggetti = new List();

  @override
  void initState()
  {
    print("init state");
    super.initState();

    for (var i = 0; i < carello.length; i++) // Per ogni oggetto nel carello
    {
      bool found = false; // Se l'oggetto carello[i] è già presente nella lista widget.listaOggetti

      for (var j = 0; j < _listaOggetti.length; j++) // Per ogni PiuOggetti nella lista widget.listaOggetti
      {
        if(carello[i] == _listaOggetti[j].pos) // Se l'oggetto carello[i] è presente nella lista widget.listaCarello in posizione j
        {
          found = true;
          _listaOggetti[j].count++;
          break; // L'abbiamo trovato, non c'è più bisogno di continuare
        }
      }

      if(!found) // Se siamo arrivati alla fine della lista widget.listaOggetti ma l'oggetto carello[i] non è presente
      {
        _listaOggetti.add(new PiuOggetti(carello[i], 1)); // Bisogna crearlo
      }
    }

    print(_listaOggetti.length);
  }

  @override
  Widget build(BuildContext context)
  {
    print("Build : " + _listaOggetti.length.toString());
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
            child:  new ListView.builder
            (
              itemBuilder: (_, int pos) => new CardOggetto(_listaOggetti[pos], this, pos),
              itemCount: _listaOggetti.length,
            )
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

  void _ordina()
  {
    // TODO: Svuota tutto il carello
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

    for (var i = 0; i < _listaOggetti.length; i++)
    {
      ref.child("oggetti/${ListaOggetti.oggetti[_listaOggetti[i].pos].nome}").set
      ({
        "quantita": _listaOggetti[i].count,
        "prezzo": ListaOggetti.oggetti[_listaOggetti[i].pos].prezzo,
        "macchinetta": ListaOggetti.oggetti[_listaOggetti[i].pos].macchinetta
      });
    }
    
    //analytics.logEvent(name: "nuova_richiesta");
  }
}

class PiuOggetti
{
  int pos; // La posizione dell'oggetto nella lista_oggetti.dart
  int count; // Il numero di oggetti dello stesso tipo nel carello
  PiuOggetti(this.pos, this.count);
}


class CardOggetto extends StatefulWidget
{
  PiuOggetti _oggetto;
  CheckoutUIState _ref;
  int _posInArray;
  CardOggetto(this._oggetto, this._ref, this._posInArray);

  @override
  State createState() => new CardOggettoState();
}

class CardOggettoState extends State<CardOggetto>
{
  Widget build(BuildContext context)
  {
    return new Card
    (
      child: new ListTile
      (
        leading: new Center(child: new Text(widget._oggetto.count.toString())),
        title: new Text(ListaOggetti.oggetti[widget._oggetto.pos].nome),
        subtitle: new Text("${ListaOggetti.oggetti[widget._oggetto.pos].prezzo.toStringAsFixed(2)} €"),
        trailing: new IconButton
        (
          icon: new Icon(Icons.remove_circle_outline),
          onPressed: ()
          {
            setState(()
            {
              widget._ref._listaOggetti.elementAt(widget._posInArray).count--; // Diminuisci il count del PiuOggetti

              bool giaCancellatoDalCarello = false; // Metodo pigro, perchè break; non funziona quà sotto
              carello.removeWhere((int pos) // Rimuovi l'oggetto anche dal carello generale
              {
                // /!\ TODO: Questo cambia la posizione degli oggetti dell'array carello, quindi bisogna ripopolare l'array... balza non ho voglia di farlo ora //

                /*if(!giaCancellatoDalCarello)
                {
                  carello[pos] == widget._oggetto.pos;
                  giaCancellatoDalCarello = true;

                  return true;
                }
                else*/ return false;
              });

              if(widget._ref._listaOggetti.elementAt(widget._posInArray).count <= 0) // Se il count è minore o uguale a 0
              {
                widget._ref.setState(() => widget._ref._listaOggetti.removeAt(widget._posInArray)); // Rimuovi il card dalla lista
                if(widget._ref._listaOggetti.length <= 0) Navigator.pop(context); // Se non c'è più nessun oggetto, chiudi questo screen
              }
            });
          },
        ),
      ),
    );
  }
}