import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:plant_disease_detection/screens/location_screen.dart';
import 'package:plant_disease_detection/services/weather.dart';
import 'package:plant_disease_detection/utilities/constant.dart';

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

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => LocationScreen(
          cityNewName: weatherData,
        ),
      ),
    );
  }

  //showing snacbar for no internet connectivity

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          child: OfflineBuilder(
              connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
              ) {
                final bool connected = connectivity != ConnectivityResult.none;
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      height: 24.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        color:
                            connected ? Color(0xFF00EE44) : Color(0xFFEE4400),
                        child: Center(
                          child: Text(
                            connected ? 'ONLINE' : 'OFFLINE',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Center(
                        child: connected
                            ? SpinKitWave(
                                color: Colors.white,
                                size: 100.0,
                              )
                            : AlertDialog(
                                title: Text(
                                  'Connection Failed',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: 28),
                                ),
                                content: Text(
                                  'Check your internet connection to proceed further.',
                                  style: kMyIntro,
                                ),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                      },
                                      child: Text('Ok')),
                                ],
                              )),
                  ],
                );
              },
              child: Text('')),
        ),
      ),
    );
  }
}
