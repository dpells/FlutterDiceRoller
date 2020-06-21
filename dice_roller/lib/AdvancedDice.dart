import 'package:diceroller/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdvancedDiceTab extends StatelessWidget {
  final List<Widget> initDice;
  AdvancedDiceTab({this.initDice});

  Widget build(BuildContext context) {
    return Scaffold(
      body: AdvancedDice(initDice: initDice),
    );
  }
}
class AdvancedDice extends StatefulWidget {
  final List<Widget> initDice;
  AdvancedDice({this.initDice});

  @override
  _AdvancedDiceState createState() => _AdvancedDiceState(initDice: initDice);
}

class _AdvancedDiceState extends State<AdvancedDice> {
  List<Widget> initDice;
  _AdvancedDiceState({this.initDice});
  TextEditingController _diceController, _modController;
  int _diceCount, _modifier;

  void initState(){
    super.initState();
    _diceController = TextEditingController();
    _modController = TextEditingController();
    _diceCount = 1;
    _modifier = 0;
  }

  void dispose(){
    _diceController.dispose();
    _modController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.remove),
                tooltip: 'Decrease',
                onPressed: () {
                  setState(() {
                    if(_diceCount > 1) { --_diceCount; }
                  });
                },
              ),
              SizedBox(
                width: 100,
                child: TextField(
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  controller: _diceController..text = '$_diceCount',
                  onSubmitted: (String value) async{
                    _diceCount = int.parse(value);
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                tooltip: 'Increase',
                onPressed: () {
                  setState(() {
                    ++_diceCount;
                  });
                },
              )
            ],
          ),
          Wrap(
            runSpacing: 40,
            spacing: 40,
            children: initDice,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                  '+',
                  style: TextStyle(
                    fontSize: 24
                  )
              ),
              IconButton(
                icon: Icon(Icons.remove),
                tooltip: 'Decrease',
                onPressed: () {
                  setState(() {
                    --_modifier;
                  });
                },
              ),
              SizedBox(
                width: 100,
                child: TextField(
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  controller: _modController..text = '$_modifier',
                  onSubmitted: (String value) async{
                    _modifier = int.parse(value);
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                tooltip: 'Increase',
                onPressed: () {
                  setState(() {
                    ++_modifier;
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}