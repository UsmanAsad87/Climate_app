import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey="4560b553b49cec1724f0d9c6f49ec699";
const openWeatherMapUrl="https://api.openweathermap.org/data/2.5/weather";
class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    var url = '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper=NetworkHelper(url: url);
    var weatherData= await networkHelper.getData();
    return weatherData;

  }
  //https://api.openweathermap.org/data/2.5/weather?lat=37.42342342342342&lon=-122.08395287867832&appid=4560b553b49cec1724f0d9c6f49ec699

  Future<dynamic> getLocationWeather() async{
    Location currentLocation= Location();
    await currentLocation.getCurrentLocation();
    NetworkHelper networkHelper=NetworkHelper(url: "$openWeatherMapUrl?lat=${currentLocation.latitute}&lon=${currentLocation.longitude}&appid=$apiKey&units=metric");
    var weatherData= await networkHelper.getData();
    print(currentLocation.latitute.toString()+ "  "+currentLocation.longitude.toString());
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
