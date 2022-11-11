import 'package:flutter/material.dart';
import 'package:tesla/data/CarColor.dart';

import '../constants/constants.dart';
import '../data/Car.dart';
import '../widgets/PrimaryButton.dart';

class SelectColorTabView extends StatefulWidget {
  Car selectedCar;
  SelectColorTabView(this.selectedCar, {super.key});

  @override
  State<SelectColorTabView> createState() =>
      _SelectColorTabViewState(selectedCar);
}

class _SelectColorTabViewState extends State<SelectColorTabView> {
  Car _selectedCar;
  CarColor? _selectedColor = null;
  int? _finalPrice;

  _SelectColorTabViewState(this._selectedCar);

  @override
  void initState() {
    _selectedColor = _selectedCar.colors![0];
    _finalPrice = _selectedCar.performanceModePrice! + _selectedColor!.price!;
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
                    "assets/${_selectedCar.model!}-${_selectedColor!.imageName}.png",
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
                      "Select Color",
                      style: TextStyle(
                        fontSize: 20,
                        color: grey,
                      ),
                    ),
                  ),
                  // _getColorSection(),
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
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(34),
            topLeft: Radius.circular(34),
          ),
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
          children: [
            _getColorSection(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    setPrice(_finalPrice!),
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
                    (() {}),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getColorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _selectedColor!.name!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              setPrice(_selectedColor!.price!),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: red,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 34,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ..._getCarColor(),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Divider(
            height: 2,
          ),
        )
      ],
    );
  }

  List _getCarColor() {
    var widgetList = [];
    for (var color in _selectedCar.colors!) {
      widgetList.add(
        InkWell(
          onTap: () {
            setState(() {
              _selectedColor = color;
            });
          },
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              gradient: LinearGradient(
                colors: [
                  color.gradientFirstColor!,
                  color.gradientSecondColor!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              border: _selectedColor == color
                  ? Border.all(
                      color: Colors.lightBlue,
                      width: 4,
                    )
                  : null,
            ),
          ),
        ),
      );
    }
    return widgetList;
  }
}
