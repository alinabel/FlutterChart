import 'package:charts/screens/add_chart_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(MainWidget());
}


class MainWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: SplashScreen() ,
    );
  }
}


