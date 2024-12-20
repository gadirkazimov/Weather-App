

import 'package:weather_app/services/networking.dart';
import '../services/location.dart';

const apiKey = 'a64ed23d5a1346e2927105907241712';
const weatherApiUrl = 'http://api.weatherapi.com/v1/current.json?key=';

class WeatherModel {


 Future <dynamic> getCityWeather(String city) async {
    NetworkHelper networkHelper = NetworkHelper('$weatherApiUrl$apiKey&q=$city&aqi=no');
    var weatherData = await networkHelper.getData();
    return weatherData;
 }

 Future<dynamic> getLocationWeather() async {

  Location location = Location();
 await location.getCurrentLocation();

 NetworkHelper networkHelper = NetworkHelper('$weatherApiUrl$apiKey&q=${location.latitude},${location.longitude}&aqi=no');

 var weatherData = await networkHelper.getData();

 return weatherData;
}








}