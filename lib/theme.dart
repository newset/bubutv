import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  primarySwatch: Colors.grey,
  primaryTextTheme: const TextTheme(
    headline6: TextStyle(color: Colors.white),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    shadowColor: null,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  ),
);
