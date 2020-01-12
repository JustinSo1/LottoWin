import 'package:flutter/material.dart';
import 'package:lottery_app/constants.dart';

class NumberChoices extends StatefulWidget {
  @override
  _NumberChoicesState createState() => _NumberChoicesState();
}

class _NumberChoicesState extends State<NumberChoices> {
  final Set<int> _chosenNumbers = Set<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _numberChoices(winningNumLimit),
    );
  }

  void pickedNum(int pickedNumber, BuildContext context) {
    final bool chosen = _chosenNumbers.contains(pickedNumber);
    final scaffold = Scaffold.of(context);

    setState(() {
      if (chosen) {
        _chosenNumbers.remove(pickedNumber);
      } else {
        if (_chosenNumbers.length < 6) {
          _chosenNumbers.add(pickedNumber);
        } else {
          if (_chosenNumbers.length == 6) {
            _chosenNumbers.add(pickedNumber);
          }
          if (_chosenNumbers.containsAll(winningNumList)) {
            scaffold.showSnackBar(
              SnackBar(
                content: const Text(
                    'Congratulations! You have won the lottery jackpot'),
                action: SnackBarAction(
                    label: 'RESET', onPressed: () => _reset(scaffold)),
              ),
            );
          } else {
            scaffold.showSnackBar(
              SnackBar(
                content: const Text(
                    'Aw no jackpot win this time! Better luck next time!'),
                action: SnackBarAction(
                    label: 'RESET', onPressed: () => _reset(scaffold)),
              ),
            );
          }
        }
      }
      print(_chosenNumbers);
    });
  }

  void _reset(var scaffold) {
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Press Refresh button for new winning numbers'),
        action: SnackBarAction(
            label: 'HIDE', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
    scaffold.showSnackBar(
      SnackBar(
        content: Text('Jackpot #s: $winningNumList'),
        action: SnackBarAction(
            label: 'HIDE', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
    setState(() {
      _chosenNumbers.clear();
    });
  }

  Widget _numberChoices(int winningNumLimit) {
    return GridView.count(
      crossAxisCount: 5,
      children: List.generate(winningNumLimit, (index) {
        ++index;
        return displayNumber(index);
      }),
    );
  }

  Widget displayNumber(int index) {
    return Card(
      color: _chosenNumbers.contains(index) ? Colors.blue : null,
      child: GestureDetector(
        onTap: () => pickedNum(index, context),
        child: Container(
          child: Center(
            child: Text(
              '$index',
            ),
          ),
        ),
      ),
    );
  }
}
