import '../services/location.dart';
import '../services/networking.dart';

const apiKey = '58a0bb3155a2056df8e5562117e31b81';
//const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/onecall';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
//api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
const openWeatherMapUrlCityName =
    'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        '$openWeatherMapUrlCityName?q=$cityName&appid=$apiKey&units=metric';
    //http://api.openweathermap.org/data/2.5/weather?q=baghdad&appid=bda7f7fe1ed57112fb02aabb2e2af7b7
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
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
    if (temp > 30) {
      return 'It\'s 🍦 time';
    } else if (temp > 25) {
      return 'Time for 👕';
    } else if (temp > 18) {
      return 'Normal weather ☘️ ';
    } else if (temp > 5) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥';
    }
  }
}
