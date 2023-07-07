import 'package:flutter/material.dart';
import 'package:hackaton/utils/constants.dart';

Color text = const Color.fromRGBO(50, 46, 67, 1);
Color lowTextOrIcons = const Color.fromRGBO(145, 151, 182, 1);

const double smallTextSize = 24;
const double mediumTextSize = 32;
const double largeTextSize = 40;

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: false,
      // ignore: deprecated_member_use
      androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
      //platform: TargetPlatform.iOS,
      primaryColor: mainColor,
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        iconTheme: IconThemeData(color: Color.fromRGBO(145, 156, 182, 1)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
/////////////////TEXT///////////

      textTheme: const TextTheme(
////////////Подписи под иконками чёрные

          ),
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        buttonColor: mainColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(5),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(
                color: Colors.black)), //Color.fromRGBO(222, 229, 248, 1)
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: mainColor, width: 2.0),
        ),
      ),
    );
  }
}
