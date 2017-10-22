import 'package:flutter/material.dart';
import 'custom_colors.dart';
import 'main.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';

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
          new Text("Lista Ordini", style: Theme.of(context).textTheme.title.copyWith(color: Colors.white)),
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

  List<String> oggetti = new List();

  @override
  OrdineTileState createState() => new OrdineTileState();
}

class OrdineTileState extends State<OrdineTile>
{
  @override
  initState()
  {
    super.initState();
    
    final DatabaseReference oggRef = reference.child("${widget.snapshot.key}/oggetti");
    oggRef.onChildAdded.listen(_onChildAdd);
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
        child: new ListTile
        (
          leading: new CircleAvatar(backgroundImage: new NetworkImage(widget.snapshot.value["foto"])),
          title: new Text(widget.oggetti.length.toString()),
          subtitle: new Text("${widget.snapshot.value["classe"]} - Aula ${widget.snapshot.value["aula"]}"),
        ),
      ),
    );
  }

  void _onChildAdd(Event event)
  {
    setState(()
    {
      widget.oggetti.add(event.snapshot.key);
    });
  }
}