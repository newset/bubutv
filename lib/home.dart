import 'package:flutter/material.dart';
import 'package:bubutv/bubutv.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const pages = [
    {"title": "TV"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(1, (index) {
          return Center(
            child: OutlinedButton(
              // style: const ButtonStyle(
              //   backgroundColor: Colors.blue,
              // ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TVHome()),
                );
              },
              child: const Text("BubuTV"),
            ),
          );
        }),
      ),
    );
  }
}
