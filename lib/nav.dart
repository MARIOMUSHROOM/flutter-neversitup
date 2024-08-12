import 'package:never_test/feature/home/pages/home_page.dart';
import 'package:never_test/setting/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Nav extends StatefulWidget {
  Nav({super.key, this.index = 0, this.deeplink});
  final int index;
  final String? deeplink;
  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> with TickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  TabController? tabController;
  int currentIndex = 0;
  List<Widget> pages = [
    HomePage(),
    Container(),
  ];

  tab(int value) {
    currentIndex = value;
    tabController!.animateTo(value);
    setState(() {});
  }

  deeplink() async {}

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: pages.length, vsync: this); // initialise it here
    currentIndex = widget.index;
    tabController!.animateTo(currentIndex);
    tabController!.addListener(() {
      currentIndex = tabController!.index;
      setState(() {});
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      deeplink();
      setState(() {});
    });
    // init();
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      extendBody: true,
      bottomNavigationBar: bottom(),
    );
  }

  Widget body() {
    return TabBarView(
      controller: tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: pages.map<Widget>((e) => e).toList(),
    );
  }

  Widget bottom() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: backgroundWhite,
      currentIndex: currentIndex,
      elevation: 0,
      onTap: (value) {
        tab(value);
      },
      selectedLabelStyle: GoogleFonts.kanit(),
      unselectedLabelStyle: GoogleFonts.kanit(),
      selectedItemColor: primaryColor,
      unselectedItemColor: appTextSecondaryColor,
      showUnselectedLabels: true,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: "หน้าแรก",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "แก้ไข",
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}
