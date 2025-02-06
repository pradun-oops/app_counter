import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int openCount = 0;
  // ignore: non_constant_identifier_names
  String OPEN_COUNT = 'openCount';
  @override
  void initState() {
    super.initState();
    counter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.purple,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$openCount',
              style: TextStyle(
                  fontSize: 150,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void counter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      openCount = prefs.getInt(OPEN_COUNT) ?? 0;
      openCount++;
      prefs.setInt(OPEN_COUNT, openCount);
    });
  }
}
