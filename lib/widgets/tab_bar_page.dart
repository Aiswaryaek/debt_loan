// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import '../features/home/home_screen.dart';
import '../styles/colors.dart';
import '../styles/text_style.dart';

class TabViewPage extends StatefulWidget {
  const TabViewPage({Key? key}) : super(key: key);

  @override
  State<TabViewPage> createState() => _TabViewPageState();
}

class _TabViewPageState extends State<TabViewPage> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 4,
      initialIndex: tabIndex,
      child: Scaffold(
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomePage(),
            HomePage(),
            HomePage(),
            HomePage(),
          ],
        ),
        bottomNavigationBar: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicator: const BoxDecoration(
            color: tileColor,
            border: Border(
              top: BorderSide(color: roundTileColor, width: 3),
            ),
          ),
          unselectedLabelColor: roundTileColor,
          labelColor: tileHalfBlue,
          tabs: [
            Padding(
              padding: const EdgeInsets.all(9),
              child: SizedBox(
                height: 34,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/home.png', height: 18),
                    const SizedBox(height: 3),
                    Text(
                      'Home',
                      style: tabTextStyle,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9),
              child: SizedBox(
                height: 34,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/history.png', height: 18),
                    const SizedBox(height: 3),
                    Text(
                      'History',
                      style: tabTextStyle,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9),
              child: SizedBox(
                height: 34,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/articles.png', height: 18),
                    const SizedBox(height: 3),
                    Text(
                      'Articles',
                      style: tabTextStyle,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9),
              child: SizedBox(
                height: 34,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/plus_2.png', height: 18),
                    const SizedBox(height: 3),
                    Text(
                      'Add',
                      style: tabTextStyle,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
