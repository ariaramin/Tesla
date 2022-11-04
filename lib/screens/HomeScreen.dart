import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla/constants/colors.dart';

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
    _tabController = TabController(initialIndex: 1, length: 5, vsync: this);
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
                indicatorColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: grey,
                tabs: [
                  ..._getTabs(),
                ],
              ),
            ),
            Image(
              image: AssetImage("assets/image.png"),
            ),
            _getInfo(),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 62,
              width: 298,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(38),
                  ),
                  side: BorderSide(
                    width: 2,
                    color: red,
                  ),
                ),
                child: Text(
                  "Order Now",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
                  "300 mi",
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
                  "AWD",
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
                  "Dual Motor",
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
              "0-60 mph in 3.5s",
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
              "up to 150 mph",
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

  List _getTabs() {
    var tabList = ["", "Model S", "Model Y", "Model X", ""];
    var widgetList = [];
    for (var tab in tabList) {
      widgetList.add(Text(
        tab,
        style: TextStyle(
          fontSize: 48,
        ),
      ));
    }
    return widgetList;
  }
}
