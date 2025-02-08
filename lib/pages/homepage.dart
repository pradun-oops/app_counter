import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int openCount = 0;
  Color bgColor = Colors.white;
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
        decoration: openCount % 3 == 0 && openCount % 5 == 0
            ? BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue, Colors.red],
                ),
              )
            : BoxDecoration(
                color: bgColor,
              ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$openCount',
              style: TextStyle(
                  fontSize: 150,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void counter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(
      () {
        openCount = prefs.getInt(OPEN_COUNT) ?? 0;
        openCount++;
        prefs.setInt(OPEN_COUNT, openCount);
        if (openCount % 3 == 0) {
          bgColor = Colors.blue;
        } else if (openCount % 5 == 0) {
          bgColor = Colors.red;
        } else {
          bgColor = Colors.white;
        }
      },
    );
  }
}
