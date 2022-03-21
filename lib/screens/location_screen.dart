import 'package:flutter/material.dart';
import 'package:plant_disease_detection/main.dart';
import 'package:plant_disease_detection/services/weather.dart';
import 'package:plant_disease_detection/utilities/constant.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key, this.cityNewName}) : super(key: key);

  final cityNewName;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    print(widget.cityNewName);
    updateUI(widget.cityNewName);
  }

  late double temperature;
  late String weatherIcon;
  late String weatherMessage;
  late int humidity;
  late num visibility;
  late num uvIndex;
  late double wind;
  late String sky;

  void updateUI(dynamic weatherData) {
    setState(
      () {
        if (weatherData == null) {
          temperature = 0;
          weatherIcon = 'Error';
          weatherMessage = 'Unable to get weather data';
          humidity = 0;
          uvIndex = 0;
          visibility = 0;
          wind = 0;
          sky = '';

          return;
        }
        temperature = weatherData['main']['temp'];
        var condition = weatherData['weather'][0]['id'];
        humidity = weatherData['main']['humidity'];
        visibility = weatherData['visibility'] / 1000;
        wind = weatherData['wind']['speed'];
        uvIndex = weatherData['sys']['type'];
        sky = weatherData['weather'][0]['description'];

        weatherIcon = weatherModel.getWeatherIcon(condition);
      },
    );
  }

  //Accessing currenct date format
  var dt = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.6),
                      spreadRadius: 8,
                      blurRadius: 6,
                      offset: Offset(0, 8),
                    ),
                  ],
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(64), top: Radius.circular(23)),
                  color: Colors.redAccent,
                  gradient: LinearGradient(
                    colors: [
                      Colors.lightBlue,
                      Colors.lightBlueAccent,
                      Colors.blue.shade700,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                height: 600,
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                                (route) => false),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    const CircleBorder(
                              side: BorderSide(color: Colors.white),
                            ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 0),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.location_on_sharp,
                                color: Colors.amberAccent,
                                size: 35,
                              ),
                              label: Text(
                                'Peshawar',
                                style: kButtonTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                    Text(
                      '${temperature.toInt()}°C',
                      style: kTempTextStyle,
                    ),
                    Text(
                      sky.replaceFirst(sky[0], sky[0].toUpperCase()),
                      style: kMessageTextStyle,
                    ),
                    SizedBox(
                      height: 80.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xff6f52ff),
                            spreadRadius: 15,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Text(
                        '\u{1F4C5}   ${dt.day} - ${dt.month} - ${dt.year}',
                        style: kBoxTextTitle,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.6),
                        spreadRadius: 6,
                        blurRadius: 15,
                      ),
                    ],
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(12), top: Radius.circular(64)),
                    color: Colors.redAccent,
                    gradient: LinearGradient(
                      colors: [
                        Colors.lightBlue,
                        Colors.lightBlueAccent,
                        Colors.blue.shade700,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  height: 150.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.air_outlined),
                          Text(
                            '${wind}km/h',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Wind',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white54,
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.opacity_outlined),
                          Text(
                            '$humidity%',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Humidity',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white54,
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.storm_outlined),
                          Text(
                            '$visibility',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Visibility',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white54,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
