import 'package:flutter/material.dart';
import 'package:tesla/data/Car.dart';
import 'package:tesla/data/CarColor.dart';

List<Car> carList = [
  Car(
    "S",
    AssetImage("assets/Model-S.jpg"),
    AssetImage("assets/image.png"),
    "396 mi",
    "1,020 hp",
    "1.99s",
    "200 mph",
    57700,
    47700,
    [
      CarColor("Pearl White Multi-Coat", "white", 1700, Colors.grey[100],
          Colors.grey[300]),
      CarColor("Red Multi-Coat", "red", 1700, Colors.red[700], Colors.red[900]),
      CarColor("Deep Blue Metallic", "blue", 1700, Colors.blue[700],
          Colors.blue[900]),
      CarColor("Midnight Silver Metallic", "grey", 1700, Colors.grey[500],
          Colors.grey[700]),
      CarColor("Solid Black", "black", 1700, Colors.black54, Colors.black),
    ],
    [
      CarColor(
          "Black And White", "white", 1700, Colors.grey[100], Colors.grey[300]),
      CarColor("All Black", "black", 0, Colors.black54, Colors.black),
    ],
  ),
  Car(
    "X",
    AssetImage("assets/Model-X.jpeg"),
    AssetImage("assets/image.png"),
    "333 mi",
    "1,020 hp",
    "2.5s",
    "163 mph",
    57700,
    47700,
    [
      CarColor("Pearl White Multi-Coat", "white", 1700, Colors.grey[100],
          Colors.grey[300]),
      CarColor("Red Multi-Coat", "red", 1700, Colors.red[700], Colors.red[900]),
      CarColor("Deep Blue Metallic", "blue", 1700, Colors.blue[700],
          Colors.blue[900]),
      CarColor("Midnight Silver Metallic", "grey", 1700, Colors.grey[500],
          Colors.grey[700]),
      CarColor("Solid Black", "black", 1700, Colors.black54, Colors.black),
    ],
    [
      CarColor(
          "Black And White", "white", 1700, Colors.grey[100], Colors.grey[300]),
      CarColor("All Black", "black", 0, Colors.black54, Colors.black),
    ],
  ),
  Car(
    "3",
    AssetImage("assets/Model-3.jpg"),
    AssetImage("assets/image.png"),
    "358 mi",
    "1,020 hp",
    "in 3.1s",
    "200 mph",
    57700,
    47700,
    [
      CarColor("Pearl White Multi-Coat", "white", 1700, Colors.grey[100],
          Colors.grey[300]),
      CarColor("Red Multi-Coat", "red", 1700, Colors.red[700], Colors.red[900]),
      CarColor("Deep Blue Metallic", "blue", 1700, Colors.blue[700],
          Colors.blue[900]),
      CarColor("Midnight Silver Metallic", "grey", 1700, Colors.grey[500],
          Colors.grey[700]),
      CarColor("Solid Black", "black", 1700, Colors.black54, Colors.black),
    ],
    [
      CarColor(
          "Black And White", "white", 1700, Colors.grey[100], Colors.grey[300]),
      CarColor("All Black", "black", 0, Colors.black54, Colors.black),
    ],
  ),
  Car(
    "Y",
    AssetImage("assets/Model-Y.jpeg"),
    AssetImage("assets/image.png"),
    "330 mi",
    "1,020 hp",
    "2.8s",
    "155 mph",
    57700,
    47700,
    [
      CarColor("Pearl White Multi-Coat", "white", 1700, Colors.grey[100],
          Colors.grey[300]),
      CarColor("Red Multi-Coat", "red", 1700, Colors.red[700], Colors.red[900]),
      CarColor("Deep Blue Metallic", "blue", 1700, Colors.blue[700],
          Colors.blue[900]),
      CarColor("Midnight Silver Metallic", "grey", 1700, Colors.grey[500],
          Colors.grey[700]),
      CarColor("Solid Black", "black", 1700, Colors.black54, Colors.black),
    ],
    [
      CarColor(
          "Black And White", "white", 1700, Colors.grey[100], Colors.grey[300]),
      CarColor("All Black", "black", 0, Colors.black54, Colors.black),
    ],
  ),
];
