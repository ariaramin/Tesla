import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/colors.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  var _tabController;

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
      elevation: 0,
      centerTitle: true,
      title: SvgPicture.asset(
        "assets/tesla.svg",
        color: Colors.black,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }

  Widget _getBody() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: TabBar(
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
          ),
        ),
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
          // child: Text(
          //   tab,
          //   style: TextStyle(
          //     fontSize: 14,
          //   ),
          // ),
        ),
      );
    }
    return widgetList;
  }
}
