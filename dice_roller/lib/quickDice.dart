import 'dart:math';

import 'package:flutter/material.dart';
import 'diceButton.dart';

class QuickDiceTab extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuickDice(),
    );
  }
}

class QuickDice extends StatefulWidget {
  QuickDice();

  @override
  _QuickDiceState createState() => _QuickDiceState();
}

class _QuickDiceState extends State<QuickDice> {
  List<Widget> initDice = [
    DiceButton(
      text: 'd4',
      icon: AssetImage('diceIcons/d4.png'),
      max: 4,
    ),
    DiceButton(
      text: 'd6',
      icon: AssetImage('diceIcons/d6.png'),
      max: 6,
    ),
    DiceButton(
      text: 'd8',
      icon: AssetImage('diceIcons/d8.png'),
      max: 8,
    ),
    DiceButton.withZero(
      text: 'd10',
      icon: AssetImage('diceIcons/d10.png'),
      max: 10,
      showZero: true,
    ),
    DiceButton.withZero(
      text: 'd00',
      icon: AssetImage('diceIcons/d10.png'),
      max: 10,
      showZero: true,
    ),
    DiceButton(
      text: 'd12',
      icon: AssetImage('diceIcons/d12.png'),
      max: 12,
    ),
    DiceButton(
      text: 'd20',
      icon: AssetImage('diceIcons/d20.png'),
      max: 20,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Wrap(
          runSpacing: 40,
          spacing: 40,
          children: initDice,
        ),
      ),
      /* We'll eventually need a FAB to create new dice
      floatingActionButton: FloatingActionButton(

        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
