import 'package:flutter/material.dart';

class WorldNewsScreen extends StatefulWidget {
  const WorldNewsScreen({Key? key}) : super(key: key);

  @override
  _WorldNewsScreenState createState() => _WorldNewsScreenState();
}

class _WorldNewsScreenState extends State<WorldNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.red,
            width: 150.0,
            height: 50.0,
          )
        ],
      ),
    );
  }
}
