import 'package:flutter/material.dart';
final winningNumAmt = 7;
final winningNumLimit = 50;
var winningNumList = generateWinningNumList();
bool wonGame = false;
var appBarTitleText = new Card();

List generateWinningNumList () {
  var winningList = List.generate(winningNumLimit, (i) => i + 1);
  winningList.shuffle();
  print(winningList.sublist(0, winningNumAmt));
  return winningList.sublist(0, winningNumAmt);
}