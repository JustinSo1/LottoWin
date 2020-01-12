import 'package:flutter/material.dart';
import 'package:lottery_app/screens/number_choices.dart';
import 'package:lottery_app/constants.dart';

class LotteryNums extends StatefulWidget {
  @override
  _LotteryNumsState createState() => _LotteryNumsState();
}

class _LotteryNumsState extends State<LotteryNums> {
  @override
  Widget build(BuildContext context) {
    _winningSection();
    return Scaffold(
      appBar: AppBar(
        title: appBarTitleText,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _winningSection,
          )
        ],
      ),
      body: _playPage(),
    );
  }

  Widget _playPage() {
    return Container(child: SafeArea(child: NumberChoices()));
  }

  void _winningSection() {
    winningNumList = generateWinningNumList();
    setState(() {
      appBarTitleText = Card(
        color: Colors.lightBlueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: winningNumList
              .map(
                (winningNum) => Text(
                  "#",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              )
              .toList(),
        ),
      );
    });
  }
}
