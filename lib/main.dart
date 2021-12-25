import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pt_news/constants.dart';
import 'package:pt_news/home.dart';
import 'package:pt_news/services/fetch_trending_news.dart';
import 'package:pt_news/wrapper.dart';
import 'package:http/http.dart' as http;

import 'models/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'PT NEWS APP',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<User> appUsers = [];
  final List<Color> _colors = <Color>[
    const Color(0XFF4191D6),
    const Color(0XFF83CBEC),
    const Color(0XFF5EA83C)
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const HomeScreen();
          },
        ),
      );
    });
    //getData();
    //getVals();
  }

  // void getData() async {
  //   var parsedUri = Uri.parse('https://jsonplaceholder.typicode.com/users');
  //   var response = await http.get(parsedUri);
  //   List users = jsonDecode(response.body);
  //
  //   users.forEach((element) {
  //     Map obj = element;
  //
  //     String name = obj['name'];
  //     String username = obj['username'];
  //     String email = obj['email'];
  //
  //     setState(() {
  //       appUsers.add(User(name: name, username: username));
  //     });
  //   });
  // }

  // getVals() {
  //   FetchTrendingNews _news = FetchTrendingNews();
  //   var result = _news.getTrendingArticles();
  //   print(result);
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _colors,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Stack(
            children: [
              Image.asset('assets/images/green_flower.png'),
              /* const Text(
                'Akbar',
                style: TextStyle(fontFamily: 'Akbar', fontSize: 22.0),
              ),
              const Text(
                'Dani',
                style: TextStyle(fontFamily: 'Dani', fontSize: 22.0),
              ),
              const Text(
                'Sindibad',
                style: TextStyle(fontFamily: 'Sindibad', fontSize: 22.0),
              ),
              const Text(
                'Dominica',
                style: TextStyle(fontFamily: 'Dominica', fontSize: 22.0),
              ),
              const Text(
                'Homework',
                style: TextStyle(fontFamily: 'Homework', fontSize: 22.0),
              ), */
              Positioned(
                left: width * 0.25,
                bottom: 0.0,
                child: Column(
                  children: const [
                    Text(
                      appName,
                      style:
                          TextStyle(fontFamily: 'Konspiracy', fontSize: 55.0),
                    ),
                    CircularProgressIndicator()
                  ],
                ),
              ),
              /*
              const Text(
                'Nazli',
                style: TextStyle(fontFamily: 'Nazli', fontSize: 22.0),
              ),
               */
            ],
          ),
        ),
      ),
    );
  }
}
