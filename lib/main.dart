import 'package:flutter/material.dart';
import 'package:lottery_app/home_page.dart';
import 'package:flutter/services.dart';
import 'package:lottery_app/lottery_play.dart';
void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lottery Simulation',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/second': (context) => LotteryNums(),
      },
    );
  }
}

