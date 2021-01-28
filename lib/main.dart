import 'package:flutter/material.dart';
import 'package:flutter_tube/api.dart';

import 'screens/home_screen.dart';

void main() {
  Api api = Api();
  api.search('flutter');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterTube',
      home: HomeScreen(),
    );
  }
}
