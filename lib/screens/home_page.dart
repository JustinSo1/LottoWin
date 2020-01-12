import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: instructions(context),
    );
  }

  Widget instructions(BuildContext context) {
    return Column(
      children: <Widget>[
        SafeArea(
          child: Text(
            'Instructions',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        SafeArea(
          minimum: EdgeInsets.all(10.0),
          child: Text('To play, press on 7 numbers to choose ' +
              'them as your lottery ticket. After those numbers ' +
              'will be compared to jackpot numbers. If your chosen numbers' +
              ' and the jackpot numbers match, then you win the jackpot!'),
        ),
        RaisedButton(
          child: Text('START GAME'),
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
        )
      ],
    );
  }
}
