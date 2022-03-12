import 'package:flutter/material.dart';

class PlaceDetail {
  final String id;
  final String name;
  final String address;
  final String activities;
  final String description;
  final String image;

  const PlaceDetail(this.id, this.name, this.address, this.activities,
      this.description, this.image);
}
