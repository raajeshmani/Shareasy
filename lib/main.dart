import 'package:flutter/material.dart';
import 'package:shareasy/pages/home_page.dart';
import 'package:shareasy/pages/test_page.dart';
import './pages/space_page.dart';
import './theme_data.dart';
import 'package:flutter/rendering.dart';

void main() => {
//  debugPaintLayerBordersEnabled = true,
  runApp(SharEasy())};

class SharEasy extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeData,
      home: HomePage(),
      initialRoute: '/',
      routes: {
        Ui.homeRoute: (context) => HomePage(),
        Ui.spacePageRoute: (context) => SpacePage(),
      },
    );
  }
}
