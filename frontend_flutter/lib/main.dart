import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_flutter/utils/theme.dart';
import 'package:frontend_flutter/viewmodel/field/cubit/field_cubit.dart';
import 'package:frontend_flutter/views/auth/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(providers: [
        BlocProvider<FieldCubit>(
          create: (BuildContext context) {
            return FieldCubit();
          },
        )
      ], child: const LoginPage()),
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(),
    );
  }
}
