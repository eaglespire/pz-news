import 'package:flutter/material.dart';
import 'package:pt_news/constants.dart';
import 'package:pt_news/screens/about_developer.dart';
import 'package:pt_news/screens/trending.dart';
import 'package:pt_news/screens/nigeria.dart';
import 'package:pt_news/screens/usa.dart';
import 'package:pt_news/screens/world.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Tab> _tabs = <Tab>[
    const Tab(
      text: 'World News',
    ),
    // const Tab(
    //   text: 'World News',
    // ),
    // const Tab(
    //   text: 'USA Today',
    // ),
    const Tab(
      text: 'Nigeria Today',
    ),
    const Tab(
      text: 'About The Developer',
    ),
  ];

  final List<Widget> _tabContents = <Widget>[
    const TrendingNewsScreen(),
    // const WorldNewsScreen(),
    // const UsaNewsScreen(),
    const NigeriaNewsScreen(),
    const AboutDeveloper(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: const Text(
            appName,
            style: appBarStyle,
          ),
          bottom: TabBar(
            labelStyle: tabBarLabelStyle,
            isScrollable: true,
            tabs: _tabs,
          ),
        ),
        body: TabBarView(
          children: _tabContents,
        ),
      ),
    );
  }
}
