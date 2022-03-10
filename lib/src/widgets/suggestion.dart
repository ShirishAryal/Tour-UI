// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/suggestions.dart';

class DestinationSuggestion extends StatelessWidget {
  final List<Suggestion> _suggestions = [
    Suggestion('Place Name 1', 'Description ', 'assets/images/nature.jpg'),
    Suggestion('Place Name 2', 'Description', 'assets/images/dest.jpg'),
    Suggestion('Place Nasssme 3', 'Descriccsption', 'assets/images/nature.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(children: [
        Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.topLeft,
          child: Text('Popular Destinations'),
        ),
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.85,
            initialPage: 0,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayCurve: Curves.easeInOutCubic,
            aspectRatio: 18 / 9,
          ),
          items: _suggestions.map((instance) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(instance.image),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      Positioned(
                          child: ListTile(
                        title: Text(
                          instance.name,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          instance.description,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      )),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        )
      ]),
    );
  }
}
