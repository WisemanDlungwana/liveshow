import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liveshow/src/pages/menu.dart';

class BottomNavBar extends StatefulWidget {
  final List<Widget> pages;
  final int initialIndex;

  const BottomNavBar({
    Key? key,
    required this.pages,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  late TabController controller;
  final GlobalKey<SlidingMenuState> _slidingMenuKey =
      GlobalKey<SlidingMenuState>(); // Use SlidingMenuState

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    ));

    controller = TabController(
      length: widget.pages.length,
      initialIndex: widget.initialIndex,
      vsync: this,
    );

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    if (index == widget.pages.length - 1) {
      // Toggle the sliding menu
      _slidingMenuKey.currentState?.toggleMenu();
    } else {
      controller.animateTo(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: TabBar(
        labelStyle: const TextStyle(fontSize: 10.0),
        indicatorWeight: 0.1,
        controller: controller,
        onTap: _onTabTapped,
        tabs: const <Widget>[
          Tab(text: 'Home', icon: Icon(Icons.home)),
          Tab(text: 'Search', icon: Icon(Icons.search)),
          Tab(text: 'Trending', icon: Icon(Icons.ondemand_video)),
          Tab(text: 'Downloads', icon: Icon(Icons.file_download)),
          Tab(text: 'Menu', icon: Icon(Icons.menu)), // Toggle the sliding menu
        ],
      ),
      body: Stack(
        children: [
          TabBarView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            children: widget.pages,
          ),
          SlidingMenu(
            key: _slidingMenuKey,
            onMenuClose: () {
              // Navigate to the previous tab (Home tab, index 0)
              controller.animateTo(0);
            },
          ), // Add the sliding menu with the key
        ],
      ),
    );
  }
}
