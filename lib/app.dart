import 'package:debt_loan/widgets/tab_bar_page.dart';
import 'package:flutter/material.dart';

class FlutterBasicApp extends StatefulWidget {
  const FlutterBasicApp({Key? key}) : super(key: key);

  @override
  _FlutterBasicAppState createState() => _FlutterBasicAppState();
}

class _FlutterBasicAppState extends State<FlutterBasicApp> {
  @override
  Widget build(BuildContext context) {
    return const TabViewPage();
  }
}