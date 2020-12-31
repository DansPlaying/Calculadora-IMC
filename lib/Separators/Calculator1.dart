import 'package:flutter/material.dart';

import 'package:calculadora_imc/Separators/ParteInferior.dart';
import 'package:calculadora_imc/Separators/WidgetSelector.dart';
import 'ParteSuperior.dart';
import 'dart:ui' as ui;
import 'package:decimal/decimal.dart';
import 'dart:math';
import 'package:calculadora_imc/constantes/constantes.dart';

class Calculator1 extends StatefulWidget {
  Calculator1({Key key}) : super(key: key);

  @override
  _Calculator1State createState() => _Calculator1State();
}

class _Calculator1State extends State<Calculator1> {
  final controllerWeight = TextEditingController();
  final controllerSize = TextEditingController();
  final myFormKey = GlobalKey<FormState>();
  final decimal = Decimal;
  int idealWeight = 1;
  int banderaBotones= 0;

  String ourIMC = '';
  String suggestedWeight = '';

//Calcular peso mujer
  void weight() {
    int decimals = 2;
    int fad = pow(10, decimals);

    if((controllerWeight.text).toString()=='.'|| (controllerSize.text).toString()=='.'||(controllerWeight.text).toString()=='+'|| (controllerSize.text).toString()=='+'||(controllerWeight.text).toString()=='-'|| (controllerSize.text).toString()=='-'||(controllerWeight.text).toString()==''|| (controllerSize.text).toString()=='')
        { showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            contentTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0),),
            title: Text('Error'),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              Text('Hay signos invalidos ingresados como: . , +, - o espacio vacio '),
              Divider(height: 30.0,),
              FlutterLogo(size: 100.0),
            ]),
            actions: [
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                 child: Text('Ok'))   
                 ],
          );
        });}
  else {      

      if (double.parse(controllerWeight.text)!=0 && double.parse(controllerSize.text)!=0 && double.parse(controllerWeight.text)*100 >100 && double.parse(controllerSize.text)>140 ){
     
    if (myFormKey.currentState.validate()) {
      double weight = double.parse(controllerWeight.text);
      double heightUsed = (double.parse(controllerSize.text) / 100) * 2;
      double d = weight / heightUsed;
      d = (d * fad).round() / fad;


      double suggested = (idealWeight * weight) / d;
      suggested = (suggested * fad).round() / fad;

      setState(() {
        ourIMC = "IMC: $d";
        suggestedWeight = "Suggested Weight:  $suggested";
      });
     }
    }
    else {
       showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            contentTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
            title: Text('Error'),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              Text('Los Valores Deben ser mayores a 0,  El peso y la altura deben ser reales'),
              Divider(height: 30.0,),
              FlutterLogo(size: 100.0),
            ]),
            actions: [
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  
                },
                 child: Text('Ok'))   
                 ],
          );
        });
    }
    }  
  }

  @override
  Widget build(BuildContext context) {
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height;

    return Scaffold(
      backgroundColor: Colors.black87,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Calculator IMC', style: TextStyle(color: Colors.black87, fontSize: 22.0), ),
              
              Icon(Icons.change_history, color: Colors.black,),
            ],
          ),
          backgroundColor: color_base,
          leading:
              Icon(Icons.android, color: Colors.black,)
              ),
      body: Form(
        
        key: myFormKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // En ParteSuperior esta el Widget que contiene la imagen de la Balanza
              ParteSuperior(),
              Container(
                padding: EdgeInsets.only(top: 25.0),
                child: Column(
                  children: [
                    // En WidgetSelector estan las cajas donde se introduce la información
                    WidgetSelector(controllerWeight, controllerSize),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          onPressed: () {
                            idealWeight = 21;
                            weight();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.pinkAccent,
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Icon(Icons.person),
                              Text('Mujer'),
                            ],
                          ),
                        ),
                        VerticalDivider(),
                        FlatButton(
                          onPressed: () {
                            idealWeight = 24;
                            weight();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.greenAccent,
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Icon(Icons.person_outline),
                              Text('Hombre'),
                            ],
                          ),
                        ),
                      ],
                    ),

                    ParteInferior(suggestedWeight, ourIMC),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
