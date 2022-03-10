import 'package:flutter/material.dart';
import 'package:tour_ui/src/screens/tour_ui.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tour UI',
      home: TourUI(),
    );
  }
}
