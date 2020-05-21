import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiceButton extends StatelessWidget{
  final GestureTapCallback  onPressed;
  final String text;
  final AssetImage icon;
  DiceButton({this.onPressed, this.text, this.icon});

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
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}
