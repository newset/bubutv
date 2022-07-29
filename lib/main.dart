import 'package:flutter/material.dart';
import 'package:bubutv/theme.dart';
import 'package:bubutv/bubutv.dart';
import './home.dart';

void main(List<String> args) {
  runApp(TVApp());
}

class TVApp extends StatefulWidget {
  TVApp({Key? key}) : super(key: key);

  @override
  State<TVApp> createState() => _TVAppState();
}

class _TVAppState extends State<TVApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Home(),
    );
  }
}
