import 'package:flutter/material.dart';
import 'package:diceroller/quickDice.dart';
import 'package:diceroller/AdvancedDice.dart';
import 'diceButton.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
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
      home: Main(title: 'Dice Roller'),
    );
  }
}

class Main extends StatefulWidget {
  Main({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main>
    with SingleTickerProviderStateMixin{
  final List<Tab> tabs = <Tab>[
    Tab(text: 'Quick Roll'),
    Tab(text: 'Custom Roll'),
    Tab(text: 'New tab'),
  ];

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

  TabController _tabController;
  int mod;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
    mod = 0;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget> [
          QuickDiceTab(
            initDice: initDice
          ),
          AdvancedDice(
            initDice: initDice,
          ),
          AdvancedDice(
            initDice: initDice,
          )
        ]
      ),
      /* We'll eventually need a FAB to create new dice */
//      floatingActionButton: FloatingActionButton(
//
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
