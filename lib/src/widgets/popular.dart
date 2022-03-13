import 'package:flutter/material.dart';
import '../models/image_api.dart';
import '../resources/image_api_fetch.dart';

class Popular extends StatefulWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  var imageApi = ImageApi();

  void initState() {
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
      children: imageApi.data!
          .map((e) => Card(
                child: Column(children: <Widget>[
                  Image.network(e.image!),
                  Text(e.description!),
                ]),
              ))
          .toList(),
    );
  }
}
