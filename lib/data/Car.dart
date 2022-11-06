import 'package:flutter/cupertino.dart';

class Car {
  String? model;
  ImageProvider? thumbnail;
  ImageProvider? image;
  String? range;
  String? power;
  String? acceleration;
  String? topSpeed;
  int? performanceModePrice;
  int? longRangeModePrice;

  Car(
    this.model,
    this.thumbnail,
    this.image,
    this.range,
    this.power,
    this.acceleration,
    this.topSpeed,
    this.performanceModePrice,
    this.longRangeModePrice,
  );
}
