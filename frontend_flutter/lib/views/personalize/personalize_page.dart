import 'package:flutter/material.dart';


class PersonalizeScreen extends StatelessWidget {
  const PersonalizeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personalize Message"),
      ),
    );
  }
}
