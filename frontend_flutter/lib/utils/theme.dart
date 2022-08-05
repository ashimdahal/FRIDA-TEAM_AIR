import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTheme {
  static lightTheme() {
    return ThemeData(appBarTheme:const AppBarTheme(
      elevation: 0.0,
      backgroundColor: Color.fromARGB(255, 67, 108, 49),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Color.fromARGB(255, 67, 108, 49)
      )
    ));
  }
}
