import 'package:flutter/material.dart';
import 'package:weahter_app/Model/weather_Model.dart';
import 'package:weahter_app/services/weather_service.dart';
import 'package:provider/provider.dart';
import 'package:weahter_app/Provider/weather_provider.dart';

// ignore: must_be_immutable
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String title = "Search";

  String? CityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title.toUpperCase()),
          centerTitle: true,
          backgroundColor: const Color(0xff900C3F),
        ),
        body: Container(
            alignment: Alignment.center,
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  cursorColor: Colors.amber,
                  onChanged: (value) {
                    CityName = value;
                  },
                  onSubmitted: (value) async {
                    CityName = value;
                    WeatherService service = WeatherService();
                    WeatherModel? weatherModel =
                        await service.getWeather(cityName: CityName!);
                    Provider.of<weatherProvider>(context, listen: false)
                        .weatherDate = weatherModel;
                    Provider.of<weatherProvider>(context, listen: false)
                        .CityName = CityName;
                    Navigator.pop(context);
                    print(weatherModel);
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 15),
                    border: const OutlineInputBorder(),
                    labelText: "Add Name City",
                    hintText: "Enter a city",
                    suffixIcon: IconButton(
                      onPressed: () async {},
                      icon: const Icon(Icons.search),
                    ),
                  ),
                ))));
  }
}
