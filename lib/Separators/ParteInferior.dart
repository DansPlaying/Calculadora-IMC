import 'package:flutter/material.dart';

class ParteInferior extends StatefulWidget {
  final String suggestedWeight;
  final String ourIMC;

  ParteInferior(this.suggestedWeight, this.ourIMC);

  @override
  _ParteInferiorState createState() => _ParteInferiorState();
}

class _ParteInferiorState extends State<ParteInferior> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Divider(
        height: 20.0,
      ),
      Container(
        height: 50.0,
        width: 200.0,
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFFf04B4AE), Colors.deepPurpleAccent]),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 11.0, left: 50.0),
          child: Text(widget.ourIMC, 
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20.0, color: Colors.black,
              )),
        ),
      ),
      Divider(
        height: 15.0,
      ),
      Container(
        height: 50.0,
        width: 260.0,
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.greenAccent, Colors.lime]),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10.0),
          child: Text(widget.suggestedWeight, 
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 20.0, color: Colors.black,
            )),
        ),
      ),
      Divider(
        height: 10.0,
      ),
      new Container(
        padding: EdgeInsets.all(2.0),
        child: Stack(
          children: <Widget>[
            Align(
              child: new Image(
                width: 300.0,
                height: 200.0,
                image: new AssetImage('assets/images/2.png'),
              ),
            )
          ],
        ),
      )
    ]);
  }
}
