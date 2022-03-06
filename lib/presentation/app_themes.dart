import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemes {
  static final appTheme = ThemeData(
    fontFamily: 'Montserrat',
    brightness: Brightness.light,
    primaryColor: const Color(0xFFf0e4b1),
    primaryColorDark: const Color(0xFFceaf67),
    primaryColorLight: const Color(0xFFf9eed9),
    disabledColor: const Color(0xFFBCBCBC),
    scaffoldBackgroundColor: const Color(0xFFf9eed9),
    dialogBackgroundColor: const Color(0xFFf9eed9),
    canvasColor: const Color(0xFFf9eed9),
    errorColor: Colors.red,
    unselectedWidgetColor: const Color(0xFFf9eed9),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF5a3a1a),
      foregroundColor: Color(0xFFf9eed9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Color(0xFFf9eed9),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
        fontFamily: 'Montserrat',
        color: Color(0xFF5a3a1a),
      ),
      iconTheme: IconThemeData(color: Color(0xFF5a3a1a)),
      actionsIconTheme: IconThemeData(color: Color(0xFF5a3a1a)),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: const Color(0xFF5a3a1a),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),
    iconTheme: const IconThemeData(color: Color(0xFF5a3a1a), size: 20),
    //accentIconTheme: IconThemeData(color: const Color(0xFFFFEFFA), size: 16),
    //chipTheme: ChipThemeData(),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    textTheme: const TextTheme(
      headline5: TextStyle(
        color: Color(0xFF5a3a1a),
      ),
      headline6: TextStyle(
        color: Color(0xFF5a3a1a),
      ),
      subtitle1: TextStyle(
        color: Color(0xFF5a3a1a),
      ),
      subtitle2: TextStyle(
        color: Color(0xFF5a3a1a),
      ),
      bodyText1: TextStyle(
        color: Color(0xFF5a3a1a),
      ),
      bodyText2: TextStyle(
        color: Color(0xFF5a3a1a),
      ),
    ),
  );
}
