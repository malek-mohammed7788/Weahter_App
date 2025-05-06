import 'package:flutter/cupertino.dart';
import 'package:weahter_app/Model/weather_Model.dart';

// ignore: camel_case_types
class weatherProvider extends ChangeNotifier {
  WeatherModel? weatherDate;

  String? CityName;
  set weatherdate(WeatherModel? weather) {
    weatherDate = weather;
    notifyListeners(); // update date in object
  }

  WeatherModel? get weatherdate => weatherDate;
}
