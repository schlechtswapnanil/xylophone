import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  Container buildnote(Color c, int n)
  {
     return Container(

      margin:EdgeInsets.fromLTRB(62.0, 25.0, 20.0,0),
      child:ElevatedButton(
          child: Text('Note $n',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color:Colors.white,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(c),
            shadowColor: MaterialStateProperty.all(Colors.red),
            elevation: MaterialStateProperty.all(20),
            fixedSize: MaterialStateProperty.all(const Size(300,50)),
            padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(8.0,5.0,10.0,0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder( borderRadius: BorderRadius.circular(30))),
            alignment: Alignment.center,

          ),
          onPressed: (){
            final player = AudioCache();
            player.play('note$n.wav');
          }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:Center(
            child:Text("Xylophone",
              style:TextStyle(
                fontFamily: 'Pacifico',
                color:Colors.white,
              ),
            ),
          ),
          backgroundColor:Colors.red,
        ),
        backgroundColor:Colors.redAccent,
        body: Column(

              children:<Widget>[
                buildnote(Colors.red, 1),
                buildnote(Colors.deepOrange, 2),
                buildnote(Colors.yellow, 3),
                buildnote(Colors.green, 4),
                buildnote(Colors.teal, 5),
                buildnote(Colors.blue, 6),
                buildnote(Colors.deepPurple, 7),

              ]
            ),
        ),

    );
  }
}
