import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class DiceButton extends StatelessWidget{
  final int max;
  final String text;
  final AssetImage icon;
  final bool showZero;
  DiceButton({this.max, this.text, this.icon, this.showZero = false});
  DiceButton.withZero({this.max, this.text, this.icon, this.showZero = true});

  Widget build(BuildContext context){
    const double size = 48;
    return RawMaterialButton(
      splashColor: Colors.lightGreen[400],
      child: Column(
        children: <Widget>[
          icon == null ?
            Image(image: AssetImage('diceIcons/d6.png')) :
            Image(image: icon),
          Text(
            text,
            style: TextStyle(
              fontSize: 36,
            ),
          ),
        ]
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => SimpleDialog(
            title: new Center(child: Text('Result of ' + this.text)),
            children: <Widget>[
              new Center(
                child: new Text(
                  getResult(this.showZero, this.max, this.text).toString(),
                  style: TextStyle(
                    fontSize: 36,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      shape: const StadiumBorder(),
    );
  }

  static String getResult(bool showZero, int max, String text){
    int result = showZero == true ?
      new Random.secure().nextInt(max) :
      new Random.secure().nextInt(max) + 1;
    return text == 'd00' ? result.toString()+"0" : result.toString();
  }
}
