import 'package:flutter/material.dart';
import 'package:tesla/screens/ReadyToPayScreen.dart';

import '../constants/constants.dart';
import '../data/Car.dart';
import '../globals/globals.dart' as globals;
import '../widgets/PrimaryButton.dart';

class SelectAutopilotTabView extends StatefulWidget {
  Car selectedCar;

  SelectAutopilotTabView(this.selectedCar, {super.key});

  @override
  State<SelectAutopilotTabView> createState() =>
      _SelectAutopilotTabViewState(selectedCar);
}

class _SelectAutopilotTabViewState extends State<SelectAutopilotTabView> {
  Car _selectedCar;
  bool _fullSelfDrivingSelected = true;
  int? _finalPrice;

  _SelectAutopilotTabViewState(this._selectedCar);

  @override
  void initState() {
    _finalPrice = globals.finalPrice;
    super.initState();
  }

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
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/autopilot.png",
                  ),
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
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 28),
              child: Text(
                "Autopilot",
                style: TextStyle(
                  fontSize: 20,
                  color: grey,
                ),
              ),
            ),
            _getPriceInfo(),
            Padding(
              padding: EdgeInsets.only(top: 18, bottom: 34),
              child: Text(
                "Atomatic driving from highway on-ramp to off-ramp including interchanges and overtaking slower cars.",
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReadyToPayScreen(_selectedCar),
                        ),
                      );
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
    if (_fullSelfDrivingSelected) {
      globals.finalPrice = _finalPrice! + _selectedCar.fullSelfDrivingPrice!;
      return setPrice(globals.finalPrice);
    } else {
      globals.finalPrice = _finalPrice! + _selectedCar.autopilotPrice!;
      return setPrice(globals.finalPrice);
    }
  }

  Widget _getPriceInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              if (!_fullSelfDrivingSelected) {
                _fullSelfDrivingSelected = !_fullSelfDrivingSelected;
              }
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Full Self-Driving",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _fullSelfDrivingSelected ? Colors.black : grey,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                setPrice(_selectedCar.fullSelfDrivingPrice!),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _fullSelfDrivingSelected ? red : greyLight,
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              if (_fullSelfDrivingSelected) {
                _fullSelfDrivingSelected = !_fullSelfDrivingSelected;
              }
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Autopilot",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _fullSelfDrivingSelected ? grey : Colors.black,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                // r"$46,700",
                setPrice(_selectedCar.autopilotPrice!),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _fullSelfDrivingSelected ? greyLight : red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
