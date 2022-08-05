import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_flutter/utils/theme.dart';
import 'package:frontend_flutter/views/auth/login_page.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(),
    );
  }
}
