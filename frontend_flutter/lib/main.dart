import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_flutter/utils/theme.dart';
import 'package:frontend_flutter/viewmodel/field/email/cubit/email_cubit.dart';
import 'package:frontend_flutter/viewmodel/field/password/cubit/password_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:frontend_flutter/views/auth/login_page.dart';
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
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<EmailCubit>(
            create: (BuildContext context) {
              return EmailCubit();
            },
          ),
          BlocProvider<PasswordCubit>(create: (BuildContext context) {
            return PasswordCubit();
          })
        ],
        child: LoginPage(),
      ),
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(),
    );
  }
}
