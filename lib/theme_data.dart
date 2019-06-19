import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

ThemeData themeData = ThemeData(
  primarySwatch: Colors.blue,
  primaryColor: Color(0xff247AEC),
  fontFamily: 'Google Sans',
  textTheme: TextTheme(
    title: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14.0,
    ),
  ),
);

TextStyle subtitleTheme = TextStyle(
  fontSize: 10.0,
);

class Ui {
  // Routes
  static final String homeRoute = '/HomePage';
  static final String spacePageRoute = '/SpacePage';

  static final pasteIcon = FontAwesomeIcons.paste;
  static final sendIcon = Icons.send;

  static final double cardElevation = 4.0;

  static final hintText = "Type a message here";
  static final title = 'SharEasy';
  static final TextStyle titleStyle = TextStyle(fontWeight: FontWeight.w700,fontSize: 24.0,color: dividerColor);
  static final welcomeMessage = 'Welcome to SharEasy, Create a space for yourself';
  static final TextStyle welcomeMessageStyle = TextStyle(fontSize: 14.0,);
  static final TextStyle hintStyle = TextStyle(fontWeight: FontWeight.w300,fontSize: 14.0);

  // Colors
  static final Color appBarBackgroundColor = Colors.white;
  static final Color accentColor = Color(0xff5481F7);
  static final Color dividerColor = Colors.black;
  static final Color borderColor = Color(0x4f5F6368);
  static final Color progressIndicatorColor = Color(0x4f247AEC);
  static final Color buttonColor = Color(0xff1A73E8);
  static final Color primaryColor = Color(0xff5481F7);
  static final Color snackBarColor = Color(0xff202124);

  // Gradient

  static final gradientColors = [
    // Color(0xffd399c1),
    // Color(0xff9b5acf),
    // Color(0xff611cdf),
    Color(0xffb462ff),
    Color(0xffa46cff),
    Color(0xff8780ff),
  ];

  static final buttonGradient = [
    Colors.cyan.shade400,
		Colors.blue.shade600,
  ];

  static final buttonGradient2 = [
    Color(0x9fb462ff),
    Color(0x9fa46cff),
    Color(0x9f8780ff),
  ];
}

/*
Google Blues
#247AEC
Button Blue #1A73E8
On hover #669DF6
Link #455af1
*/

/*
Linear Gradient
Purple #7253FE
Blue #1775FB
 */

/*
Googly Black
Title black #202124
Normal Text #3c4043
Grey #5F6368
*/

/*
Green #5BB974
*/
