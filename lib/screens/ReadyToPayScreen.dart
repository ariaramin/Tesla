import 'package:flutter/material.dart';
import 'package:tesla/data/Car.dart';

import '../constants/constants.dart';
import '../widgets/PrimaryButton.dart';
import '../globals/globals.dart' as globals;

class ReadyToPayScreen extends StatelessWidget {
  Car _selectedCar;
  ReadyToPayScreen(this._selectedCar, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: _selectedCar.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          _getBottomSection(),
        ],
      ),
    );
  }

  Widget _getBottomSection() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 26,
          horizontal: 18,
        ),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.only(
          //   topRight: Radius.circular(34),
          //   topLeft: Radius.circular(34),
          // ),
          boxShadow: [
            BoxShadow(
              color: greyLight.withOpacity(.2),
              blurRadius: 16,
              offset: Offset(0, -4),
            ),
          ],
          color: Colors.black,
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 28),
              child: Text(
                "Summary",
                style: TextStyle(
                  fontSize: 20,
                  color: grey,
                ),
              ),
            ),
            Text(
              "Your Model ${_selectedCar.model} is ready",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              setPrice(globals.finalPrice),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 42,
            ),
            PrimaryButton(
              "Pay",
              Colors.white,
              (() {}),
            ),
          ],
        ),
      ),
    );
  }
}
