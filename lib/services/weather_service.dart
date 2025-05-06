import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weahter_app/Model/weather_Model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1'; // url api access
  String apiKey = '2549f42823c141fa873202754222407'; // key using api

  //String baseUrl = 'https://www.metaweather.com';

  Future<int> getCityId({required String cityName}) async {
    Uri url = Uri.parse('$baseUrl/api/location/search/?query=$cityName');
    http.Response response = await http.get(url);
    print(response.body);
    List<dynamic> data = jsonDecode(response.body);

    int cityId = data[0]['woeid'];

    return cityId;
  }

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherModel;
    try {
      int id = await getCityId(cityName: cityName);

      Uri uri = Uri.parse('$baseUrl/api/location/$id/');
      http.Response response =
          await http.get(uri); // using function get -- storag response

      // ignore: non_constant_identifier_names, unused_local_variable
      Map<String, dynamic> DataJson = jsonDecode(response.body);
      Map<String, dynamic> data = DataJson['consolidated_weather'][0];

     weatherModel = WeatherModel.josnform(DataJson);
    } catch (e) {
      print(e);
    }

    return weatherModel;
  }
}
