// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_flutter/services/auth/user_repository.dart';
import 'package:frontend_flutter/viewmodel/field/email/cubit/email_cubit.dart';
import 'package:frontend_flutter/viewmodel/field/password/cubit/password_cubit.dart';
import 'package:frontend_flutter/views/auth/signup_page.dart';
import 'package:frontend_flutter/views/home/home_page.dart';

const inputFieldBorderRadius = 6.0;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserRepository userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Padding(
              padding: EdgeInsets.only(left: size.width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.2),
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.05),
                    child: const EmailWidget(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.02),
                    child: const PasswordWidget(),
                  ),

                  /*
                  login button
                  
                  */

                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.06),
                    child: BlocBuilder<EmailCubit, EmailState>(
                      builder: (context1, state1) {
                        return BlocBuilder<PasswordCubit, PasswordState>(
                          builder: (context2, state2) {
                            return InkWell(
                              borderRadius: BorderRadius.circular(12.0),
                              onTap: () async {
                                if (state1 is EmailFieldValid &&
                                    state2 is PasswordFieldValid) {
                                  bool value =
                                      await userRepository.authenticate(
                                          email: state1.email,
                                          password: state2.password);
                                  
                                    if (value == true) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context1) =>
                                                  HomeScreen()));
                                    } else {
                                      context1
                                          .read<EmailCubit>()
                                          .onEmailChange("");
                                      context2
                                          .read<PasswordCubit>()
                                          .onPasswordChange("");
                                    }
                                }
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromARGB(90, 58, 58, 58),
                                          blurRadius: 10.0,
                                          spreadRadius: 0.0,
                                          offset: Offset(0, 2.0)),
                                      BoxShadow(
                                          color: Color.fromARGB(90, 58, 58, 58),
                                          blurRadius: 10.0,
                                          spreadRadius: 0.0,
                                          offset: Offset(0, 2.0))
                                    ],
                                    color: (state1 is EmailFieldValid &&
                                            state2 is PasswordFieldValid)
                                        ? Colors.purple
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(12.0)),
                                height: size.height * 0.06,
                                width: size.width * 0.8,
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontSize: size.height * 0.025,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  // Forgot Password Button

                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.03),
                    child: SizedBox(
                      height: size.height * 0.06,
                      width: size.width * 0.8,
                      child: TextButton(
                          onPressed: () {},
                          child:
                              const Center(child: Text("Forgot Password ?"))),
                    ),
                  ),

                  /*
                  
                  Widget that redirects to Sign Up Page
          
                  */

                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.01),
                    child: SizedBox(
                      height: size.height * 0.06,
                      width: size.width * 0.8,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpPage()));
                              },
                              child: const Text("SignUp")),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmailWidget extends StatelessWidget {
  const EmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<EmailCubit, EmailState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "E-mail",
              style: TextStyle(
                  fontSize: size.height * 0.022, fontWeight: FontWeight.w300),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: size.width * 0.1, top: size.height * 0.01),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  context.read<EmailCubit>().onEmailChange(value);
                },
                decoration: InputDecoration(
                    errorText:
                        (state is EmailFieldInvalid) ? "Invalid Email" : null,
                    prefixIcon: const Icon(Icons.email),
                    hintStyle: const TextStyle(fontWeight: FontWeight.w700),
                    hintText: "Your Email",
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(inputFieldBorderRadius)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 2, color: Colors.red),
                        borderRadius:
                            BorderRadius.circular(inputFieldBorderRadius)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 2, color: Colors.purple),
                        borderRadius:
                            BorderRadius.circular(inputFieldBorderRadius)),
                    errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(inputFieldBorderRadius))),
              ),
            )
          ],
        );
      },
    );
  }
}

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({Key? key}) : super(key: key);

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  var isShown = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<PasswordCubit, PasswordState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password",
              style: TextStyle(
                  fontSize: size.height * 0.022, fontWeight: FontWeight.w300),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: size.width * 0.1, top: size.height * 0.01),
              child: Stack(
                children: [
                  SizedBox(
                    child: TextFormField(
                      obscureText: !isShown,
                      decoration: InputDecoration(
                        errorText: (state is PasswordFieldInvalid)
                            ? "Invalid Password"
                            : null,
                        prefixIcon: const Icon(Icons.lock),
                        hintStyle: const TextStyle(fontWeight: FontWeight.w700),
                        hintText: "Your Password",
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(inputFieldBorderRadius)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 2, color: Colors.red),
                            borderRadius:
                                BorderRadius.circular(inputFieldBorderRadius)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Colors.purple),
                            borderRadius:
                                BorderRadius.circular(inputFieldBorderRadius)),
                        errorBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(inputFieldBorderRadius),
                        ),
                      ),
                      onChanged: (value) {
                        return context
                            .read<PasswordCubit>()
                            .onPasswordChange(value);
                      },
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Align(
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              isShown = !isShown;
                            });
                          },
                          child: Ink(
                              height: size.height * 0.08,
                              width: size.width * 0.15,
                              child: Center(
                                  child: isShown == true
                                      ? const Icon(CupertinoIcons.eye_solid)
                                      : const Icon(
                                          CupertinoIcons.eye_slash_fill)))),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
