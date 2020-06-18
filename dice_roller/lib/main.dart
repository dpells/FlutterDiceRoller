import 'dart:math';

import 'package:flutter/material.dart';
import 'diceButton.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColorDark: Colors.teal[900],
        primaryColorLight: Colors.lightGreen[400],
        accentColor: Colors.lime,

        canvasColor: Colors.lime[50],
        backgroundColor: Colors.white70,
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black),
          display1: TextStyle(color: Colors.black),
        ),
      ),
      home: MyHomePage(title: 'Dice Roller'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
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

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Wrap(
          runSpacing: 40,
          spacing: 40,
          children: initDice,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
