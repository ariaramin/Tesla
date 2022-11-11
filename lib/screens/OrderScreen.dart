import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla/data/Car.dart';
import 'package:tesla/tab_views/SelectCarTabView.dart';
import 'package:tesla/tab_views/SelectColorTabView.dart';
import 'package:tesla/tab_views/SelectInteriorTabView.dart';

import '../constants/constants.dart';

class OrderScreen extends StatefulWidget {
  Car selectedCar;
  OrderScreen(this.selectedCar, {super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState(selectedCar);
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  var _tabController;
  Car _selectedCar;

  _OrderScreenState(this._selectedCar);

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: SafeArea(
        child: _getBody(),
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: .5,
      centerTitle: true,
      title: SvgPicture.asset(
        "assets/tesla.svg",
        color: Colors.black,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      bottom: _getTabBar(),
    );
  }

  Widget _getBody() {
    return TabBarView(
      controller: _tabController,
      children: [
        SelectCarTabView(_selectedCar),
        SelectColorTabView(_selectedCar),
        SelectInteriorTabView(_selectedCar),
      ],
    );
  }

  TabBar _getTabBar() {
    return TabBar(
      controller: _tabController,
      labelPadding: EdgeInsets.all(0),
      labelStyle: TextStyle(
        fontFamily: "Gotham",
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: "Gotham",
      ),
      indicatorColor: red,
      labelColor: Colors.black,
      unselectedLabelColor: grey,
      tabs: [
        ..._getTabs(),
      ],
    );
  }

  List _getTabs() {
    var tabList = ["1.Car", "2.Exterior", "3.Interior", "4.Autopilot"];
    var widgetList = [];
    for (var tab in tabList) {
      widgetList.add(
        Tab(
          text: tab,
        ),
      );
    }
    return widgetList;
  }
}
