import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

ThemeData themeData = ThemeData(
  fontFamily: 'Google Sans',
  textTheme: TextTheme(
    title: TextStyle(
      color: Ui.titleBlackColor,
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


  //Icons
  static final keyboardIcon = FontAwesomeIcons.keyboard;
  static final pasteIcon = FontAwesomeIcons.paste;
  static final sendIcon = Icons.send;
  static final qrIcon = FontAwesomeIcons.qrcode;

  static final double cardElevation = 4.0;

  static final hintText = "Compose one";
  static final title = 'SharEasy';
  static final welcomeMessage =
      'Welcome to SharEasy, Create a space for yourself';
  static final welcomeDocumentMessage = 'Repeat A new Planet is created in the coordinates you provided';
  static final cancelText = 'Cancel';

  // Text Styles

  static final TextStyle welcomeMessageStyle = TextStyle(
    fontSize: 14.0,
  );

  static final TextStyle titleStyle = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 24.0, color: Ui.titleBlackColor);

  static final TextStyle hintStyle =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0);

  static final TextStyle buttonTextStyle =
      TextStyle(color: Ui.purpleButtonColor, fontSize: 16.0);
  
  static final TextStyle pastebuttonTextStyle =
      TextStyle(color: Ui.greyButtonColor, fontSize: 16.0);

  static final TextStyle labelStyle = TextStyle(color: Ui.purpleButtonColor);

  // Colors
  static final Color titleBlackColor = Color(0xff202124);
  static final Color appBarBackgroundColor = Colors.white;
  static final Color accentColor = Color(0xff5481F7);
  static final Color dividerColor = Color(0x2f5F6368);
  static final Color borderColor = Color(0x4f5F6368);
  static final Color progressIndicatorColor = Color(0x4f247AEC);
  static final Color greyButtonColor = Color(0xff5F6368);
  static final Color buttonColor = Color(0xff1A73E8);
  static final Color purpleButtonColor = Color(0xff7253FE);
  static final Color primaryColor = Color(0xff5481F7);
  static final Color snackBarColor = Colors.white;
  static final Color darkBacgroundColor = Color(0xff121212);
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

  static final ShapeBorder borderDefined = RoundedRectangleBorder(
      borderRadius: new BorderRadius.only(
          topLeft: new Radius.circular(5.0),
          topRight: new Radius.circular(5.0)));
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
