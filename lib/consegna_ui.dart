import 'package:flutter/material.dart';
import 'custom_colors.dart';
import 'main.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';
import 'dart:collection';

class ConsegnaUI extends StatefulWidget
{
  @override
  ConsegnaUIState createState() => new ConsegnaUIState();
}

class ConsegnaUIState extends State<ConsegnaUI>
{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      backgroundColor: colorCaffe,
      body: new Column
      (
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>
        [
          new Expanded
          (
            child: new FirebaseAnimatedList
            (
              query: reference,
              sort: (a, b) => b.key.compareTo(a.key),
              padding: new EdgeInsets.all(8.0),
              itemBuilder: (_, DataSnapshot snapshot, Animation<double> animation)
              {
                return new OrdineTile
                (
                  snapshot: snapshot,
                  animation: animation,
                );
              },
            )
          )
        ],
      )
    );
  }
}

class OrdineTile extends StatefulWidget
{
  final DataSnapshot snapshot;
  final Animation animation;
  OrdineTile({this.snapshot, this.animation});

  @override
  OrdineTileState createState() => new OrdineTileState();
}

class OrdineTileState extends State<OrdineTile>
{
  final List<ListTile> _oggetti = new List();
  double _costTot = 0.0;

  @override
  initState()
  {
    super.initState();
    
    LinkedHashMap ogg = widget.snapshot.value["oggetti"];
    //print("L'utente ${widget.snapshot.value["nome"]} vuole :");

    ogg.forEach((oggName, _)
    {
      _oggetti.add
      (
        new ListTile
        (
          dense: true,
          leading: new CircleAvatar
          (
            backgroundColor: colorCaffe,
            child: new Text(widget.snapshot.value["oggetti"][oggName]["quantita"].toString())
          ),
          title: new Text(oggName),
        )
      );
      _costTot += widget.snapshot.value["oggetti"][oggName]["prezzo"];
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return new SizeTransition
    (
      sizeFactor: new CurvedAnimation
      (
        parent: widget.animation,
        curve: Curves.easeOut
      ),
      axisAlignment: 0.0,
      child: new Card
      (
        child: new Container
        (
          padding: new EdgeInsets.symmetric(vertical: 10.0),
          child: new Column
          (
            children: <Widget>
            [
              new ListTile
              (
                dense: false,
                leading: new CircleAvatar(backgroundImage: new NetworkImage(widget.snapshot.value["foto"])),
                title: new Text("${widget.snapshot.value["classe"]} - Aula ${widget.snapshot.value["aula"]}"),
                subtitle: new Text(widget.snapshot.value["nome"]),
                trailing: new Text("${_costTot.toStringAsFixed(2)} €"),
              ),
              new Column
              (
                children: _oggetti,
              )
            ],
          )
        )
      ),
    );
  }
}