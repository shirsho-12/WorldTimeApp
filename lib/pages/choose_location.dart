import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async {
    // simulate a network request for a username - async request
    String username = await Future.delayed(const Duration(seconds: 3), () {
      return "Yoshi";
    });
    String bio = await Future.delayed(const Duration(seconds: 3), () {
      return "vegan, musician, and egg collector.";
    });
    print("$username - $bio");
  }

  @override
  void initState() {
    super.initState();
    getData();
    print("Hey there");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("Choose a Location"),
        elevation: 0,
      ),
      body: const Text("choose location screen"),
    );
  }
}
