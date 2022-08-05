import 'package:flutter/material.dart';
import 'package:frontend_flutter/utils/theme.dart';
import 'package:frontend_flutter/views/auth/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home:const  LoginPage(),
        themeMode: ThemeMode.light,
        theme: MyTheme.lightTheme(),
    );
  }
}
