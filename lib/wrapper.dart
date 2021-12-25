import 'package:flutter/material.dart';
import 'package:pt_news/screens/nigeria.dart';
import 'package:pt_news/screens/usa.dart';
import 'package:pt_news/screens/world.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int selectedIndex = 0;
  final List<Widget> _pages = <Widget>[
    const WorldNewsScreen(),
    const UsaNewsScreen(),
    const NigeriaNewsScreen()
  ];
  final List<BottomNavigationBarItem> _items = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: 'World '
            'News'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'USA Today'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: 'Nigeria'
            'News'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PZ NEWS'),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          print(index);
          setState(() {
            selectedIndex = index;
          });
        },
        items: _items,
      ),
    );
  }
}
