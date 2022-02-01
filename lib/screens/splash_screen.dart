import 'dart:async';
import 'package:flutter/material.dart';
import 'package:plant_disease_detection/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => MyHomePage(
                title: 'Plant disease detection',
              )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 181, 241, 182),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "PLANT DISEASE DETECTION",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/splashScreen.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              width: 150.0,
              margin: EdgeInsets.only(top: 40),
              child: LinearProgressIndicator(
                minHeight: 15.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            )
          ],
        ),
      ),
    );
  }
}
