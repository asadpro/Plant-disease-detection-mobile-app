import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:plant_disease_detection/screens/location_screen.dart';
import 'package:plant_disease_detection/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();

  }
  
  

//Checking for permission of device's location service

  Future<void> getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    // Navigator.pushNamed(context, AppRoutes.locationScreen);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => LocationScreen(
                  cityNewName: weatherData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitWave(
        color: Colors.white,
        size: 80.0,
      )),
    );
  }
}
