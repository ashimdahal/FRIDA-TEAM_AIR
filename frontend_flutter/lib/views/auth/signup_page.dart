import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const inputFieldBorderRadius = 6.0;


class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:const Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Padding(
            padding: EdgeInsets.only(left: size.width * 0.04,bottom: size.height*0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.05),
                  child: const FullNameWidget(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.025),
                  child: const EmailWidget(),
                ),
                 Padding(
                  padding: EdgeInsets.only(top: size.height * 0.025),
                  child: const PasswordWidget(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.025),
                  child: const LocationWidget(),
                ),
                Padding(
                    padding: EdgeInsets.only(top: size.height * 0.06),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12.0),
                      onTap: () {},
                      child: Ink(
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(12.0)),
                        height: size.height * 0.06,
                        width: size.width * 0.92,
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: size.height * 0.025,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FullNameWidget extends StatelessWidget {
  const FullNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Full Name",
          style: TextStyle(
              fontSize: size.height * 0.022, fontWeight: FontWeight.w300),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: size.width * 0.04, top: size.height * 0.01),
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                hintStyle: const TextStyle(fontWeight: FontWeight.w700),
                hintText: "Your Full Name",
                enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(inputFieldBorderRadius)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.red),
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
        ),
      ],
    );
  }
}


class EmailWidget extends StatelessWidget {
  const EmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "E-mail",
          style: TextStyle(
              fontSize: size.height * 0.022, fontWeight: FontWeight.w300),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: size.width * 0.04, top: size.height * 0.01),
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email),
                hintStyle: const TextStyle(fontWeight: FontWeight.w700),
                hintText: "Your Email",
                enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(inputFieldBorderRadius)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.red),
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
        ),
      ],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(
              fontSize: size.height * 0.022, fontWeight: FontWeight.w300),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: size.width * 0.04, top: size.height * 0.01),
          child: Stack(
            children: [
              SizedBox(
                height: size.height * 0.08,
                child: TextFormField(
                  obscureText: !isShown,
                  decoration: InputDecoration(
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
                          borderSide:
                              const BorderSide(width: 2, color: Colors.purple),
                          borderRadius:
                              BorderRadius.circular(inputFieldBorderRadius)),
                      errorBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(inputFieldBorderRadius))),
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
  }
}


class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: TextStyle(
              fontSize: size.height * 0.022, fontWeight: FontWeight.w300),
        ),
        Padding(
          padding:
             EdgeInsets.only(right: size.width * 0.04, top: size.height * 0.01),
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.location_on),
                hintStyle: const TextStyle(fontWeight: FontWeight.w700),
                hintText: "Your Location",
                enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(inputFieldBorderRadius)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.red),
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
        ),
      ],
    );
  }
}

