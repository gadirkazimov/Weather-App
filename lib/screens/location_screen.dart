import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/services/weather.dart';
import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {

  final locationWeather;

  const LocationScreen({super.key, this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int? temprerature;
  String? name;
  String? country;
  String? icon;
  double? speed;
  int? humidity;
  String? condition;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI (dynamic weatherData) {
      setState(() {
        double temp = weatherData['current']['temp_c'];
        temprerature = temp.toInt();
        name = weatherData['location']['name'];
        country = weatherData['location']['country'];
        icon = weatherData['current']['condition']['icon'];
        speed = weatherData['current']['wind_kph'];
        humidity = weatherData['current']['humidity'];
        condition = weatherData['current']['condition']['text'];
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                     var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context) => CityScreen()));
                     if (typedName != null) {
                      var weatherData = await weatherModel.getCityWeather(typedName);
                       updateUI(weatherData);
                     }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temprerature°',
                      style: kTempTextStyle,
                    ),
                    Column(
                      children: [
                        Image(image: NetworkImage('https:' + icon!,), ),
                        Text('$condition', style: kConditionTextStyle,)
                      ],
                    )

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Wind spped: $speed',style: kPropertyTextStyle

                    ),
                    Text('Humadity: $humidity', style: kPropertyTextStyle)

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$country,$name!",
                  textAlign: TextAlign.center,
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


// var country = decodedData['location']['region'];
// var tempreture = decodedData['current']['temp_c'];