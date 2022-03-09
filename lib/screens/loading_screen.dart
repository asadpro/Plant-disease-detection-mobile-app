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

    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (_) => LocationScreen(
        cityNewName: weatherData,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                Colors.blue,
                Colors.green,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: SpinKitWave(
            color: Colors.white,
            size: 100.0,
          )),
    );
  }
}
