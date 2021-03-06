import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = '9dad2874a5d48845921c1419f3c3dad7';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apikey&units=metric';
    Networkhelper networkhelper = Networkhelper(url);
    var weatherData = networkhelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    Networkhelper networkhelper = Networkhelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    var weatherdata = await networkhelper.getData();
    return weatherdata;
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

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }

  String getWeathergif(int condition) {
    if (condition < 300) {
      return 'image/Thunderstorm.gif';
      //'๐ฉ';
    } else if (condition < 400) {
      return 'image/drizzle.gif';
      //'๐ง';
    } else if (condition < 600) {
      return 'heavy_rain.gif';
      //'โ๏ธ';
    } else if (condition < 700) {
      return 'snow-winter.gif';
      //'โ๏ธ';
    } else if (condition < 800) {
      return 'windy.gif';
      //'๐ซ';
    } else if (condition == 800) {
      return 'sun.gif';
      //'โ๏ธ';
    } else if (condition <= 804) {
      return 'cloudy.gif';
      //'โ๏ธ';
    } else {
      return 'location_background.jpg';
      //'๐คทโ';
    }
  }
}
