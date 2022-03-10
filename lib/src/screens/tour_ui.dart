// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../widgets/suggestion.dart';
import '../widgets/theme_list.dart';
import '../widgets/search_bar.dart';

class TourUI extends StatelessWidget {
  const TourUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: Scaffold(
        backgroundColor: Color(0xffF6F6F6),
        appBar: AppBar(title: Text('Destinations')),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SearchBar(),
              ThemeList(),
              DestinationSuggestion(),
            ],
          ),
        ),
      ),
    );
  }
}
