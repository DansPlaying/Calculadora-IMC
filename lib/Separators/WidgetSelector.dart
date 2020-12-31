import 'package:flutter/material.dart';

class WidgetSelector extends StatefulWidget {
  final TextEditingController controllerWeight;
  final TextEditingController controllerSize;

  WidgetSelector(this.controllerWeight, this.controllerSize);

  @override
  _WidgetSelectorState createState() => _WidgetSelectorState();
}

class _WidgetSelectorState extends State<WidgetSelector> {
  @override

  bool validar1, validar2;

  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 150.0,
        height: 60.0,
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black, blurRadius: 5.0),
            ]),
        child: TextFormField(
          maxLength: 4,
          controller: widget.controllerWeight,
          decoration: InputDecoration(
            hintText: 'Peso (Kg)',
            icon: Icon(
              Icons.account_balance_wallet,
              color: Colors.purpleAccent,
            ),
          ),
          keyboardType: TextInputType.numberWithOptions(),
        ),
      ),
      Divider(),
      Container(
        width: 150.0,
        height: 60.0,
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black, blurRadius: 5.0),
            ]),
        child: TextFormField(
          maxLength: 3,
          controller: widget.controllerSize,
          decoration: InputDecoration(
            hintText: 'Altura (Cm)',
            icon: Icon(
              Icons.business,
              color: Colors.blueAccent,
            ),
          ),
          keyboardType: TextInputType.numberWithOptions(),
        ),
      ),
      Divider(
        height: 30.0,
      ),
    ]);
  }
}
