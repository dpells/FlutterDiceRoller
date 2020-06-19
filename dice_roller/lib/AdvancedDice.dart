import 'package:flutter/material.dart';

class AdvancedDiceTab extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdvancedDice(),
    );
  }
}

class AdvancedDice extends StatefulWidget {
  AdvancedDice();

  @override
  _AdvancedDiceState createState() => _AdvancedDiceState();
}

class _AdvancedDiceState extends State<AdvancedDice> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Text("Advanced rolling will go here"),
    );
  }
}