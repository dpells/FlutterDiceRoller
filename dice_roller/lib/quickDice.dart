import 'package:flutter/material.dart';

class QuickDiceTab extends StatelessWidget {
  final List<Widget> initDice;
  QuickDiceTab({this.initDice});

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
          spacing: 40,
          runSpacing: 40,
          children: initDice,
        )
      ),
      /* We'll eventually need a FAB to create new dice
      floatingActionButton: FloatingActionButton(

        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
