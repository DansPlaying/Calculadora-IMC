import 'package:calculadora_imc/services/calcularWeight.dart';
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
  int banderaBotones = 0;

  String ourIMC = '';
  String suggestedWeight = '';

  void errorConDialogo(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          contentTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          title: Text('Error'),
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(
              message,
            ),
            Divider(
              height: 30.0,
            ),
            FlutterLogo(size: 100.0),
          ]),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  bool validarInputs(valor) {
    if (valor == '.' || valor == '+' || valor == '-' || valor == '') {
      errorConDialogo(
          'Hay signos invalidos ingresados como: . , +, - o espacio vacio ');
      return true;
    } else {
      return false;
    }
  }

  /// Esta funcion se encarga de calcular el peso dada 2 parametros
  void calcularPeso({String weight, String size}) {
    int decimals = 2;
    int fad = pow(10, decimals);

    if (validarInputs(weight) || validarInputs(size)) {
      errorConDialogo('Valor invalido');
    } else {
      double weightDouble = double.parse(weight);
      double sizeDouble = double.parse(size);
      List<double> resp = weightFromTwoStrings(
          weight: weightDouble, size: sizeDouble, idealWeight: idealWeight);

      setState(() {
        ourIMC = "IMC: ${resp[1]}";
        suggestedWeight = "Suggested Weight:  ${resp[0]}";
      });

      if (resp[0] == 0 && resp[1] == 0) {
        errorConDialogo(
            'Los Valores Deben ser mayores a 0,  El peso y la altura deben ser reales');
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
              Text(
                'Calculator IMC',
                style: TextStyle(color: Colors.black87, fontSize: 22.0),
              ),
              Icon(
                Icons.change_history,
                color: Colors.black,
              ),
            ],
          ),
          backgroundColor: color_base,
          leading: Icon(
            Icons.android,
            color: Colors.black,
          )),
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
                            calcularPeso(
                              size: controllerSize.value.text,
                              weight: controllerWeight.value.text,
                            );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
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
                            calcularPeso(
                              size: controllerSize.value.text,
                              weight: controllerWeight.value.text,
                            );
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
