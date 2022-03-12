// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../screens/detail.dart';
import '../resources/dummy_data.dart';

class DestinationSuggestion extends StatelessWidget {
  void destinationDetail(BuildContext context, String name, String address,
      String desc, String image) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return DetailPage(name, address, desc, image);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(children: [
        Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.topLeft,
          child: Text(
            'Popular Destinations',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.95,
            initialPage: 0,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 4),
            autoPlayCurve: Curves.easeInOutCubic,
            aspectRatio: 16 / 9,
          ),
          items: DUMMY_DETAILS.map((instance) {
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
                  child: InkWell(
                    onTap: () => destinationDetail(context, instance.name,
                        instance.address, instance.description, instance.image),
                    splashColor: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: <Widget>[
                        Positioned(
                            child: Container(
                          color: Colors.white.withOpacity(0.4),
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
                          ),
                        )),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ]),
    );
  }
}
