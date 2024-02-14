import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';
import 'package:http/http.dart' as http;

const apiKey = '7f5cf10dc98e54e40b3baaa888290af5';

class WeatherModel {
   Future<dynamic> getCityWeather(String cityName) async{

    Uri url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${apiKey}');
    Networking networking = Networking(url);
    var weatherData = await networking.getData();
    return weatherData;
  }
   Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();
    var latitude = location.latitude;
    var longitude = location.longitude;
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    Networking networking = Networking(url);
    var weatherData = await networking.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {

    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
