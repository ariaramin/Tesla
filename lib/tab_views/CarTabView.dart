import 'package:flutter/material.dart';
import 'package:tesla/data/Car.dart';

import '../constants/colors.dart';

class CarTabView extends StatelessWidget {
  Car car;
  CarTabView(this.car, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image(
          image: car.thumbnail!,
          height: 285,
        ),
        _getInfo(),
      ],
    );
  }

  Widget _getInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  car.range!,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Range (EPA est.)",
                  style: TextStyle(
                    fontSize: 16,
                    color: grey,
                  ),
                ),
              ],
            ),
            Container(
              width: 1,
              height: 52,
              color: grey,
            ),
            Column(
              children: [
                Text(
                  car.power!,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Peak Power",
                  style: TextStyle(
                    fontSize: 14,
                    color: grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 36,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Acceleration:",
              style: TextStyle(
                fontSize: 16,
                color: grey,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              car.acceleration!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Top speed:",
              style: TextStyle(
                fontSize: 16,
                color: grey,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              car.topSpeed!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
