// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/themes.dart';

class ThemeList extends StatelessWidget {
  final List<ThemeItem> _themes = [
    ThemeItem('Advanture', 'assets/images'),
    ThemeItem('Nature', 'assets/images/dest.jpg'),
    ThemeItem('Family', 'assets/images/dest.jpg'),
    ThemeItem('Lakes', 'assets/images/dest.jpg'),
    ThemeItem('Treking', 'assets/images/dest.jpg'),
    ThemeItem('Advanture', 'assets/images/dest.jpg'),
    ThemeItem('Advanture', 'assets/images/dest.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 5, top: 5),
        height: 150,
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(left: 5),
            alignment: Alignment.topLeft,
            child: Text('Theme'),
          ),
          Expanded(
            child: ListView.custom(
                scrollDirection: Axis.horizontal,
                childrenDelegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      //child: Container(child: CircleAvatar(radius: 50)),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('assets/images/nature.jpg'),
                            backgroundColor: Colors.transparent,
                          ),
                          Text(_themes[index].theme),
                        ],
                      ),
                    );
                  },
                  childCount: _themes.length,
                )),
          ),
        ]));
  }
}
