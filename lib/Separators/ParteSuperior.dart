import 'dart:math';

import 'package:calculadora_imc/constantes/constantes.dart';
import 'package:flutter/material.dart';

class ParteSuperior extends StatefulWidget {
  @override
  _ParteSuperiorState createState() => _ParteSuperiorState();
}

class _ParteSuperiorState extends State<ParteSuperior> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      height: 150.0,
      decoration: BoxDecoration(
        color: color_base,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(100.0),
          bottomLeft: Radius.circular(100.0),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:130.0,),
            child: Text ('Tocame', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0), ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _cambiarForma();
              });
            },
            child: Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadius,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _cambiarForma() {
    final random = Random();
    setState(() {
      _width = random.nextInt(250).toDouble();
      _height = random.nextInt(100).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
