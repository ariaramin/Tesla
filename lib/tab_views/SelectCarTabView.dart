import 'package:flutter/material.dart';
import 'package:tesla/data/Car.dart';

import '../constants/constants.dart';
import '../widgets/PrimaryButton.dart';
import '../globals/globals.dart' as globals;

class SelectCarTabView extends StatefulWidget {
  Car selectedCar;
  SelectCarTabView(this.selectedCar, {super.key});

  @override
  State<SelectCarTabView> createState() => _SelectCarTabViewState(selectedCar);
}

class _SelectCarTabViewState extends State<SelectCarTabView> {
  bool _performanceModeSelected = true;
  Car _selectedCar;

  _SelectCarTabViewState(this._selectedCar);

  @override
  Widget build(BuildContext context) {
    return _getBody();
  }

  Widget _getBody() {
    return Container(
      color: blueGrey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/model-${_selectedCar.model}/${_selectedCar.model}-${_selectedCar.colors![0].imageName}.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(28),
                    child: Text(
                      "Select Your Car",
                      style: TextStyle(
                        fontSize: 20,
                        color: grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: _getPriceInfo(),
                  ),
                  // _getBottomSection(),
                ],
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
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getInfo(),
            Padding(
              padding: EdgeInsets.only(top: 18, bottom: 34),
              child: Text(
                "Tesla All-Wheel Drive has two independent motors. Unlike traditional all-wheel drive systems, these two motors digitally control torque to the front and rear wheels—for far better handling and traction control.",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.3,
                  color: greyLight,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    _getSelectedPrice(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: PrimaryButton(
                    "Next",
                    Colors.black,
                    (() {
                      globals.tabController!
                          .animateTo(globals.tabController!.index + 1);
                    }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getSelectedPrice() {
    if (_performanceModeSelected) {
      globals.finalPrice = _selectedCar.performanceModePrice!;
      return setPrice(_selectedCar.performanceModePrice!);
    } else {
      globals.finalPrice = _selectedCar.longRangeModePrice!;
      return setPrice(_selectedCar.longRangeModePrice!);
    }
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
                  _selectedCar.acceleration!,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "0-60 mph",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
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
                  _selectedCar.topSpeed!,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Top Speed",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _getPriceInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              if (!_performanceModeSelected) {
                _performanceModeSelected = !_performanceModeSelected;
              }
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Performance",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _performanceModeSelected ? Colors.black : grey,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                setPrice(_selectedCar.performanceModePrice!),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _performanceModeSelected ? red : greyLight,
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              if (_performanceModeSelected) {
                _performanceModeSelected = !_performanceModeSelected;
              }
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Long Range",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _performanceModeSelected ? grey : Colors.black,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                // r"$46,700",
                setPrice(_selectedCar.longRangeModePrice!),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _performanceModeSelected ? greyLight : red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
