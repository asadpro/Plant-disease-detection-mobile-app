import 'location.dart';
import 'networking.dart';

const String apiKey = '3d6d8ca187e1d7e3828c4ba2092b61f9';
String openWeatherUrl = 'http://api.openweathermap.org/data/2.5/weather';

// https://api.openweathermap.org/data/2.5/onecall?lat=37.422&lon=-122.084&exclude=minutely,hourly,daily&appid=3d6d8ca187e1d7e3828c4ba2092b61f9

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  // String getMessage(int temp) {
  //   if (temp > 25) {
  //     return 'It\'s ๐ฆ time';
  //   } else if (temp > 20) {
  //     return 'Time for shorts and ๐';
  //   } else if (temp < 10) {
  //     return 'You\'ll need ๐งฃ and ๐งค';
  //   } else {
  //     return 'Bring a ๐งฅ just in case';
  //   }
  // }
}
