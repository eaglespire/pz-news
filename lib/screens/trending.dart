import 'package:flutter/material.dart';
import 'package:pt_news/screens/categories/business.dart';
import 'package:pt_news/screens/categories/entertainment.dart';
import 'package:pt_news/screens/categories/general.dart';
import 'package:pt_news/screens/categories/sports.dart';
import 'package:pt_news/screens/categories/tech.dart';

import '../constants.dart';
import 'categories/health.dart';
import 'categories/science.dart';

class TrendingNewsScreen extends StatefulWidget {
  const TrendingNewsScreen({Key? key}) : super(key: key);

  @override
  _TrendingNewsScreenState createState() => _TrendingNewsScreenState();
}

class _TrendingNewsScreenState extends State<TrendingNewsScreen> {
  final List<Tab> _tabs = <Tab>[
    const Tab(
      text: 'General',
      icon: Icon(Icons.legend_toggle),
    ),
    const Tab(
      text: 'Sports',
      icon: Icon(Icons.sports),
    ),
    const Tab(
      text: 'Tech',
      icon: Icon(Icons.biotech),
    ),
    const Tab(
      text: 'Science',
      icon: Icon(Icons.science),
    ),
    const Tab(
      text: 'Entertainment',
      icon: Icon(Icons.theaters),
    ),
    const Tab(
      text: 'Health',
      icon: Icon(Icons.spa),
    ),
    const Tab(
      text: 'Business',
      icon: Icon(Icons.business),
    ),
  ];

  final List<Widget> _tabContents = <Widget>[
    const GeneralCategoryScreen(),
    const SportsCategoryScreen(),
    const TechCategoryScreen(),
    const ScienceCategoryScreen(),
    const EntertainmentCategoryScreen(),
    const HealthCategoryScreen(),
    const BusinessCategoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: TabBarView(
          children: _tabContents,
        ),
        bottomNavigationBar: Container(
          color: mainColor,
          child: TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            indicatorColor: Colors.blue,
            labelStyle: tabBarLabelStyle,
            tabs: _tabs,
          ),
        ),
      ),
    );
  }
}
