import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla/constants/colors.dart';
import 'package:tesla/data/DataSet.dart';
import 'package:tesla/screens/OrderScreen.dart';
import 'package:tesla/tab_views/CarTabView.dart';
import 'package:tesla/widgets/PrimaryButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var _tabController;

  @override
  void initState() {
    _tabController =
        TabController(initialIndex: 1, length: carList.length + 2, vsync: this);
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
      backgroundColor: Colors.black,
      centerTitle: true,
      title: SvgPicture.asset(
        "assets/tesla.svg",
        color: Colors.white,
      ),
    );
  }

  Widget _getBody() {
    return Container(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 54,
            ),
            Text(
              "Tesla",
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
              ),
            ),
            Container(
              width: double.infinity,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(
                  horizontal: 38,
                ),
                labelStyle: TextStyle(
                  fontFamily: "Gotham",
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(
                  fontFamily: "Gotham",
                  fontSize: 38,
                ),
                indicatorColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: grey,
                tabs: [
                  ..._getTabs(),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ..._getTabViews(),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: PrimaryButton(
                "Order Now",
                Colors.white,
                () {
                  if (_tabController.index >= 1 && _tabController.index <= 4) {
                    var selectedCar = carList[_tabController.index - 1];
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return OrderScreen(selectedCar);
                      }),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List _getTabViews() {
    var widgetList = [];
    widgetList.add(Container());
    for (var car in carList) {
      widgetList.add(CarTabView(car));
    }
    widgetList.add(Container());
    return widgetList;
  }

  List _getTabs() {
    var tabList = [];
    tabList.add("");
    for (var car in carList) {
      tabList.add(car.model);
    }
    tabList.add("");
    var widgetList = [];
    for (var tab in tabList) {
      widgetList.add(
        Tab(
          text: tab,
        ),
      );
      // widgetList.add(
      //   Tab(
      //     child: Text(
      //       tab,
      //       style: TextStyle(
      //         fontSize: 48,
      //       ),
      //     ),
      //   ),
      // );
    }
    return widgetList;
  }
}
