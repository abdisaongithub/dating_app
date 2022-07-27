import 'package:dating_app/Common/theme_provider.dart';
import 'package:flutter/material.dart';

class SwipeScreen extends StatefulWidget {
  static String id = 'SwipeScreen';
  const SwipeScreen({Key? key}) : super(key: key);

  @override
  _SwipeScreenState createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: Theme.of(context).custom.setupBackground,
        ),
      ),
    );
  }
}
