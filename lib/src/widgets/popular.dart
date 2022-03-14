// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/image_api.dart';
import '../resources/image_api_fetch.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Popular extends StatefulWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  var imageApi = ImageApi();

  dynamic initState() {
    ImageApiFetch().getImage().then((value) {
      setState(() {
        imageApi = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // children: imageApi.data!
      //     .map((e) => Card(
      //           child: Column(children: <Widget>[
      //             Image.network(e.image!),
      //             Text(e.description!),
      //           ]),
      //         ))
      //     .toList(),
      children: [
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
          items: imageApi.data!.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage(i.image!),
                    //   fit: BoxFit.fill,
                    // ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      Image.network(i.image!),
                      Positioned(
                          child: Container(
                        color: Colors.white.withOpacity(0.4),
                        child: ListTile(
                          title: Text(
                            i.description!,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            i.description!,
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      )),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
