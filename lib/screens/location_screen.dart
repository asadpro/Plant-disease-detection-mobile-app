import 'package:flutter/material.dart';
import 'package:plant_disease_detection/routes/routes.dart';
import 'package:plant_disease_detection/services/weather.dart';
import 'package:plant_disease_detection/utilities/weather_constants.dart';

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
  late String cityName;
  late int humidity;
  late num visibility;
  late num uvIndex;

  void updateUI(dynamic weatherData) {
    setState(
      () {
        if (weatherData == null) {
          temperature = 0;
          weatherIcon = 'Error';
          weatherMessage = 'Unable to get weather data';
          cityName = '';
          humidity = 0;
          uvIndex = 0;
          visibility = 0;
          return;
        }
        temperature = weatherData['main']['temp'];
        var condition = weatherData['weather'][0]['id'];
        cityName = weatherData['name'];
        humidity = weatherData['main']['humidity'];
        visibility = weatherData['visibility'] / 1000;
        uvIndex = weatherData['sys']['type'];

        weatherIcon = weatherModel.getWeatherIcon(condition);
        weatherMessage = weatherModel.getMessage(temperature.toInt());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.homePage);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 45,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
                child: Container(
                  height: 350.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey.withOpacity(0.4),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${temperature.toInt()}°C',
                              style: TextStyle(
                                  fontSize: 50.0, fontWeight: FontWeight.bold),
                            ),
                            Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  fontSize: 27,
                                  fontFamily: 'SyneMono',
                                ),
                                children: const [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.amber,
                                      size: 40,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Peshawar',
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Text(
                          cityName,
                          style: kTempTextStyle,
                        ),
                        Text(
                          weatherIcon,
                          style: kConditionTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey.withOpacity(0.4),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  height: 110.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '$humidity%\nHumidity',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '$visibility Km\nVisibility',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Low $uvIndex\nUVindex',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  '$weatherMessage in $cityName',
                  textAlign: TextAlign.left,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
