import 'package:flutter/material.dart';

class UsaNewsScreen extends StatefulWidget {
  const UsaNewsScreen({Key? key}) : super(key: key);

  @override
  _UsaNewsScreenState createState() => _UsaNewsScreenState();
}

class _UsaNewsScreenState extends State<UsaNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.yellow,
            width: 150.0,
            height: 50.0,
          )
        ],
      ),
    );
  }
}
