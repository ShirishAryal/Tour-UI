import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/image_api.dart';

class ImageApiFetch {
  final _newsUrl = 'http://actionfurnituresansar.com/api/utility/Banners';
  Future<ImageApi> getImage() async {
    Client client = Client();
    var imageApi;

    var response = await client.get(Uri.parse('$_newsUrl'));

    var jsonString = response.body;
    var jsonMap = jsonDecode(jsonString);

    imageApi = ImageApi.fromJson(jsonMap);

    return imageApi;
  }
}
