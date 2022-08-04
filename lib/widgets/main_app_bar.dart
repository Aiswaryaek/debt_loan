import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/text_style.dart';

AppBar mainAppBar(BuildContext context,String text) {
  return AppBar(
    elevation: 0,
    backgroundColor: gradientEndColor,
    centerTitle: true,
    title: Text(text, style: appBarTextStyle),
    actions: [
      Image.asset('assets/images/notifications.png',height: 20,width: 20,),
      const SizedBox(width: 15,)
    ],
  );
}