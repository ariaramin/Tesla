import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../data/Car.dart';
import '../data/CarColor.dart';
import '../widgets/PrimaryButton.dart';
import '../globals/globals.dart' as globals;

class SelectInteriorTabView extends StatefulWidget {
  Car selectedCar;
  SelectInteriorTabView(this.selectedCar, {super.key});

  @override
  State<SelectInteriorTabView> createState() =>
      _SelectInteriorTabViewState(selectedCar);
}

class _SelectInteriorTabViewState extends State<SelectInteriorTabView> {
  Car _selectedCar;
  CarColor? _selectedColor = null;
  int? _finalPrice;

  _SelectInteriorTabViewState(this._selectedCar);

  @override
  void initState() {
    _selectedColor = _selectedCar.interiorColors![0];
    _finalPrice = globals.finalPrice;
    globals.finalPrice = _finalPrice! + _selectedColor!.price!;
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
                    // "assets/interior-${_selectedCar.model!}-${_selectedColor!.imageName}.jpeg",
                    "assets/interior-3-${_selectedColor!.imageName}.jpeg",
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
                "Select Interior",
                style: TextStyle(
                  fontSize: 20,
                  color: grey,
                ),
              ),
            ),
            _getColorSection(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    setPrice(globals.finalPrice),
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

  Widget _getColorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ..._getCarColorText(),
          ],
        ),
        SizedBox(
          height: 34,
        ),
        Row(
          children: [
            ..._getCarColor(),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Divider(
            height: 2,
          ),
        )
      ],
    );
  }

  List _getCarColorText() {
    var widgetList = [];
    for (var color in _selectedCar.interiorColors!) {
      widgetList.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              color.name!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: _selectedColor == color ? Colors.black : grey,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              color.imageName == "white" ? setPrice(color.price!) : "Included",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _selectedColor == color ? red : greyLight,
              ),
            ),
          ],
        ),
      );
    }
    return widgetList;
  }

  List _getCarColor() {
    var widgetList = [];
    for (var color in _selectedCar.interiorColors!) {
      widgetList.add(
        InkWell(
          onTap: () {
            setState(() {
              _selectedColor = color;
              globals.finalPrice = _finalPrice! + _selectedColor!.price!;
            });
          },
          child: Container(
            width: 48,
            height: 48,
            margin: EdgeInsets.only(right: 22),
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
