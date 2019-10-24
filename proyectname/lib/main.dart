import 'package:flutter/material.dart';
import 'package:proyectname/models/location.dart';
import 'models/location.dart';
import 'location_detail.dart';
import 'mocks/mock_location.dart';

void main() {
  final Location  mockLocation = MockLocation.FetchAny();
  return runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocationDetail(mockLocation),
    ));
}
