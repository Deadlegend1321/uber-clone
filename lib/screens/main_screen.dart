import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const String screenName = "main";

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'df'
        ),
      ),
    );
  }
}
