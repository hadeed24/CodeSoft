import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_expense_tracker/DashBoard.dart';
import 'package:personal_expense_tracker/addTransaction.dart';
import 'package:personal_expense_tracker/transactions_list.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<IconData> Iconlist = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.list,
  ];
  int page = 1;
  int pageView = 1;
  PageController pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: const Color(0xFF018D63),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 25,
          ),
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.bottomToTop,
                  child: add_transactions(),
                ),
              );
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: Iconlist,
          inactiveColor: const Color(0xFF757575),
          activeColor: const Color(0xFF018D63),
          activeIndex: page,
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.smoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          gapLocation: GapLocation.center,
          onTap: (p0) {
            setState(() {
              pageView = p0;
              pageController.animateToPage(p0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear);
            });
          },
        ),
        body: Container(
          color: Colors.deepPurple,
          child: packviewSection(),
        ),
      ),
    );
  }

  Widget packviewSection() {
    return PageView(
      controller: pageController,
      onPageChanged: (value) {
        setState(() {
          page = value;
        });
      },
      children: [
        DashBoard(),
        transactions_list(),
      ],
    );
  }
}
