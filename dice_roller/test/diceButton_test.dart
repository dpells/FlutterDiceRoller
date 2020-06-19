import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diceroller/diceButton.dart';

void main() {
  test('Value should not be between 1 and 6 (inclusive)', (){
    final diceButton = DiceButton(
        text: 'd6',
        icon: AssetImage('diceIcons/d6.png'),
        max: 6,
    );

     expect(
         int.parse(diceButton.getResult(false, 6, 'd6')),
         inInclusiveRange(1, 6)
     );
  });

  test('Value should be between 0 and 9 (inclusive)', (){
    final diceButton = DiceButton(
      text: 'd10',
      icon: AssetImage('diceIcons/d10.png'),
      max: 10,
    );

    expect(
        int.parse(diceButton.getResult(true, 10, 'd10')),
        inInclusiveRange(0, 10)
    );
  });

  test('Value should end with 0', (){
    final diceButton = DiceButton(
      text: 'd00',
      icon: AssetImage('diceIcons/d10.png'),
      max: 10,
    );

    expect(
        diceButton.getResult(true, 10, 'd00'),
        endsWith('0')
    );
  });
}